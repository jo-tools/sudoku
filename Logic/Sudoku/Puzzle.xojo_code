#tag Class
Protected Class Puzzle
	#tag Method, Flags = &h0
		Sub ClearGrid()
		  ' Clear the entire grid (set all cells to empty)
		  mGrid.Clear
		  mSolver.SetStateIsSolvable
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Clone() As Puzzle
		  ' Create a deep copy of this puzzle (used for solving without modifying original)
		  Return New Puzzle(mGrid.Clone)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor(grid As Grid)
		  ' Private constructor used for cloning - initializes with existing grid
		  mGrid = grid
		  mHintsSearcher = New HintsSearcher(mGrid)
		  mCandidatesSearcher = New CandidatesSearcher(mGrid)
		  mSolver = New Solver(mGrid)
		  mSolver.Invalidate
		  mRandom = New Random
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(n As Integer)
		  ' Create a new empty puzzle with the specified size N (4, 6, 8, 9, 12, or 16)
		  Var grid As New Grid(n)
		  Me.Constructor(grid)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(json As JSONItem)
		  #Pragma DisableBoundsChecking
		  
		  ' Init with JSON representation of a Sudoku Grid
		  Const kExceptionMessage = "Invalid JSON representation of a Sudoku"
		  
		  ' First, determine N from the JSON cell count
		  Var N As Integer = 0
		  Try
		    If (json = Nil) Or (Not json.HasKey(kJSONKeySudoku)) Then Raise New InvalidArgumentException(kExceptionMessage, 1)
		    Var jsonSudoku As JSONItem = json.Child(kJSONKeySudoku)
		    If (jsonSudoku = Nil) Or (Not jsonSudoku.IsArray) Then Raise New InvalidArgumentException(kExceptionMessage, 2)
		    
		    ' N*N = cellCount, so N = Sqrt(cellCount)
		    Var cellCount As Integer = jsonSudoku.Count
		    Var sqrtVal As Double = Sqrt(cellCount)
		    N = CType(sqrtVal, Integer)
		    If N * N <> cellCount Then
		      Raise New InvalidArgumentException(kExceptionMessage, 8)
		    End If
		  Catch err As JSONException
		    Raise New InvalidArgumentException(kExceptionMessage, 4)
		  Catch err As InvalidArgumentException
		    Raise err
		  Catch err As RuntimeException
		    Raise New InvalidArgumentException(kExceptionMessage, 5)
		  End Try
		  
		  Me.Constructor(N)
		  
		  Var dictSudoku As New Dictionary
		  Var loadedLockedCellIndexes() As Integer
		  
		  Try
		    Var jsonSudoku As JSONItem = json.Child(kJSONKeySudoku)
		    
		    Var row, col, value As Integer
		    Var locked As Boolean
		    For i As Integer = 0 To jsonSudoku.LastRowIndex
		      Var jsonSudokuCell As JSONItem = jsonSudoku.ChildAt(i)
		      If (jsonSudokuCell = Nil) Then
		        Continue
		      End If
		      
		      row = jsonSudokuCell.Lookup(kJSONKeySudokuCellRow, -1).IntegerValue - 1
		      col = jsonSudokuCell.Lookup(kJSONKeySudokuCellCol, -1).IntegerValue - 1
		      value = jsonSudokuCell.Lookup(kJSONKeySudokuCellValue, -1).IntegerValue
		      locked = jsonSudokuCell.Lookup(kJSONKeySudokuCellLocked, False).BooleanValue
		      
		      If (row < 0) Or (row >= N) Then
		        Continue
		      End If
		      If (col < 0) Or (col >= N) Then
		        Continue
		      End If
		      If (value < 0) Or (value > N) Then
		        Continue
		      End If
		      
		      Var index As Integer = row * N + col
		      If dictSudoku.HasKey(index) Then
		        Raise New InvalidArgumentException(kExceptionMessage, 3)
		      End If
		      
		      dictSudoku.Value(index) = value
		      If locked And (value > 0) Then loadedLockedCellIndexes.Add(index)
		    Next
		    
		  Catch err As JSONException
		    Raise New InvalidArgumentException(kExceptionMessage, 4)
		    
		  Catch err As RuntimeException
		    Raise New InvalidArgumentException(kExceptionMessage, 5)
		    
		  End Try
		  
		  ' Sanity Check
		  If (dictSudoku = Nil) Or (dictSudoku.KeyCount <> N*N) Then
		    Raise New InvalidArgumentException(kExceptionMessage, 6)
		  End If
		  
		  For i As Integer = 0 To N*N - 1
		    If (Not dictSudoku.HasKey(i)) Then
		      Raise New InvalidArgumentException(kExceptionMessage, 7)
		    End If
		  Next
		  
		  
		  ' Valid JSON to build a Sudoku
		  Me.ClearGrid
		  
		  For row As Integer = 0 To N-1
		    For col As Integer = 0 To N-1
		      Var index As Integer = row * N + col
		      Me.SetGridValue(row, col) = dictSudoku.Lookup(index, 0)
		      
		      If (loadedLockedCellIndexes.IndexOf(index) >= 0) Then
		        Me.SetGridCellLocked(row, col)
		      End If
		    Next
		  Next
		  
		  mSolver.Invalidate
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(s As String)
		  #Pragma DisableBoundsChecking
		  
		  ' Init with String representation of a Sudoku grid
		  
		  ' ------------------------------------------------------------------------------------
		  ' Supported formats (auto-detected)
		  ' - 1..N are values
		  ' - "0", ".", "_", "x", "?" are treated as empty
		  ' The parser first tries the N<=9 single-digit mode; if that does not yield a
		  ' valid N in [4..9], it falls back to the separated-token mode (N>=4, incl. N>9).
		  ' ------------------------------------------------------------------------------------
		  ' N <= 9:  Digit stream, optionally with spaces/commas/line breaks
		  ' Example: "530070000600195000..." or "500107008 008305400 ..."
		  '           → parsed character-by-character, all non-digit separators ignored
		  ' ------------------------------------------------------------------------------------
		  ' Separated-token mode (N >= 4, typically used for N > 9):
		  ' Integers separated by spaces/commas/semicolons/line breaks
		  ' Example: "1 2 3 ... 16", "1,2,3,...,16", possibly aligned with extra spaces
		  ' ------------------------------------------------------------------------------------
		  
		  Const kExceptionMessage = "Invalid String representation of a Sudoku"
		  
		  s = s.Trim
		  If (s = "") Then Raise New InvalidArgumentException(kExceptionMessage, 1)
		  
		  ' Sanity - basic length check
		  If (s.Bytes < 16) Or (s.Bytes > 8192) Then Raise New InvalidArgumentException(kExceptionMessage, 2)
		  
		  ' Normalize line endings to spaces
		  s = s.ReplaceLineEndings(" ")
		  
		  Var numbers() As Integer
		  Var N As Integer = 0
		  
		  ' Strategy: First try single-digit parsing (N<=9), ignoring all whitespace.
		  ' If that yields a valid N*N count with all values in [0,N], use it.
		  ' Otherwise, try space/comma-separated parsing for N>9.
		  
		  ' Attempt 1: Single-digit format (N<=9), ignore all whitespace
		  Var singleDigitNumbers() As Integer
		  For pos As Integer = 0 To s.Length - 1
		    Var currentChar As String = s.Middle(pos, 1)
		    
		    Select Case currentChar
		    Case "0", ".", "_", "x", "?"
		      ' Common representations for empty cells
		      singleDigitNumbers.Add(0)
		    Case "1" To "9"
		      singleDigitNumbers.Add(currentChar.ToInteger)
		    Else
		      ' All other characters (spaces, commas, etc.) are ignored
		    End Select
		  Next
		  
		  ' Check if single-digit parsing yields a valid Sudoku size
		  Var singleDigitCount As Integer = singleDigitNumbers.Count
		  Var sqrtSingle As Double = Sqrt(singleDigitCount)
		  Var nSingle As Integer = CType(sqrtSingle, Integer)
		  
		  If (nSingle * nSingle = singleDigitCount) And (nSingle >= 4) And (nSingle <= 9) Then
		    ' Valid N<=9 grid, verify all values are in range
		    Var allValid As Boolean = True
		    For i As Integer = 0 To singleDigitNumbers.LastIndex
		      If singleDigitNumbers(i) < 0 Or singleDigitNumbers(i) > nSingle Then
		        allValid = False
		        Exit
		      End If
		    Next
		    
		    If allValid Then
		      numbers = singleDigitNumbers
		      N = nSingle
		    End If
		  End If
		  
		  ' Attempt 2: Space/comma-separated format (for N>9 or if single-digit failed)
		  If N = 0 Then
		    ' Replace commas or semicolons with spaces and split
		    Var sSep As String = s.ReplaceAll(",", " ").ReplaceAll(";", " ")
		    Var parts() As String = sSep.Split(" ")
		    Var separatedNumbers() As Integer
		    
		    For Each part As String In parts
		      part = part.Trim
		      If (part = "") Then Continue
		      
		      Var value As Integer = part.ToInteger
		      ' "0" returns 0, non-numeric also returns 0 but we accept 0 as empty cell
		      
		      If (value > 0) Then
		        separatedNumbers.Add(value)
		      Else
		        Select Case part
		        Case "0", "00", ".", "..", "_", "__", "x", "xx", "?", "??"
		          ' Common representations for empty cells
		          separatedNumbers.Add(0)
		        End Select
		      End If
		    Next
		    
		    ' Check if separated parsing yields a valid Sudoku size
		    Var sepCount As Integer = separatedNumbers.Count
		    Var sqrtSep As Double = Sqrt(sepCount)
		    Var nSep As Integer = CType(sqrtSep, Integer)
		    
		    If (nSep * nSep = sepCount) And (nSep >= 4) Then
		      ' Verify all values are in range
		      Var allValid As Boolean = True
		      For i As Integer = 0 To separatedNumbers.LastIndex
		        If separatedNumbers(i) < 0 Or separatedNumbers(i) > nSep Then
		          allValid = False
		          Exit
		        End If
		      Next
		      
		      If allValid Then
		        numbers = separatedNumbers
		        N = nSep
		      End If
		    End If
		  End If
		  
		  ' Final validation
		  If N = 0 Or numbers.Count <> N * N Then
		    Raise New InvalidArgumentException(kExceptionMessage, 3)
		  End If
		  
		  ' Now we know N, construct the grid
		  Me.Constructor(N)
		  
		  ' Valid String to build a Sudoku
		  Me.ClearGrid
		  
		  For row As Integer = 0 To N-1
		    For col As Integer = 0 To N-1
		      Var index As Integer = row * N + col
		      Me.SetGridValue(row, col) = numbers(index)
		    Next
		  Next
		  
		  mSolver.Invalidate
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawInto(g As Graphics, addSolution As Boolean)
		  ' Render the puzzle to a Graphics context (for PDF export)
		  ' If addSolution is True, includes a smaller solution grid below
		  
		  g.DrawingColor = Color.Black
		  
		  ' Heights
		  Var topBottomMargin As Double = g.Height * 0.1
		  Var sudokuHeight As Double = g.Height * 0.5
		  Var top As Double = topBottomMargin
		  
		  ' Sudoku Title
		  Var title As String = "Sudoku"
		  // This will not show any Text at all on Linux/WebApp
		  // So just use the Default Font for now...
		  // g.FontName = PDFDocument.StandardFontNames.Helvetica
		  g.FontUnit = FontUnits.Point
		  g.FontSize = 18
		  g.Bold = True
		  g.DrawText(title, (g.Width - g.TextWidth(title)) / 2.0, top + g.FontAscent)
		  
		  Var titleHeight As Double = g.TextHeight * 1.5
		  top = top + titleHeight
		  sudokuHeight = sudokuHeight - titleHeight
		  
		  ' Main grid size and position
		  Var gridSize As Double = sudokuHeight
		  Var gridX As Double = (g.Width - gridSize) / 2.0
		  Var gridY As Double = top
		  
		  ' Draw current Sudoku
		  Me.DrawSudokuInternal(g, gridX, gridY, gridSize, True)
		  
		  top = top + sudokuHeight
		  
		  ' Author
		  Var author As String = kURL_Repository
		  // This will not show any Text at all on Linux/WebApp
		  // So just use the Default Font for now...
		  // g.FontName = PDFDocument.StandardFontNames.Helvetica
		  g.FontUnit = FontUnits.Point
		  g.FontSize = 8
		  g.Bold = False
		  #If (TargetWeb or TargetConsole) And TargetLinux Then
		    // Alignment on (headless) Linux is totally wrong
		    // So just use some Default Values for now
		    Var gTextWidth As Double = 118.0
		    Var gTextHeight As Double = 9.0
		    Var gFontAscent As Double = 6.0
		    g.DrawText(author, (g.Width - gTextWidth) / 2.0, top + gFontAscent + gTextHeight)
		  #Else
		    g.DrawText(author, (g.Width - g.TextWidth(author)) / 2.0, top + g.FontAscent + g.TextHeight)
		  #EndIf
		  
		  If (Not addSolution) Then Return
		  
		  ' Solution (on a clone, in order not to modify this Sudoku's state)
		  If Me.IsSolved Then Return
		  Var clone As Puzzle = me.Clone
		  Var hasSolution As Boolean = clone.Solve
		  If (Not hasSolution) Then Return
		  
		  ' Heights
		  sudokuHeight = g.Height * 0.15
		  top = g.Height - topBottomMargin - sudokuHeight
		  
		  ' Solution Title
		  title = kSolution
		  g.FontSize = 12
		  g.Bold = False
		  #If (TargetWeb or TargetConsole) And TargetLinux Then
		    // Alignment on (headless) Linux is totally wrong
		    // So just use some Default Values for now (not respecting Text localization, too...)
		    gTextWidth = kSolutionPdfTextWidth
		    gTextHeight = 13.0
		    gFontAscent = 9.0
		    g.DrawText(title, (g.Width - gTextWidth) / 2.0, top + gFontAscent)
		    titleHeight = gTextHeight * 1.5
		  #Else
		    g.DrawText(title, (g.Width - g.TextWidth(title)) / 2.0, top + g.FontAscent)
		    titleHeight = g.TextHeight * 1.5
		  #EndIf
		  top = top + titleHeight
		  sudokuHeight = sudokuHeight - titleHeight
		  
		  gridSize = sudokuHeight
		  gridX = (g.Width - gridSize) / 2.0
		  gridY = top
		  
		  clone.DrawSudokuInternal(g, gridX, gridY, gridSize, False)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawSudokuInternal(g As Graphics, topLeftX As Double, topLeftY As Double, sizePoints As Double, isPuzzle As Boolean)
		  ' Internal method to draw the Sudoku grid at the specified position and size
		  
		  Var N As Integer = mGrid.Settings.N
		  Var boxWidth As Integer = mGrid.Settings.BoxWidth
		  Var boxHeight As Integer = mGrid.Settings.BoxHeight
		  
		  Var cell As Double = sizePoints / N
		  
		  ' Thin grid lines
		  g.PenSize = If(isPuzzle, 0.5, 0.25)
		  g.DrawingColor = Color.DarkGray
		  For i As Integer = 1 To N - 1
		    Var x As Double = topLeftX + i * cell
		    g.DrawLine(x, topLeftY, x, topLeftY + sizePoints)
		    Var y As Double = topLeftY + i * cell
		    g.DrawLine(topLeftX, y, topLeftX + sizePoints, y)
		  Next
		  
		  ' Thicker block separators (inside) - vertical lines at BoxWidth intervals, horizontal at BoxHeight
		  g.PenSize = If(isPuzzle, 1.0, 0.5)
		  g.DrawingColor = Color.Black
		  For i As Integer = boxWidth To N - 1 Step boxWidth
		    Var x As Double = topLeftX + i * cell
		    g.DrawLine(x, topLeftY, x, topLeftY + sizePoints)
		  Next
		  For i As Integer = boxHeight To N - 1 Step boxHeight
		    Var y As Double = topLeftY + i * cell
		    g.DrawLine(topLeftX, y, topLeftX + sizePoints, y)
		  Next
		  
		  ' Outer border drawn last (to cover overlaps)
		  g.PenSize = If(isPuzzle, 2.0, 1.0)
		  g.DrawRectangle(topLeftX - g.PenSize/2, topLeftY - g.PenSize/2, sizePoints + g.PenSize, sizePoints + g.PenSize)
		  
		  ' Draw digits (centered)
		  g.FontUnit = FontUnits.Point
		  // This will not show any Text at all on Linux/WebApp
		  // So just use the Default Font for now...
		  // g.FontName = PDFDocument.StandardFontNames.Helvetica
		  g.Bold = isPuzzle 'not bold for solution
		  
		  For row As Integer = 0 To N - 1
		    For col As Integer = 0 To N - 1
		      Var value As Integer = mGrid.Get(row, col)
		      If value <> 0 Then
		        Var s As String = value.ToString
		        ' Choose font size relative to cell
		        g.FontSize = cell * 0.6
		        Var w As Double = g.TextWidth(s)
		        Var h As Double = g.TextHeight(s, cell)
		        Var ascent As Double = g.FontAscent
		        
		        #If (TargetWeb Or TargetConsole) And TargetLinux Then
		          // Alignment on (headless) Linux is totally wrong
		          // So just use some Default Values for now (not respecting Text localization, too...)
		          If (g.FontSize < 8.0) Then
		            w = 4.0
		            h = 8.0
		            ascent = 6.0
		          End If
		        #EndIf
		        
		        ' Compute left and baseline to center horizontally and vertically
		        Var xText As Double = topLeftX + col * cell + (cell - w) / 2.0
		        Var centerY As Double = topLeftY + row * cell + cell / 2.0
		        Var baselineY As Double = centerY + ascent - (h / 2.0)
		        
		        g.DrawText(s, xText, baselineY)
		      End If
		    Next
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GenerateRandomPuzzle(numClues As Integer = 32) As Boolean
		  ' Generate a random Sudoku puzzle using DLX (Dancing Links / Algorithm X).
		  ' This is significantly faster than backtracking, especially for larger sizes (N=12, N=16).
		  '
		  ' Process:
		  ' 1. Generate a complete random valid solution using DLX
		  ' 2. Remove cells while maintaining unique solution
		  '
		  ' Parameters:
		  ' - numClues: Target number of clues (may be more if uniqueness requires it)
		  '
		  ' Returns:
		  ' - True on success (reached target clue count)
		  ' - False if not enough cells could be removed while keeping uniqueness
		  ' - Note: Always contains a valid puzzle, even if returning False
		  
		  #Pragma DisableBoundsChecking
		  
		  Var N As Integer = mGrid.Settings.N
		  Var NN As Integer = N * N
		  
		  ' Sanitize numClues
		  If numClues < 1 Then numClues = 1
		  If numClues > NN Then numClues = NN
		  
		  ' Step 1: Generate a complete valid solution using DLX
		  If Not mSolver.GenerateRandomSolution Then
		    Return False
		  End If
		  
		  ' Step 2: Remove cells to target numClues while maintaining unique solution
		  
		  ' Build shuffled list of cell indices
		  Var indices() As Integer
		  Redim indices(NN - 1)
		  For i As Integer = 0 To NN - 1
		    indices(i) = i
		  Next
		  
		  ' Fisher-Yates shuffle for random removal order
		  For i As Integer = NN - 1 DownTo 1
		    Var j As Integer = mRandom.InRange(0, i)
		    Var tmp As Integer = indices(i)
		    indices(i) = indices(j)
		    indices(j) = tmp
		  Next
		  
		  ' Try to remove cells
		  Var targetRemovals As Integer = NN - numClues
		  Var removed As Integer = 0
		  
		  For Each idx As Integer In indices
		    If removed >= targetRemovals Then Exit
		    
		    Var row As Integer = idx \ N
		    Var col As Integer = idx Mod N
		    Var backup As Integer = mGrid.Get(row, col)
		    If backup = 0 Then Continue
		    
		    ' Try removing this cell
		    mGrid.Set(row, col) = 0
		    
		    ' Check if puzzle still has unique solution using DLX
		    If mSolver.CountSolutions(2) = 1 Then
		      removed = removed + 1
		    Else
		      ' Restore - removal would create multiple solutions
		      mGrid.Set(row, col) = backup
		    End If
		  Next
		  
		  mSolver.SetStateIsSolvable
		  
		  If removed < targetRemovals Then
		    ' Could not remove enough cells while keeping uniqueness.
		    ' Accept the puzzle with more clues than requested.
		    Break ' Debug breakpoint
		    Return False
		  End If
		  
		  ' Done - grid now contains the generated puzzle
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCellCandidates(exclusionParams As Sudoku.ExclusionParams) As CellCandidates()
		  ' Get possible candidate values for all empty cells with optional exclusion strategies
		  Return mCandidatesSearcher.Get(exclusionParams)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCellHints() As CellHint()
		  ' Get hints for cells that can be solved with Naked Singles or Hidden Singles
		  Return mHintsSearcher.GetCellHints
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetGridSettings() As Grid.Settings
		  ' Get the grid settings (N, BoxWidth, BoxHeight)
		  Return mGrid.Settings
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetGridValue(row As Integer, col As Integer) As Integer
		  ' Get the value at the specified position (0 = empty, 1-N = digit)
		  Return mGrid.Get(row, col)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsEmpty() As Boolean
		  ' Check if the entire puzzle is empty (no values entered)
		  Return mGrid.IsEmpty
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsGridCellLocked(row As Integer, col As Integer) As Boolean
		  ' Check if a cell is locked (a given that cannot be changed by the user)
		  Return mGrid.IsGridCellLocked(row, col)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsSolvable() As Boolean
		  ' Check if the puzzle has at least one valid solution
		  Return mSolver.IsSolvable
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsSolved() As Boolean
		  ' Check if the puzzle is completely and correctly solved.
		  ' Returns True if all cells are filled and follow Sudoku rules.
		  
		  ' Ensure current filled-in digits are valid
		  If Not mGrid.IsValid Then Return False
		  
		  ' And no empty cells left
		  If mGrid.HasEmptyCells Then Return False
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsValid() As Boolean
		  ' Check if the current state follows basic Sudoku rules (no duplicates)
		  Return mGrid.IsValid
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LockCurrentState()
		  ' Lock current state (used for Export in API only)
		  mGrid.LockCurrentState
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SaveTo(f As FolderItem, application As JSONItem) As Boolean
		  ' Save to FolderItem (as JSON)
		  ' Note: Raises an Exception on failure
		  
		  ' Write File
		  Var json As JSONItem = Me.ToJson(application, False)
		  
		  Var jsonOptions As New JSONOptions
		  jsonOptions.Compact = False
		  
		  Var t As TextOutputStream = TextOutputStream.Create(f)
		  t.Encoding = Encodings.UTF8
		  t.Delimiter = EndOfLine.UNIX
		  t.Write(json.ToString(jsonOptions))
		  t.Close
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetGridCellLocked(index As Integer)
		  ' Lock a cell by its linear index (mark as a given)
		  mGrid.Lock(index)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetGridCellLocked(row As Integer, col As Integer)
		  ' Lock a cell by row and column (mark as a given)
		  mGrid.Lock(row, col)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetGridValue(row As Integer, col As Integer, Assigns value As Integer)
		  ' Set the value at the specified position and invalidate solver cache
		  mGrid.Set(row, col) = value
		  mSolver.Invalidate
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Solve() As Boolean
		  ' Solve the puzzle, filling in all empty cells. Returns True on success.
		  Return mSolver.Solve
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SolveEnabled() As Boolean
		  ' Check if the Solve button should be enabled (enough clues present)
		  Return mSolver.SolveEnabled
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToJson(application As JSONItem, addSolution As Boolean) As JSONItem
		  ' Export the puzzle as JSON, optionally including the solution
		  
		  #Pragma DisableBoundsChecking
		  
		  Var N As Integer = mGrid.Settings.N
		  Var jsonSudoku As New JSONItem("[]")
		  
		  For row As Integer = 0 To N-1
		    For col As Integer = 0 To N-1
		      Var index As Integer = row * N + col
		      
		      Var jsonSudokuCell As New JSONItem
		      jsonSudokuCell.Value(kJSONKeySudokuCellRow) = row+1
		      jsonSudokuCell.Value(kJSONKeySudokuCellCol) = col+1
		      jsonSudokuCell.Value(kJSONKeySudokuCellIndex) = index
		      jsonSudokuCell.Value(kJSONKeySudokuCellValue) = mGrid.Get(row, col)
		      jsonSudokuCell.Value(kJSONKeySudokuCellLocked) = mGrid.IsGridCellLocked(row, col)
		      
		      jsonSudoku.Add(jsonSudokuCell)
		    Next
		  Next
		  
		  Var json As New JSONItem
		  If (application <> Nil) Then
		    json.Value(kJSONKeyApplication) = application
		  End If
		  json.Value(kJSONKeySudoku) = jsonSudoku
		  
		  If (Not addSolution) Then Return json
		  
		  ' Solution (on a clone, in order not to modify this Sudoku's state)
		  Var clone As Puzzle = Me.Clone
		  Var hasSolution As Boolean = clone.Solve
		  
		  If hasSolution Then
		    clone.LockCurrentState
		    Var jsonOfSolution As JSONItem = clone.ToJson(Nil, False)
		    Var jsonSolution As JSONItem = jsonOfSolution.Value(kJSONKeySudoku)
		    
		    json.Value(kJSONKeySolution) = jsonSolution
		  Else
		    json.Value(kJSONKeySolution) = Nil
		  End If
		  
		  Return json
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  ' Export the puzzle as a string (single-digit for N<=9, space-separated for N>9)
		  
		  #Pragma DisableBoundsChecking
		  
		  Var N As Integer = mGrid.Settings.N
		  
		  ' For N>9, use space-separated format to handle multi-digit values
		  Var separator As String = If(N > 9, " ", "")
		  
		  Var rows() As String
		  For row As Integer = 0 To N-1
		    Var cols() As String
		    
		    For col As Integer = 0 To N-1
		      If (N > 9) Then
		        cols.Add(Format(mGrid.Get(row, col), "00"))
		      Else
		        cols.Add(mGrid.Get(row, col).ToString)
		      End If
		    Next
		    
		    rows.Add(String.FromArray(cols, separator))
		  Next
		  
		  Return String.FromArray(rows, EndOfLine.UNIX)
		  
		End Function
	#tag EndMethod


	#tag Note, Name = Puzzle
		' ============================================================================
		' Sudoku Puzzle
		' ============================================================================
		'
		' Main class for managing and interacting with Sudoku puzzles.
		' Provides:
		' - Implementation of Dancing Links (DLX) - Knuth's Algorithm X for
		'   puzzle generation and solving
		' - Hint detection and candidate analysis
		' - Import and export capabilities (JSON, string, PDF)
		'
		' ============================================================================
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private mCandidatesSearcher As CandidatesSearcher
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGrid As Grid
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHintsSearcher As HintsSearcher
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRandom As Random
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSolver As Solver
	#tag EndProperty


	#tag Constant, Name = kJSONKeySolution, Type = String, Dynamic = False, Default = \"solution", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kJSONKeySudoku, Type = String, Dynamic = False, Default = \"sudoku", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kJSONKeySudokuCellCol, Type = String, Dynamic = False, Default = \"col", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kJSONKeySudokuCellIndex, Type = String, Dynamic = False, Default = \"index", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kJSONKeySudokuCellLocked, Type = String, Dynamic = False, Default = \"locked", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kJSONKeySudokuCellRow, Type = String, Dynamic = False, Default = \"row", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kJSONKeySudokuCellValue, Type = String, Dynamic = False, Default = \"value", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSolutionPdfTextWidth, Type = Double, Dynamic = False, Default = \"44.0", Scope = Private
		#Tag Instance, Platform = Any, Language = de, Definition  = \"39.0"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"44.0"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"46.0"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

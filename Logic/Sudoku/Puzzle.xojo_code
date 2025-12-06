#tag Class
Protected Class Puzzle
	#tag Method, Flags = &h0
		Sub ClearGrid()
		  mGrid.Clear
		  mSolver.SetStateIsSolvable
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Clone() As Puzzle
		  Return New Puzzle(mGrid.Clone)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor(grid As Grid)
		  mGrid = grid
		  mHintsSearcher = New HintsSearcher(mGrid)
		  mCandidatesSearcher = New CandidatesSearcher(mGrid)
		  mSolver = New Solver(mGrid)
		  mSolver.Invalidate
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(n As Integer)
		  Var grid As New Grid(n)
		  Me.Constructor(grid)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(json As JSONItem)
		  #Pragma DisableBackgroundTasks
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
		  #Pragma DisableBackgroundTasks
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
		      If (part = "0") Or (value > 0) Then
		        separatedNumbers.Add(value)
		      Else
		        Select Case part
		        Case "0", ".", "_", "x", "?"
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
		  ' Generate a Random Puzzle
		  ' Aim to have the number of clues according to parameter
		  ' Returns True on success
		  ' Returns False if not enough cells could be removed while keeping uniqueness
		  ' Note: Always contains a new puzzle, even if returning False
		  
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  Var Rnd As New Random
		  Var N As Integer = mGrid.Settings.N
		  
		  ' Sanitize numClues
		  If numClues < 1 Then numClues = 1
		  If numClues > N*N Then numClues = N*N
		  
		  Var isInitSolved As Boolean = False
		  while (not isInitSolved)
		    mGrid.Clear
		    
		    ' Place a random Number
		    mGrid.Set(Rnd.InRange(0, N-1), Rnd.InRange(0, N-1)) = Rnd.InRange(1, N)
		    
		    ' Start with a valid, solved grid
		    isInitSolved = Me.GenerateRandomPuzzleSolve
		  Wend
		  
		  ' Shuffle Digits to get a different-looking solved grid
		  Var perm() As Integer
		  ReDim perm(N)
		  For i As Integer = 1 To N
		    perm(i) = i
		  Next
		  
		  ' Fisher-Yates shuffle
		  For i As Integer = N DownTo 2
		    Var j As Integer = Rnd.InRange(1, i)
		    Var tmp As Integer = perm(i)
		    perm(i) = perm(j)
		    perm(j) = tmp
		  Next
		  
		  ' Apply the permutation to create a randomized solution copy
		  Var solution(-1, -1) As Integer
		  ReDim solution(N-1, N-1)
		  For row As Integer = 0 To N-1
		    For col As Integer = 0 To N-1
		      Var value As Integer = mGrid.Get(row, col)
		      If value >= 1 And value <= N Then
		        solution(row, col) = perm(value)
		      Else
		        solution(row, col) = 0
		      End If
		    Next
		  Next
		  
		  ' Put the permuted solution back into grid
		  For row As Integer = 0 To N-1
		    For col As Integer = 0 To N-1
		      mGrid.Set(row, col) = solution(row, col)
		    Next
		  Next
		  
		  ' Build indices for cells to be removed and shuffle them
		  Var indices() As Integer
		  Redim indices(N*N-1)
		  For i As Integer = 0 To N*N-1
		    indices(i) = i
		  Next
		  
		  ' Fisher-Yates shuffle
		  For i As Integer = N*N-1 DownTo 1
		    Var j As Integer = Rnd.InRange(0, i)
		    Var tmpIndex As Integer = indices(i)
		    indices(i) = indices(j)
		    indices(j) = tmpIndex
		  Next
		  
		  ' Remove cells while keeping unique solution
		  Var removeCount As Integer = N*N - numClues
		  Var removed As Integer = 0
		  
		  For i As Integer = 0 To indices.LastIndex
		    If removed >= removeCount Then Exit ' we're done
		    
		    Var idx As Integer = indices(i)
		    Var rr As Integer = idx \ N
		    Var cc As Integer = idx Mod N
		    Var backup As Integer = mGrid.Get(rr, cc)
		    
		    ' Skip already-empty cells (shouldn't happen - just to be safe)
		    If backup = 0 Then Continue
		    
		    ' Try removing
		    mGrid.Set(rr, cc) = 0
		    
		    ' If the puzzle still has exactly 1 solution, accept the removal
		    If mSolver.CountSolutions(2) = 1 Then
		      removed = removed + 1
		    Else
		      ' Not unique solution, restore the value and try to remove another
		      mGrid.Set(rr, cc) = backup
		    End If
		  Next
		  
		  mSolver.SetStateIsSolvable
		  
		  If removed < removeCount Then
		    ' Could not remove enough cells while keeping uniqueness.
		    ' Let's just accept the puzzle with more clues than requested...
		    ' Otherwise we'd need to do repeated passes (retry with a new shuffle)
		    ' until the target is reached or a max attempt count is exhausted
		    Break ' Just to show this information in Debug Builds
		    Return False
		  End If
		  
		  ' Done — grid now contains the generated puzzle (numClues non-zero cells)
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GenerateRandomPuzzleSolve() As Boolean
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  ' We don't use the .Solve method here because trying to figure out
		  ' best strategies is actually slower with just a random number placed
		  '
		  ' Additionally we always generate random order for the tries
		  ' to create a more random new 
		  
		  Var row As Integer
		  Var col As Integer
		  
		  ' Find the next empty cell
		  ' If there are no empty cells left, the puzzle is solved
		  If Not mGrid.FindEmpty(row, col) Then
		    Return True
		  End If
		  
		  ' Try all possible numbers (1-N) for this empty cell in random order
		  For Each value As Integer In Me.GenerateRandomValues
		    ' Check if placing value here is allowed by Sudoku rules
		    If mGrid.IsValueValid(row, col, value) Then
		      ' Tentatively place value in the cell
		      mGrid.Set(row, col) = value
		      
		      ' Recursively attempt to solve the rest of the grid
		      If GenerateRandomPuzzleSolve() Then
		        ' Success! If the recursive call returns True, the puzzle is solved
		        ' Propagate success back up the recursion chain
		        Return True
		      End If
		      
		      ' Backtracking
		      ' If recursion returned False, this value led to a dead end
		      ' Undo the move before trying the next number in this cell
		      mGrid.Set(row, col) = 0
		    End If
		  Next
		  
		  ' All numbers 1-N failed in this cell
		  ' Signal to the previous recursive call that it must backtrack
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GenerateRandomValues() As Integer()
		  ' We want to solve by trying random numbers
		  ' to get a random Sudoku built
		  
		  Var valuesInRandomOrder() As Integer
		  For i As Integer = 1 To mGrid.Settings.N
		    valuesInRandomOrder.Add(i)
		  Next
		  
		  ' Shuffle using Fisher-Yates
		  Var Rnd As New Random
		  For i As Integer = valuesInRandomOrder.LastIndex DownTo 1
		    Var j As Integer = Rnd.InRange(0, i)
		    Var tmp As Integer = valuesInRandomOrder(i)
		    valuesInRandomOrder(i) = valuesInRandomOrder(j)
		    valuesInRandomOrder(j) = tmp
		  Next
		  
		  Return valuesInRandomOrder
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCellCandidates(exclusionParams As Sudoku.ExclusionParams) As CellCandidates()
		  Return mCandidatesSearcher.Get(exclusionParams)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCellHints() As CellHint()
		  Return mHintsSearcher.GetCellHints
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetGridSettings() As Grid.Settings
		  Return mGrid.Settings
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetGridValue(row As Integer, col As Integer) As Integer
		  Return mGrid.Get(row, col)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsEmpty() As Boolean
		  Return mGrid.IsEmpty
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsGridCellLocked(row As Integer, col As Integer) As Boolean
		  Return mGrid.IsGridCellLocked(row, col)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsSolvable() As Boolean
		  Return mSolver.IsSolvable
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsSolved() As Boolean
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  ' Ensure current filled-in digits are valid
		  If (Not mSolver.IsValidBasicSudokuRules) Then Return False
		  
		  ' And no empty cells left
		  If mGrid.HasEmptyCells Then Return False
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsValid() As Boolean
		  Return mSolver.IsValidBasicSudokuRules
		  
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
		  mGrid.Lock(index)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetGridCellLocked(row As Integer, col As Integer)
		  mGrid.Lock(row, col)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetGridValue(row As Integer, col As Integer, Assigns value As Integer)
		  mGrid.Set(row, col) = value
		  mSolver.Invalidate
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Solve() As Boolean
		  Return mSolver.Solve
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SolveEnabled() As Boolean
		  Return mSolver.SolveEnabled
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToJson(application As JSONItem, addSolution As Boolean) As JSONItem
		  #Pragma DisableBackgroundTasks
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
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  Var N As Integer = mGrid.Settings.N
		  
		  ' For N>9, use space-separated format to handle multi-digit values
		  Var separator As String = If(N > 9, " ", "")
		  
		  Var rows() As String
		  For row As Integer = 0 To N-1
		    Var cols() As String
		    
		    For col As Integer = 0 To N-1
		      cols.Add(mGrid.Get(row, col).ToString)
		    Next
		    
		    rows.Add(String.FromArray(cols, separator))
		  Next
		  
		  Return String.FromArray(rows, EndOfLine.UNIX)
		  
		End Function
	#tag EndMethod


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

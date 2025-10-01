#tag Class
Protected Class SudokuTool
	#tag Method, Flags = &h0
		Sub ClearGrid()
		  ' Fill entire grid with 0's
		  Redim grid(N-1, N-1)
		  For r As Integer = 0 To N-1
		    For c As Integer = 0 To N-1
		      grid(r, c) = 0
		    Next
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  ClearGrid
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(clone As SudokuTool)
		  ' Init with state of passed-in Sudoku-grid
		  Redim grid(N-1, N-1)
		  For r As Integer = 0 To N-1
		    For c As Integer = 0 To N-1
		      grid(r, c) = clone.GetGridCell(r, c)
		    Next
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CountSolutions(limit As Integer = 2) As Integer
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  Var startStackCount As Integer = solveStack.Count
		  
		  ' Apply deterministic steps
		  While SolveApplyDeterministicSteps
		    ' Once applied, maybe there are new ones,
		    ' so loop until nothing can be applied any longer
		  Wend
		  
		  ' Check if solved just with deterministic steps
		  Var row, col As Integer
		  If (Not FindEmpty(row, col)) Then
		    ' Count as one solution
		    SolveUndoTo(startStackCount)
		    Return 1
		  End If
		  
		  ' Now we don't have any more cells to fill out with a certain value.
		  ' Let's start to guess the remaining empty cell's values...
		  
		  Var deterministicStepsStackCount As Integer = solveStack.Count
		  
		  ' Find to-be-solved cells with the least possible candidate values
		  Var bestRow As Integer = -1
		  Var bestCol As Integer = -1
		  Dim bestCandidates() As Integer
		  
		  If (Not Me.SolveFindBestNextCell(bestRow, bestCol, bestCandidates)) Then
		    ' Invalid State - Rollback entirely and backtrack
		    SolveUndoTo(startStackCount)
		    Return 0
		  End If
		  
		  
		  If (bestRow < 0) Or (bestCol < 0) Then
		    ' Nothing more to solve
		    ' Count as one solution
		    SolveUndoTo(startStackCount)
		    Return 1
		  End If
		  
		  ' Try the cell candidates (in the cell with the least possible candidates)
		  Var total As Integer = 0
		  For Each Val As Integer In bestCandidates
		    ' Tentatively place 'val' in the cell
		    Me.SolveApplyMove(Me.CreateSolveMove(bestRow, bestCol, grid(bestRow, bestCol), Val))
		    
		    ' Recursively attempt to solve the rest of the grid
		    total = total + CountSolutions(limit - total)
		    
		    ' Undo the move(s) before trying the next number in this cell
		    ' to see if they lead to another solution
		    ' The deterministic steps should be valid/unique, so keep them in the stack
		    SolveUndoTo(deterministicStepsStackCount)
		    
		    If total >= limit Then
		      Exit
		    End If
		  Next
		  
		  ' None of the candidates resulted in a solved state, so rollback entirely and backtrack
		  SolveUndoTo(startStackCount)
		  Return total
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CreateSolveCellHint(row As Integer, col As Integer, solveHint As SolveHint, solutionValue As Integer) As SolveCellHint
		  Var h As SolveCellHint
		  h.Row = row
		  h.Col = col
		  h.SolveHint = solveHint
		  h.SolutionValue = solutionValue
		  
		  Return h
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CreateSolveMove(row As Integer, col As Integer, oldValue As Integer, newValue As Integer) As SolveMove
		  Var m As SolveMove
		  m.Row = row
		  m.Col = col
		  m.OldValue = oldValue
		  m.NewValue = newValue
		  
		  Return m
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawInto(g As Graphics)
		  g.DrawingColor = Color.Black
		  
		  ' Heights
		  Var topBottomMargin As Double = g.Height * 0.1
		  Var sudokuHeight As Double = g.Height * 0.5
		  Var top As Double = topBottomMargin
		  
		  ' Sudoku Title
		  Var title As String = "Sudoku"
		  g.FontName = PDFDocument.StandardFontNames.Helvetica
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
		  DrawSudokuInternal(g, gridX, gridY, gridSize, True)
		  
		  ' Solution (on a clone, in order not to modify this Sudoku's state)
		  If Me.IsSolved Then Return
		  Var clone As New SudokuTool(Me)
		  Var hasSolution As Boolean = clone.Solve
		  If (Not hasSolution) Then Return
		  
		  ' Heights
		  sudokuHeight = g.Height * 0.15
		  top = g.Height - topBottomMargin - sudokuHeight
		  
		  ' Solution Title
		  title = kSolution
		  g.FontSize = 12
		  g.Bold = False
		  g.DrawText(title, (g.Width - g.TextWidth(title)) / 2.0, top + g.FontAscent)
		  
		  titleHeight = g.TextHeight * 1.5
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
		  Var block As Integer = N \ 3
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
		  
		  ' Thicker block separators (inside)
		  g.PenSize = If(isPuzzle, 1.0, 0.5)
		  g.DrawingColor = Color.Black
		  For i As Integer = block To N - 1 Step block
		    Var x As Double = topLeftX + i * cell
		    g.DrawLine(x, topLeftY, x, topLeftY + sizePoints)
		    Var y As Double = topLeftY + i * cell
		    g.DrawLine(topLeftX, y, topLeftX + sizePoints, y)
		  Next
		  
		  ' Outer border drawn last (to cover overlaps)
		  g.PenSize = If(isPuzzle, 2.0, 1.0)
		  g.DrawRectangle(topLeftX - g.PenSize/2, topLeftY - g.PenSize/2, sizePoints + g.PenSize, sizePoints + g.PenSize)
		  
		  ' Draw digits (centered)
		  g.FontUnit = FontUnits.Point
		  g.FontName = PDFDocument.StandardFontNames.Helvetica
		  g.Bold = isPuzzle 'not bold for solution
		  
		  For r As Integer = 0 To N - 1
		    For c As Integer = 0 To N - 1
		      Var v As Integer = me.GetGridCell(r, c)
		      If v <> 0 Then
		        Var s As String = Str(v)
		        ' Choose font size relative to cell
		        g.FontSize = cell * 0.6
		        Var w As Double = g.TextWidth(s)
		        Var h As Double = g.TextHeight(s, cell)
		        Var ascent As Double = g.FontAscent
		        
		        ' Compute left and baseline to center horizontally and vertically
		        Var xText As Double = topLeftX + c * cell + (cell - w) / 2.0
		        Var centerY As Double = topLeftY + r * cell + cell / 2.0
		        Var baselineY As Double = centerY + ascent - (h / 2.0)
		        
		        g.DrawText(s, xText, baselineY)
		      End If
		    Next
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FindEmpty(ByRef outRow As Integer, ByRef outCol As Integer) As Boolean
		  ' Find the first empty cell
		  For r As Integer = 0 To N-1
		    For c As Integer = 0 To N-1
		      If grid(r, c) = 0 Then
		        outRow = r
		        outCol = c
		        Return True
		      End If
		    Next
		  Next
		  
		  Return False
		End Function
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
		  
		  ' Sanitize numClues
		  If numClues < 1 Then numClues = 1
		  If numClues > N*N Then numClues = N*N
		  
		  Var isInitSolved As Boolean = False
		  while (not isInitSolved)
		    ClearGrid
		    
		    ' Place a random Number
		    grid(Rnd.InRange(0, N-1), Rnd.InRange(0, N-1)) = Rnd.InRange(1, N)
		    
		    ' Start with a valid, solved grid
		    isInitSolved = Me.GenerateRandomPuzzleSolve
		  Wend
		  
		  ' Shuffle Digits to get a different-looking solved grid
		  Var perm(N) As Integer
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
		  Var solution(N-1, N-1) As Integer
		  For r As Integer = 0 To N-1
		    For c As Integer = 0 To N-1
		      Var v As Integer = grid(r,c)
		      If v >= 1 And v <= N Then
		        solution(r,c) = perm(v)
		      Else
		        solution(r,c) = 0
		      End If
		    Next
		  Next
		  
		  ' Put the permuted solution back into grid
		  For r As Integer = 0 To N-1
		    For c As Integer = 0 To N-1
		      grid(r,c) = solution(r,c)
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
		    Var backup As Integer = grid(rr, cc)
		    
		    ' Skip already-empty cells (shouldn't happen - just to be safe)
		    If backup = 0 Then Continue
		    
		    ' Try removing
		    grid(rr, cc) = 0
		    
		    ' If the puzzle still has exactly 1 solution, accept the removal
		    If CountSolutions(2) = 1 Then
		      removed = removed + 1
		    Else
		      ' Not unique solution, restore the value and try to remove another
		      grid(rr, cc) = backup
		    End If
		  Next
		  
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
		  
		  Var row As Integer
		  Var col As Integer
		  
		  ' Find the next empty cell
		  ' If there are no empty cells left, the puzzle is solved
		  If Not FindEmpty(row, col) Then
		    Return True
		  End If
		  
		  ' Try all possible numbers (1-9) for this empty cell in random order
		  For Each Val As Integer In Me.GenerateRandomValues
		    ' Check if placing 'val' here is allowed by Sudoku rules
		    If IsValueValid(row, col, Val) Then
		      ' Tentatively place 'val' in the cell
		      grid(row, col) = Val
		      
		      ' Recursively attempt to solve the rest of the grid
		      If GenerateRandomPuzzleSolve() Then
		        ' Success! If the recursive call returns True, the puzzle is solved
		        ' Propagate success back up the recursion chain
		        Return True
		      End If
		      
		      ' Backtracking
		      ' If recursion returned False, this 'val' led to a dead end
		      ' Undo the move before trying the next number in this cell
		      grid(row, col) = 0
		    End If
		  Next
		  
		  ' All numbers 1-9 failed in this cell
		  ' Signal to the previous recursive call that it must backtrack
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GenerateRandomValues() As Integer()
		  ' We want to solve by trying random numbers
		  ' to get a random Sudoku built
		  
		  Var valuesInRandomOrder() As Integer
		  For i As Integer = 1 To N
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
		Function GetGridCell(r As Integer, c As Integer) As Integer
		  Return grid(r,c)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSolveCellHints(firstOnly As Boolean = False) As SolveCellHint()
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  Var solveCellHints() As SolveCellHint
		  
		  ' Add Solve Cell Hints
		  For r As Integer = 0 To N-1
		    For c As Integer = 0 To N-1
		      ' No Hints in non empty Cells
		      If grid(r, c) <> 0 Then
		        Continue
		      End If
		      
		      ' 1. Basic Sudoku Rules (Naked Single)
		      ' Distinct digit in each row/col/block
		      Var candidates() As Integer
		      For v As Integer = 1 To N
		        If IsValueValid(r, c, v) Then
		          candidates.Add(v)
		          If (candidates.Count > 1) Then Exit ' We just need to know of more than two candidates for the Naked Single Check
		        End If
		      Next
		      
		      If candidates.Count = 1 Then
		        solveCellHints.Add(CreateSolveCellHint(r, c, SolveHint.NakedSingle, candidates(0)))
		        If firstOnly Then Return SolveCellHints
		        Continue
		      End If
		      
		      ' 2. Hidden Single
		      ' Only one spot for a digit in row/col/block
		      For v As Integer = 1 To N
		        If IsValueHiddenSingle(r, c, v) Then
		          solveCellHints.Add(CreateSolveCellHint(r, c, SolveHint.HiddenSingle, v))
		          If firstOnly Then Return SolveCellHints
		          Exit 
		        End If
		      Next
		    Next
		  Next
		  
		  Return solveCellHints
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsEmpty() As Boolean
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  For r As Integer = 0 To N-1
		    For c As Integer = 0 To N-1
		      If (grid(r,c) <> 0) Then Return False
		    Next
		  Next
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsSolvable() As Boolean
		  ' Try solve on a clone, so that this
		  ' grid is not being modified
		  Var clone As New SudokuTool(Me)
		  Return clone.Solve
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsSolved() As Boolean
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  ' Ensure current filled-in digits are valid
		  If (Not IsValid) Then Return False
		  
		  ' And no empty cells left
		  For r As Integer = 0 To N-1
		    For c As Integer = 0 To N-1
		      If (grid(r,c) = 0) Then Return False
		    Next
		  Next
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsValid() As Boolean
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  For r As Integer = 0 To N-1
		    For c As Integer = 0 To N-1
		      Var val As Integer = grid(r,c)
		      If val <> 0 Then
		        ' Temporarily remove the number
		        grid(r,c) = 0
		        
		        ' Check number in this cell
		        Var numIsValid As Boolean = IsValueValid(r, c, Val)
		        
		        ' Restore the number
		        grid(r,c) = Val
		        
		        If (Not numIsValid) Then Return False
		      End If
		    Next
		  Next
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsValueHiddenSingle(r As Integer, c As Integer, val As Integer) As Boolean
		  ' Check if 'val' at grid(r, c) is a hidden single.
		  
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  ' Row check
		  Var possibleCols() As Integer
		  For cc As Integer = 0 To N-1
		    If grid(r, cc) = 0 And IsValueValid(r, cc, val) Then
		      possibleCols.Add(cc)
		      If (possibleCols.Count > 1) Then Exit ' We just need to know of more than one candidate
		    End If
		  Next
		  If possibleCols.Count = 1 And possibleCols(0) = c Then
		    Return True
		  End If
		  
		  ' Column check
		  Var possibleRows() As Integer
		  For rr As Integer = 0 To N-1
		    If grid(rr, c) = 0 And IsValueValid(rr, c, val) Then
		      If (possibleRows.Count > 1) Then Exit ' We just need to know of more than one candidate
		      possibleRows.Add(rr)
		    End If
		  Next
		  If possibleRows.Count = 1 And possibleRows(0) = r Then
		    Return True
		  End If
		  
		  ' Block check
		  Var blockR As Integer = (r \ 3) * 3
		  Var blockC As Integer = (c \ 3) * 3
		  Var possibleBlockCells() As Integer
		  For rr As Integer = blockR To blockR+2
		    For cc As Integer = blockC To blockC+2
		      If grid(rr, cc) = 0 And IsValueValid(rr, cc, val) Then
		        possibleBlockCells.Add(rr * N + cc)
		      End If
		    Next
		  Next
		  
		  Var index As Integer = r * N + c
		  If possibleBlockCells.Count = 1 And possibleBlockCells(0) = index Then
		    Return True
		  End If
		  
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsValueValid(r As Integer, c As Integer, val As Integer) As Boolean
		  ' Check if placing 'val' at grid(r, c) is allowed according
		  ' to Sudoku rules. Returns True if valid, False otherwise.
		  
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  ' 1. Check the row
		  ' A number must not appear twice in the same row
		  For col As Integer = 0 To N-1
		    If grid(r, col) = Val Then
		      ' 'val' already exists in this row → invalid
		      Return False
		    End If
		  Next
		  
		  ' 2. Check the column
		  ' A number must not appear twice in the same column
		  For row As Integer = 0 To N-1
		    If grid(row, c) = Val Then
		      ' 'val' already exists in this column → invalid
		      Return False
		    End If
		  Next
		  
		  '3. Check the 3x3 block
		  ' Each 3x3 block must contain unique numbers
		  ' Calculate the top-left corner of the block containing (r, c)
		  Var br As Integer = (r \ 3) * 3
		  Var bc As Integer = (c \ 3) * 3
		  
		  For rr As Integer = br To br + 2
		    For cc As Integer = bc To bc + 2
		      If grid(rr, cc) = Val Then
		        ' 'val' already exists in this 3x3 block → invalid
		        Return False
		      End If
		    Next
		  Next
		  
		  ' Passed all checks
		  ' No conflicts found in row, column, or block
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetGridCell(r As Integer, c As Integer, Assigns val As Integer)
		  grid(r,c) = val
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Solve() As Boolean
		  Redim solveStack(-1)
		  
		  ' Ensure current filled-in digits are valid
		  If (Not IsValid()) Then Return False
		  
		  Var solveResult As Boolean = SolveInternal()
		  
		  Redim solveStack(-1)
		  Return solveResult
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SolveApplyDeterministicSteps() As Boolean
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  ' Fill all deterministic cells (Naked singles and Hidden singles).
		  ' Returns True if we filled at least one cell (so caller can loop).
		  ' If an inconsistency is detected, return False.
		  
		  Var changed As Boolean = False
		  
		  Do
		    ' Just get one deterministic hint
		    Var solveCellHints() As SolveCellHint = GetSolveCellHints(True)
		    If solveCellHints.Count = 0 Then Exit
		    
		    ' Apply
		    Var h As SolveCellHint = solveCellHints(0)
		    Me.SolveApplyMove(Me.CreateSolveMove(h.Row, h.Col, grid(h.Row, h.Col), h.SolutionValue))
		    changed = True
		    
		    ' Since puzzle has changed: loop again and get fresh hint(s)
		  Loop
		  
		  Return changed
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SolveApplyMove(move As SolveMove)
		  ' Apply move to grid
		  ' And add move to solve stack (to make it un-doable)
		  grid(move.Row, move.Col) = move.NewValue
		  solveStack.Add(move)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SolveFindBestNextCell(ByRef bestRow As Integer, ByRef bestCol As Integer, ByRef bestCandidates() As Integer) As Boolean
		  ' Find to-be-solved cells with the least possible candidate values
		  bestRow = -1
		  bestCol = -1
		  Redim bestCandidates(-1)
		  Var bestCount As Integer = 9999
		  
		  For row As Integer = 0 To N-1
		    For col As Integer = 0 To N-1
		      If (grid(row, col) > 0) Then Continue
		      
		      Var candidates() As Integer = SolveGetCellCandidates(row, col)
		      If (candidates.Count < 1) Then
		        ' Invalid State
		        Return False
		      End If
		      
		      If (candidates.Count < bestCount) Then
		        bestCount = candidates.Count
		        bestRow = row
		        bestCol = col
		        bestCandidates = candidates
		        
		        If (bestCount = 1) Then Exit ' Already best cell with just one candidate
		      End If
		    Next
		    
		    If (bestCount = 1) Then Exit
		  Next
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SolveGetCellCandidates(row As Integer, col As Integer) As Integer()
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  ' Return candidate values for cell according to IsValueValid
		  Var candidates() As Integer
		  If (grid(row, col) > 0) Then Return candidates
		  
		  For val As Integer = 1 To N
		    If IsValueValid(row, col, val) Then
		      candidates.Add(val)
		    End If
		  Next
		  
		  Return candidates
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SolveInternal() As Boolean
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  ' Remember stack position at entry
		  Var startStackCount As Integer = solveStack.Count
		  
		  ' Apply deterministic steps
		  While SolveApplyDeterministicSteps
		    ' Once applied, maybe there are new ones,
		    ' so loop until nothing can be applied any longer
		  Wend
		  
		  ' Check if solved just with deterministic steps
		  Var row, col As Integer
		  If Not FindEmpty(row, col) Then
		    Return True
		  End If
		  
		  ' Now we don't have any more cells to fill out with a certain value.
		  ' Let's start to guess the remaining empty cell's values...
		  
		  Var deterministicStepsStackCount As Integer = solveStack.Count
		  
		  ' Find to-be-solved cells with the least possible candidate values
		  Var bestRow As Integer = -1
		  Var bestCol As Integer = -1
		  Dim bestCandidates() As Integer
		  
		  If (Not Me.SolveFindBestNextCell(bestRow, bestCol, bestCandidates)) Then
		    ' Invalid State - Rollback entirely and backtrack
		    SolveUndoTo(startStackCount)
		    Return False
		  End If
		  
		  If (bestRow < 0) Or (bestCol < 0) Then
		    ' Nothing more to solve
		    Return True
		  End If
		  
		  ' Try the cell candidates (in the cell with the least possible candidates)
		  For Each val As Integer In bestCandidates
		    ' Tentatively place 'val' in the cell
		    Me.SolveApplyMove(Me.CreateSolveMove(bestRow, bestCol, grid(bestRow, bestCol), Val))
		    
		    ' Recursively attempt to solve the rest of the grid
		    If SolveInternal() Then
		      ' Success! If the recursive call returns True, the puzzle is solved
		      ' Propagate success back up the recursion chain
		      Return True
		    End If
		    
		    ' Backtracking
		    ' If recursion returned False, this 'val' led to a dead end
		    ' Undo the move(s) before trying the next number in this cell
		    ' The deterministic steps should be valid, so keep them in the stack
		    SolveUndoTo(deterministicStepsStackCount)
		  Next
		  
		  ' None of the candidates resulted in a solved state, so rollback entirely and backtrack
		  SolveUndoTo(startStackCount)
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SolveUndoTo(stackSize As Integer)
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  ' Undo - re-apply old values
		  While solveStack.Count > stackSize
		    Var m As SolveMove = solveStack(solveStack.LastIndex)
		    grid(m.Row, m.Col) = m.OldValue
		    solveStack.RemoveAt(solveStack.LastIndex)
		  Wend
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private grid(-1,-1) As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private solveStack() As SolveMove
	#tag EndProperty


	#tag Constant, Name = kSolution, Type = String, Dynamic = True, Default = \"Solution", Scope = Private
		#Tag Instance, Platform = Any, Language = de, Definition  = \"L\xC3\xB6sung"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Solution"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Soluci\xC3\xB3n"
	#tag EndConstant

	#tag Constant, Name = N, Type = Double, Dynamic = False, Default = \"9", Scope = Public
	#tag EndConstant


	#tag Structure, Name = SolveCellHint, Flags = &h0
		Row As Integer
		  Col As Integer
		  SolveHint As SolveHint
		SolutionValue As Integer
	#tag EndStructure

	#tag Structure, Name = SolveMove, Flags = &h21
		Row As Integer
		  Col As Integer
		  OldValue As Integer
		NewValue As Integer
	#tag EndStructure


	#tag Enum, Name = SolveHint, Type = UInt8, Flags = &h0
		None=0
		  NakedSingle=1
		HiddenSingle=2
	#tag EndEnum


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

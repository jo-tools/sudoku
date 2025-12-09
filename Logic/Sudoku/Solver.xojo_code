#tag Class
Private Class Solver
	#tag Method, Flags = &h0
		Sub Constructor(grid As Grid)
		  ' Initialize the Solver with a reference to the Grid
		  mGrid = grid
		  mHintsSearcher = New HintsSearcher(grid)
		  mCandidatesSearcher = New CandidatesSearcher(grid)
		  
		  ' Initialize Random instance for puzzle generation
		  mRandom = New Random
		  
		  ' Build the DLX matrix for this grid size
		  DLXMatrixBuild
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CountSolutions(limit As Integer = 2) As Integer
		  ' Count solutions using DLX with incremental covering.
		  ' We cover columns for filled cells, count, then uncover to restore.
		  ' This is much faster than the strategy-based approach for solution counting.
		  
		  #Pragma DisableBoundsChecking
		  
		  Var N As Integer = mGrid.Settings.N
		  Var NN As Integer = N * N
		  
		  ' Track which columns we covered for filled cells (to uncover later)
		  Var coveredCols() As Integer
		  Var presetsValid As Boolean = True
		  
		  ' For each filled cell, cover the row that represents this assignment
		  For cell As Integer = 0 To NN - 1
		    Var row As Integer = cell \ N
		    Var col As Integer = cell Mod N
		    Var digit As Integer = mGrid.Get(row, col)
		    If digit = 0 Then Continue
		    
		    Var rowId As Integer = row * NN + col * N + (digit - 1)
		    
		    If (Not DLXRowSelectionApply(rowId, coveredCols)) Then
		      presetsValid = False
		      Exit
		    End If
		  Next
		  
		  ' Now count solutions with DLX (only if givens were consistent)
		  Var count As Integer = 0
		  If presetsValid Then
		    DLXCountSolutionsRecursive(count, limit)
		  End If
		  
		  ' Uncover in reverse order to restore matrix to clean state
		  For i As Integer = coveredCols.LastIndex DownTo 0
		    DLXUncover(coveredCols(i))
		  Next
		  
		  Return count
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CreateSolveMove(row As Integer, col As Integer, oldValue As Integer, newValue As Integer) As SolveMove
		  ' Create a SolveMove structure for tracking grid changes
		  Var m As SolveMove
		  
		  m.Row = row
		  m.Col = col
		  m.OldValue = oldValue
		  m.NewValue = newValue
		  
		  Return m
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DLXCountSolutionsRecursive(ByRef count As Integer, limit As Integer)
		  ' Recursive DLX solution counter
		  ' Uses Algorithm X to enumerate solutions up to the specified limit
		  
		  #Pragma DisableBoundsChecking
		  
		  If count >= limit Then Return
		  
		  ' If no columns left, found a solution
		  If mDLXRight(0) = 0 Then
		    count = count + 1
		    Return
		  End If
		  
		  ' Choose column with minimum size (MRV heuristic)
		  Var bestCol As Integer = mDLXRight(0)
		  Var bestSize As Integer = mDLXColSize(bestCol)
		  
		  Var col As Integer = mDLXRight(bestCol)
		  While col <> 0
		    If mDLXColSize(col) < bestSize Then
		      bestSize = mDLXColSize(col)
		      bestCol = col
		      If bestSize <= 1 Then Exit ' Can't do better
		    End If
		    col = mDLXRight(col)
		  Wend
		  
		  ' If column has no rows, dead end
		  If bestSize = 0 Then Return
		  
		  ' Cover the chosen column
		  DLXCover(bestCol)
		  
		  ' Try each row in this column
		  Var row As Integer = mDLXDown(bestCol)
		  While row <> bestCol
		    If count >= limit Then Exit
		    
		    ' Cover all other columns in this row
		    Var node As Integer = mDLXRight(row)
		    While node <> row
		      DLXCover(mDLXColHeader(node))
		      node = mDLXRight(node)
		    Wend
		    
		    ' Recurse
		    DLXCountSolutionsRecursive(count, limit)
		    
		    ' Uncover columns in reverse order
		    node = mDLXLeft(row)
		    While node <> row
		      DLXUncover(mDLXColHeader(node))
		      node = mDLXLeft(node)
		    Wend
		    
		    row = mDLXDown(row)
		  Wend
		  
		  ' Uncover the chosen column
		  DLXUncover(bestCol)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DLXCover(colHeader As Integer)
		  ' Cover a column: remove it from the header list and remove all rows
		  ' that have a 1 in this column from all other columns they're in.
		  ' This is the core operation of the Dancing Links algorithm.
		  
		  #Pragma DisableBoundsChecking
		  
		  If mDLXColumnCovered(colHeader) Then Return
		  mDLXColumnCovered(colHeader) = True
		  
		  ' Unlink column header from horizontal list
		  mDLXRight(mDLXLeft(colHeader)) = mDLXRight(colHeader)
		  mDLXLeft(mDLXRight(colHeader)) = mDLXLeft(colHeader)
		  
		  ' For each row in this column
		  Var row As Integer = mDLXDown(colHeader)
		  While row <> colHeader
		    ' For each other node in this row
		    Var node As Integer = mDLXRight(row)
		    While node <> row
		      ' Unlink from its column's vertical list
		      Var up As Integer = mDLXUp(node)
		      Var down As Integer = mDLXDown(node)
		      mDLXDown(up) = down
		      mDLXUp(down) = up
		      mDLXColSize(mDLXColHeader(node)) = mDLXColSize(mDLXColHeader(node)) - 1
		      node = mDLXRight(node)
		    Wend
		    row = mDLXDown(row)
		  Wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DLXMatrixBuild()
		  ' Build the exact cover matrix for Sudoku using Dancing Links.
		  ' 
		  ' Node layout:
		  ' - Node 0 is the root header
		  ' - Nodes 1 to mDLXNumCols are column headers
		  ' - Remaining nodes are the actual matrix entries
		  '
		  ' For Sudoku, we have:
		  ' - 4*N² columns (constraints): cell, row-digit, col-digit, box-digit
		  ' - N³ rows (possibilities): each cell can have each digit
		  ' - Each row has exactly 4 nodes (one per constraint type)
		  
		  #Pragma DisableBoundsChecking
		  
		  Var N As Integer = mGrid.Settings.N
		  Var boxWidth As Integer = mGrid.Settings.BoxWidth
		  Var boxHeight As Integer = mGrid.Settings.BoxHeight
		  Var NN As Integer = N * N
		  
		  mDLXNumCols = 4 * NN
		  mDLXNumRows = N * NN  ' N³
		  
		  ' Each row has 4 nodes, plus we need column headers and root
		  Var totalNodes As Integer = 1 + mDLXNumCols + mDLXNumRows * 4
		  
		  Redim mDLXLeft(totalNodes - 1)
		  Redim mDLXRight(totalNodes - 1)
		  Redim mDLXUp(totalNodes - 1)
		  Redim mDLXDown(totalNodes - 1)
		  Redim mDLXColHeader(totalNodes - 1)
		  Redim mDLXRowId(totalNodes - 1)
		  Redim mDLXColSize(mDLXNumCols)  ' Index 0 unused, 1..mDLXNumCols for headers
		  Redim mDLXRowHead(mDLXNumRows - 1)
		  Redim mDLXColumnCovered(mDLXNumCols)
		  
		  ' Initialize root (node 0)
		  mDLXLeft(0) = mDLXNumCols
		  mDLXRight(0) = 1
		  
		  ' Initialize column headers (nodes 1 to mDLXNumCols)
		  For c As Integer = 1 To mDLXNumCols
		    mDLXLeft(c) = c - 1
		    mDLXRight(c) = If(c = mDLXNumCols, 0, c + 1)
		    mDLXUp(c) = c
		    mDLXDown(c) = c
		    mDLXColHeader(c) = c
		    mDLXColSize(c) = 0
		  Next
		  
		  ' Track last node in each column for efficient insertion
		  Var colTail() As Integer
		  Redim colTail(mDLXNumCols)
		  For c As Integer = 1 To mDLXNumCols
		    colTail(c) = c
		  Next
		  
		  ' Add rows for each possibility (row, col, digit)
		  Var nodeIdx As Integer = mDLXNumCols + 1
		  
		  For row As Integer = 0 To N - 1
		    For col As Integer = 0 To N - 1
		      For digit As Integer = 0 To N - 1
		        ' Calculate the 4 constraint columns (1-indexed)
		        Var cellConstraint As Integer = row * N + col + 1
		        Var rowDigitConstraint As Integer = NN + row * N + digit + 1
		        Var colDigitConstraint As Integer = 2 * NN + col * N + digit + 1
		        Var boxIdx As Integer = (row \ boxHeight) * (N \ boxWidth) + (col \ boxWidth)
		        Var boxDigitConstraint As Integer = 3 * NN + boxIdx * N + digit + 1
		        
		        ' Row ID encodes (row, col, digit)
		        Var rowId As Integer = row * NN + col * N + digit
		        
		        ' Create 4 nodes for this row
		        Var firstNode As Integer = nodeIdx
		        Var constraints(3) As Integer
		        constraints(0) = cellConstraint
		        constraints(1) = rowDigitConstraint
		        constraints(2) = colDigitConstraint
		        constraints(3) = boxDigitConstraint
		        
		        For i As Integer = 0 To 3
		          Var c As Integer = constraints(i)
		          
		          ' Set row ID and column header
		          mDLXRowId(nodeIdx) = rowId
		          mDLXColHeader(nodeIdx) = c
		          
		          ' Insert into column's vertical list (at end)
		          mDLXUp(nodeIdx) = colTail(c)
		          mDLXDown(nodeIdx) = c  ' Points back to header
		          mDLXDown(colTail(c)) = nodeIdx
		          mDLXUp(c) = nodeIdx
		          colTail(c) = nodeIdx
		          
		          ' Increment column size
		          mDLXColSize(c) = mDLXColSize(c) + 1
		          
		          nodeIdx = nodeIdx + 1
		        Next
		        
		        ' Link nodes horizontally (circular)
		        Var lastNode As Integer = nodeIdx - 1
		        mDLXRowHead(rowId) = firstNode
		        For i As Integer = firstNode To lastNode
		          mDLXLeft(i) = If(i = firstNode, lastNode, i - 1)
		          mDLXRight(i) = If(i = lastNode, firstNode, i + 1)
		        Next
		      Next
		    Next
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DLXRowSelectionApply(rowId As Integer, ByRef coveredCols() As Integer) As Boolean
		  ' Covers all columns corresponding to a specific row (assignment).
		  ' Returns False if the row conflicts with already-covered columns.
		  ' Used to apply preset values (givens) before solving.
		  
		  #Pragma DisableBoundsChecking
		  
		  If rowId < 0 Or rowId > mDLXRowHead.LastIndex Then Return False
		  
		  Var rowNode As Integer = mDLXRowHead(rowId)
		  If rowNode = 0 Then Return False
		  
		  Var localCols() As Integer
		  
		  ' Cover secondary columns first (move right)
		  Var node As Integer = mDLXRight(rowNode)
		  While node <> rowNode
		    Var colHeader As Integer = mDLXColHeader(node)
		    If mDLXColumnCovered(colHeader) Then
		      DLXRowSelectionRollback(localCols)
		      Return False
		    End If
		    
		    DLXCover(colHeader)
		    localCols.Add(colHeader)
		    node = mDLXRight(node)
		  Wend
		  
		  ' Finally cover the primary column for this row
		  Var primaryCol As Integer = mDLXColHeader(rowNode)
		  If mDLXColumnCovered(primaryCol) Then
		    DLXRowSelectionRollback(localCols)
		    Return False
		  End If
		  DLXCover(primaryCol)
		  localCols.Add(primaryCol)
		  
		  ' Persist order to shared stack for later un-covering
		  For Each colHeader As Integer In localCols
		    coveredCols.Add(colHeader)
		  Next
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DLXRowSelectionRollback(ByRef localCols() As Integer)
		  ' Rollback covered columns in reverse order.
		  ' Used when a row selection conflicts with existing coverage.
		  
		  #Pragma DisableBoundsChecking
		  
		  For i As Integer = localCols.LastIndex DownTo 0
		    DLXUncover(localCols(i))
		  Next
		  
		  Redim localCols(-1)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DLXSolve(ByRef solution() As Integer, randomize As Boolean) As Boolean
		  ' Solve using Dancing Links (DLX) - Knuth's Algorithm X.
		  ' If randomize is True, rows are shuffled for random solution generation.
		  
		  #Pragma DisableBoundsChecking
		  
		  Redim solution(-1)
		  Return DLXSolveRecursive(solution, randomize)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DLXSolveRecursive(ByRef solution() As Integer, randomize As Boolean) As Boolean
		  ' Recursive DLX solver using Algorithm X.
		  ' Finds one solution (the first found, or a random one if randomize=True).
		  
		  #Pragma DisableBoundsChecking
		  
		  ' If no columns left, we found a solution
		  If mDLXRight(0) = 0 Then
		    Return True
		  End If
		  
		  ' Choose column with minimum size (MRV heuristic)
		  Var bestCol As Integer = mDLXRight(0)
		  Var bestSize As Integer = mDLXColSize(bestCol)
		  
		  Var col As Integer = mDLXRight(bestCol)
		  While col <> 0
		    If mDLXColSize(col) < bestSize Then
		      bestSize = mDLXColSize(col)
		      bestCol = col
		      If bestSize <= 1 Then Exit ' Can't do better
		    End If
		    col = mDLXRight(col)
		  Wend
		  
		  ' If column has no rows, dead end
		  If bestSize = 0 Then
		    Return False
		  End If
		  
		  ' Cover the chosen column
		  DLXCover(bestCol)
		  
		  ' Collect rows in this column
		  Var rows() As Integer
		  Var row As Integer = mDLXDown(bestCol)
		  While row <> bestCol
		    rows.Add(row)
		    row = mDLXDown(row)
		  Wend
		  
		  ' Shuffle rows for randomization (used in puzzle generation)
		  If randomize And rows.Count > 1 Then
		    For i As Integer = rows.LastIndex DownTo 1
		      Var j As Integer = mRandom.InRange(0, i)
		      Var tmp As Integer = rows(i)
		      rows(i) = rows(j)
		      rows(j) = tmp
		    Next
		  End If
		  
		  ' Try each row
		  For Each r As Integer In rows
		    ' Add this row to solution
		    solution.Add(mDLXRowId(r))
		    
		    ' Cover all other columns in this row
		    Var node As Integer = mDLXRight(r)
		    While node <> r
		      DLXCover(mDLXColHeader(node))
		      node = mDLXRight(node)
		    Wend
		    
		    ' Recurse
		    If DLXSolveRecursive(solution, randomize) Then
		      ' Uncover local covered columns for this row before returning,
		      ' so that matrix remains in consistent state
		      node = mDLXLeft(r)
		      While node <> r
		        DLXUncover(mDLXColHeader(node))
		        node = mDLXLeft(node)
		      Wend
		      
		      ' Uncover the chosen column
		      DLXUncover(bestCol)
		      
		      Return True
		    End If
		    
		    ' Backtrack: uncover columns in reverse order
		    node = mDLXLeft(r)
		    While node <> r
		      DLXUncover(mDLXColHeader(node))
		      node = mDLXLeft(node)
		    Wend
		    
		    solution.RemoveAt(solution.LastIndex)
		  Next
		  
		  ' Uncover the chosen column
		  DLXUncover(bestCol)
		  
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DLXUncover(colHeader As Integer)
		  ' Uncover a column: reverse the cover operation exactly.
		  ' This is where the "dancing" happens - we relink nodes using their preserved pointers.
		  ' The key insight of DLX is that removed nodes still remember their neighbors.
		  
		  #Pragma DisableBoundsChecking
		  
		  If (Not mDLXColumnCovered(colHeader)) Then Return
		  
		  ' For each row in this column (in reverse order)
		  Var row As Integer = mDLXUp(colHeader)
		  While row <> colHeader
		    ' For each other node in this row (in reverse order)
		    Var node As Integer = mDLXLeft(row)
		    While node <> row
		      ' Relink into its column's vertical list
		      Var colIdx As Integer = mDLXColHeader(node)
		      mDLXColSize(colIdx) = mDLXColSize(colIdx) + 1
		      mDLXDown(mDLXUp(node)) = node
		      mDLXUp(mDLXDown(node)) = node
		      node = mDLXLeft(node)
		    Wend
		    row = mDLXUp(row)
		  Wend
		  
		  ' Relink column header into horizontal list
		  mDLXRight(mDLXLeft(colHeader)) = colHeader
		  mDLXLeft(mDLXRight(colHeader)) = colHeader
		  
		  mDLXColumnCovered(colHeader) = False
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Invalidate()
		  mCacheIsSolvable = IsSolvableState.Unknown
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsSolvable() As Boolean
		  Select Case mCacheIsSolvable
		    
		  Case IsSolvableState.Solvable
		    Return True
		    
		  Case IsSolvableState.NotSolvable
		    Return False
		    
		  Else
		    ' Check validity
		    If (Not Me.IsValid(ValidCheck.AdvancedChecks)) Then
		      mCacheIsSolvable = IsSolvableState.NotSolvable
		      Return False
		    End If
		    
		    Select Case mGrid.Settings.N
		    Case Is <= 6
		      ' Small Sudoku Grid: always check by solving on a clone (further below)
		      
		    Else
		      Var limitAssumeIsSolvable As Integer = Ceiling(kTresholdFactorAssumeIsSolvable * (mGrid.Settings.N * mGrid.Settings.N))
		      
		      If (mGrid.GetCountNonEmpty <= limitAssumeIsSolvable) Then
		        ' Only check validity (above), skip heavy solving
		        ' Assume solvable for now (don’t trigger full backtracking)
		        ' Almost any sparse Sudoku with less than x numbers is solvable
		        mCacheIsSolvable = IsSolvableState.Solvable
		        Return True
		      End If
		      
		    End Select
		    
		    ' Try solve on a clone, so that this grid is not being modified
		    Var clone As New Solver(mGrid.Clone)
		    If clone.Solve Then
		      mCacheIsSolvable = IsSolvableState.Solvable
		      Return True
		    Else
		      mCacheIsSolvable = IsSolvableState.NotSolvable
		      Return False
		    End If
		    
		  End Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsValid(checkType As ValidCheck) As Boolean
		  #Pragma DisableBoundsChecking
		  
		  For row As Integer = 0 To mGrid.Settings.N-1
		    For col As Integer = 0 To mGrid.Settings.N-1
		      Var value As Integer = mGrid.Get(row, col)
		      If value <> 0 Then
		        ' Check number in this cell
		        If (Not Me.IsValueValid(row, col, value, checkType)) Then
		          Return False
		        End If
		      End If
		    Next
		  Next
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsValidBasicSudokuRules() As Boolean
		  ' Check Basic Sudoku Rules
		  Return IsValid(ValidCheck.BasicSudokuRules)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsValueValid(row As Integer, col As Integer, value As Integer, checkType As ValidCheck) As Boolean
		  #Pragma DisableBoundsChecking
		  
		  ' Check Basic Sudoku Rules
		  If (Not mGrid.IsValueValid(row, col, value)) Then Return False
		  
		  ' Advanced Checks: Naked Single, Hidden Single
		  If (checkType = ValidCheck.AdvancedChecks) Then
		    Var solveCellHint As CellHint = mHintsSearcher.Get(row, col)
		    Select Case solveCellHint.SolveHint
		    Case SolveHint.NakedSingle, SolveHint.HiddenSingle
		      If (solveCellHint.SolutionValue <> value) Then Return False
		    End Select
		  End If
		  
		  ' Passed all checks
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetStateIsSolvable()
		  mCacheIsSolvable = IsSolvableState.Solvable
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GenerateRandomSolution() As Boolean
		  ' Generate a complete random valid Sudoku solution using DLX.
		  ' The grid will be completely filled with a valid solution.
		  ' Returns True on success.
		  
		  #Pragma DisableBoundsChecking
		  
		  Var N As Integer = mGrid.Settings.N
		  
		  ' Generate a complete valid solution using DLX with randomization
		  Var solution() As Integer
		  If Not DLXSolve(solution, True) Then
		    Return False
		  End If
		  
		  ' Clear grid and decode solution into grid
		  mGrid.Clear
		  For Each rowId As Integer In solution
		    Var cell As Integer = rowId \ N
		    Var row As Integer = cell \ N
		    Var col As Integer = cell Mod N
		    Var digit As Integer = (rowId Mod N) + 1
		    mGrid.Set(row, col) = digit
		  Next
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Solve() As Boolean
		  ' Solve the current puzzle.
		  ' Uses a hybrid approach: strategy-based solving for interactive puzzles,
		  ' falling back to DLX for difficult cases.
		  
		  Redim mSolveStack(-1)
		  
		  ' Ensure current filled-in digits are valid
		  If (Not Me.IsValid(ValidCheck.AdvancedChecks)) Then Return False
		  
		  Var solveResult As Boolean = Me.SolveInternal()
		  
		  If solveResult Then
		    mCacheIsSolvable = IsSolvableState.Solvable
		  Else
		    mCacheIsSolvable = IsSolvableState.NotSolvable
		  End If
		  
		  Redim mSolveStack(-1)
		  Return solveResult
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SolveApplyDeterministicSteps() As Boolean
		  #Pragma DisableBoundsChecking
		  
		  ' Fill all deterministic cells (Naked singles and Hidden singles).
		  ' Returns True if we filled at least one cell (so caller can loop).
		  ' If an inconsistency is detected, return False.
		  
		  Var changed As Boolean = False
		  
		  Do
		    Var appliedThisPass As Boolean = False
		    Var cellHints() As CellHint = mHintsSearcher.GetCellHints()
		    
		    For Each h As CellHint In cellHints
		      ' Check that this move is still valid under current state
		      ' Note: No need to check with ValidCheck.AdvancedChecks since we got them from cellHints
		      If Me.IsValueValid(h.Row, h.Col, h.SolutionValue, ValidCheck.BasicSudokuRules) Then
		        ' Apply
		        Me.SolveApplyMove(Me.CreateSolveMove(h.Row, h.Col, mGrid.Get(h.Row, h.Col), h.SolutionValue))
		        changed = True
		        appliedThisPass = True
		      Else
		        'Break
		      End If
		    Next
		    
		    ' If nothing could be applied in this pass, break out
		    If (Not appliedThisPass) Then Exit
		    
		    ' Since puzzle has changed: loop again and get fresh hint(s)
		  Loop
		  
		  Return changed
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SolveApplyMove(move As SolveMove)
		  ' Apply move to grid
		  ' And add move to solve stack (to make it un-doable)
		  mGrid.Set(move.Row, move.Col) = move.NewValue
		  mSolveStack.Add(move)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SolveEnabled() As Boolean
		  ' Should the UI enable the Solve button?
		  ' 9x9 Sudokus with a unique solution need at least 17 clues.
		  ' We approximate this "enough clues" requirement by using a
		  ' threshold factor for any Sudoku size.
		  
		  Var threshold As Integer = Ceiling(kTresholdFactorSolveEnabled * (mGrid.Settings.N * mGrid.Settings.N))
		  Return mGrid.GetCountNonEmpty >= threshold
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SolveFindBestNextCell(ByRef bestRow As Integer, ByRef bestCol As Integer, ByRef bestCandidates() As Integer) As Boolean
		  #Pragma DisableBoundsChecking
		  
		  ' Find to-be-solved cells with the least possible candidate values
		  bestRow = -1
		  bestCol = -1
		  Redim bestCandidates(-1)
		  Var bestCount As Integer = 9999
		  
		  For row As Integer = 0 To mGrid.Settings.N-1
		    For col As Integer = 0 To mGrid.Settings.N-1
		      If (mGrid.Get(row, col) > 0) Then Continue
		      
		      Var candidates() As Integer = mCandidatesSearcher.GetAllCellCandidates(row, col)
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
		Private Function SolveInternal() As Boolean
		  #Pragma DisableBoundsChecking
		  
		  ' The Solver with Strategies is more performant with complex Sudoku puzzles
		  ' However, with e.g. nearly empty Sudoku's it takes much longer because of
		  ' the overhead of checking possible strategies.
		  
		  ' Let's just look at the current state of the Sudoku that needs to be solved.
		  ' If there are a certain amount of numbers placed and strategies are available,
		  ' then use the Solver with Strategies.
		  ' Otherwise use the plain Backtracking Solver (and hope it is faster ;-)
		  
		  Var tresholdSparse As Integer = Ceiling(kTresholdFactorSparse * (mGrid.Settings.N*mGrid.Settings.N))
		  Var tresholdMedium As Integer = Ceiling(kTresholdFactorMedium * (mGrid.Settings.N*mGrid.Settings.N))
		  
		  Select Case mGrid.GetCountNonEmpty
		    
		  Case Is <= tresholdSparse
		    ' Sparse: Use Backtracking
		    Return Me.SolveInternalWithBacktracking
		    
		  Case Is <= tresholdMedium
		    ' Medium density: Try strategies if we find hints right away
		    Var hints() As CellHint = mHintsSearcher.GetCellHints
		    If hints.LastIndex >= 0 Then
		      Return Me.SolveInternalWithStrategies
		    Else
		      Return Me.SolveInternalWithBacktracking
		    End If
		    
		  Case Else
		    ' Dense: Strategies are almost always better
		    Return Me.SolveInternalWithStrategies
		    
		  End Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SolveInternalWithBacktracking() As Boolean
		  #Pragma DisableBoundsChecking
		  
		  ' Remember stack position at entry
		  Var startStackCount As Integer = mSolveStack.Count
		  
		  Var row As Integer
		  Var col As Integer
		  
		  ' Find the next empty cell
		  ' If there are no empty cells left, the puzzle is solved
		  If Not mGrid.FindEmpty(row, col) Then
		    Return True
		  End If
		  
		  ' Try all possible numbers for this empty cell
		  Var tryNumberFrom As Integer = 1
		  Var tryNumberTo As Integer = mGrid.Settings.N
		  
		  Var solveCellHint As CellHint = mHintsSearcher.Get(row, col)
		  Select Case solveCellHint.SolveHint
		  Case SolveHint.NakedSingle, SolveHint.HiddenSingle
		    ' No need to try all numbers, since we found a Naked/Hidden Single
		    tryNumberFrom = solveCellHint.SolutionValue
		    tryNumberTo = solveCellHint.SolutionValue
		  End Select
		  
		  For value As Integer = tryNumberFrom To tryNumberTo
		    ' Check if placing value here is allowed by Sudoku rules
		    ' Note: No need to check with ValidCheck.AdvancedChecks since we checked Naked/Hidden Singles in GetCellHint
		    If Me.IsValueValid(row, col, value, ValidCheck.BasicSudokuRules) Then
		      ' Tentatively place value in the cell
		      Me.SolveApplyMove(Me.CreateSolveMove(row, col, mGrid.Get(row, col), value))
		      
		      ' Recursively attempt to solve the rest of the grid
		      If Me.SolveInternalWithBacktracking() Then
		        ' Success! If the recursive call returns True, the puzzle is solved
		        ' Propagate success back up the recursion chain
		        Return True
		      End If
		      
		      ' Backtracking
		      ' If recursion returned False, this value led to a dead end
		      ' Undo the move before trying the next number in this cell
		      Me.SolveUndoTo(startStackCount)
		    End If
		  Next
		  
		  ' All numbers failed in this cell (to fully solve with recursion)
		  ' Signal to the previous recursive call that it must backtrack
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SolveInternalWithStrategies() As Boolean
		  #Pragma DisableBoundsChecking
		  
		  ' Remember stack position at entry
		  Var startStackCount As Integer = mSolveStack.Count
		  
		  ' Apply deterministic steps
		  While Me.SolveApplyDeterministicSteps
		    ' Once applied, maybe there are new ones,
		    ' so loop until nothing can be applied any longer
		  Wend
		  
		  ' Check if solved just with deterministic steps
		  Var row, col As Integer
		  If Not mGrid.FindEmpty(row, col) Then
		    Return True
		  End If
		  
		  ' Now we don't have any more cells to fill out with a certain value.
		  ' Let's start to guess the remaining empty cell's values...
		  
		  Var deterministicStepsStackCount As Integer = mSolveStack.Count
		  
		  ' Find to-be-solved cells with the least possible candidate values
		  Var bestRow As Integer = -1
		  Var bestCol As Integer = -1
		  Var bestCandidates() As Integer
		  
		  If (Not Me.SolveFindBestNextCell(bestRow, bestCol, bestCandidates)) Then
		    ' Invalid State - Rollback entirely and backtrack
		    Me.SolveUndoTo(startStackCount)
		    Return False
		  End If
		  
		  If (bestRow < 0) Or (bestCol < 0) Then
		    ' Nothing more to solve
		    Return True
		  End If
		  
		  ' Try the cell candidates (in the cell with the least possible candidates)
		  For Each value As Integer In bestCandidates
		    ' Tentatively place value in the cell
		    Me.SolveApplyMove(Me.CreateSolveMove(bestRow, bestCol, mGrid.Get(bestRow, bestCol), value))
		    
		    ' Recursively attempt to solve the rest of the grid
		    If Me.SolveInternalWithStrategies() Then
		      ' Success! If the recursive call returns True, the puzzle is solved
		      ' Propagate success back up the recursion chain
		      Return True
		    End If
		    
		    ' Backtracking
		    ' If recursion returned False, this value led to a dead end
		    ' Undo the move(s) before trying the next number in this cell
		    ' The deterministic steps should be valid, so keep them in the stack
		    Me.SolveUndoTo(deterministicStepsStackCount)
		  Next
		  
		  ' None of the candidates resulted in a solved state, so rollback entirely and backtrack
		  Me.SolveUndoTo(startStackCount)
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SolveUndoTo(stackSize As Integer)
		  #Pragma DisableBoundsChecking
		  
		  ' Undo - re-apply old values
		  While mSolveStack.Count > stackSize
		    Var m As SolveMove = mSolveStack(mSolveStack.LastIndex)
		    mGrid.Set(m.Row, m.Col) = m.OldValue
		    mSolveStack.RemoveAt(mSolveStack.LastIndex)
		  Wend
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Solver
		' ============================================================================
		' Sudoku Solver
		' ============================================================================
		' 
		' This class provides solving capabilities for Sudoku puzzles using multiple
		' algorithms optimized for different scenarios:
		' 
		' 1. DANCING LINKS (DLX) - Knuth's Algorithm X
		'    - Used for: Solution counting, puzzle generation, fast solving
		'    - DLX models Sudoku as an exact cover problem with a sparse matrix
		'    - 4*N² columns (constraints): cell, row-digit, col-digit, box-digit
		'    - N³ rows (possibilities): each cell can have each digit
		'    - Each row has exactly 4 nodes (one per constraint type)
		'    - Cover/Uncover operations allow efficient backtracking
		'    - MRV (Minimum Remaining Values) heuristic for column selection
		' 
		' 2. STRATEGY-BASED SOLVING
		'    - Used for: Interactive solving, hint generation
		'    - Applies deterministic strategies (Naked Singles, Hidden Singles)
		'    - Falls back to candidate-based guessing with backtracking
		'    - Better for showing human-like solving steps
		' 
		' 3. HYBRID APPROACH
		'    - Solve() method chooses algorithm based on puzzle density
		'    - Sparse puzzles: Pure backtracking (less overhead)
		'    - Medium density: Strategy-based if hints available
		'    - Dense puzzles: Strategy-based (almost always better)
		' 
		' Key Methods:
		' - Solve(): Solve the puzzle, modifying the grid
		' - CountSolutions(limit): Count solutions up to limit using DLX
		' - GenerateRandomSolution(): Fill grid with random valid solution
		' - IsSolvable(): Check if puzzle has at least one solution
		' 
		' ============================================================================
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private mCacheIsSolvable As IsSolvableState = IsSolvableState.Unknown
	#tag EndProperty

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
		Private mSolveStack() As SolveMove
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 52616E646F6D20696E7374616E636520666F722070757A7A6C652067656E65726174696F6E
		Private mRandom As Random
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 444C583A204C65667420706F696E7465727320666F7220686F72697A6F6E74616C206C696E6B696E67
		Private mDLXLeft() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 444C583A20526967687420706F696E7465727320666F7220686F72697A6F6E74616C206C696E6B696E67
		Private mDLXRight() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 444C583A20557020706F696E7465727320666F7220766572746963616C206C696E6B696E67
		Private mDLXUp() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 444C583A20446F776E20706F696E7465727320666F7220766572746963616C206C696E6B696E67
		Private mDLXDown() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 444C583A20436F6C756D6E2068656164657220666F722065616368206E6F6465
		Private mDLXColHeader() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 444C583A20526F77204944202872657072657365746E74696E6720726F772C20636F6C2C20646967697429
		Private mDLXRowId() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 444C583A2053697A65206F66206561636820636F6C756D6E2028636F756E74206F6620726F777329
		Private mDLXColSize() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 444C583A20486561642028666972737420636F6C756D6E206E6F64652920666F72206561636820726F77
		Private mDLXRowHead() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 444C583A20547261636B732077686963682063616E64696461746573206172652063757272656E746C7920636F7665726564
		Private mDLXColumnCovered() As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 444C583A204E756D626572206F6620636F6C756D6E7320696E20746865206D6174726978
		Private mDLXNumCols As Integer
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 444C583A204E756D626572206F6620726F777320696E20746865206D6174726978
		Private mDLXNumRows As Integer
	#tag EndProperty


	#tag Constant, Name = kTresholdFactorAssumeIsSolvable, Type = Double, Dynamic = False, Default = \"0.172", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kTresholdFactorMedium, Type = Double, Dynamic = False, Default = \"0.308", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kTresholdFactorSolveEnabled, Type = Double, Dynamic = False, Default = \"0.209", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kTresholdFactorSparse, Type = Double, Dynamic = False, Default = \"0.148", Scope = Private
	#tag EndConstant


	#tag Structure, Name = SolveMove, Flags = &h21
		Row As Integer
		  Col As Integer
		  OldValue As Integer
		NewValue As Integer
	#tag EndStructure


	#tag Enum, Name = IsSolvableState, Type = Integer, Flags = &h21
		Unknown = 0
		  NotSolvable = 1
		Solvable = 2
	#tag EndEnum

	#tag Enum, Name = ValidCheck, Type = Integer, Flags = &h21
		BasicSudokuRules = 1
		AdvancedChecks=2
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

#tag Class
Private Class Solver
	#tag Method, Flags = &h0
		Sub Constructor(grid As Grid)
		  ' Initialize the Solver with a reference to the Grid
		  mGrid = grid
		  
		  ' Initialize Random instance for puzzle generation
		  mRandom = New Random
		  
		  ' Build the DLX matrix for this grid size
		  DLXMatrixBuild
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CountSolutions(limit As Integer = 2) As Integer
		  ' Count solutions up to the specified limit.
		  ' Returns 0 if givens are inconsistent.
		  
		  Var coveredCols() As Integer
		  If Not DLXCoverGivens(coveredCols) Then
		    DLXUncoverAll(coveredCols)
		    Return 0
		  End If
		  
		  Var count As Integer = 0
		  DLXCountSolutionsRecursive(count, limit)
		  
		  DLXUncoverAll(coveredCols)
		  Return count
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DLXApplySolutionToGrid(solution() As Integer)
		  ' Decode DLX solution row IDs and apply them to the grid.
		  ' Each row ID encodes (row, col, digit) as: row * N² + col * N + digit
		  
		  #Pragma DisableBoundsChecking
		  
		  Var N As Integer = mGrid.Settings.N
		  
		  For Each rowId As Integer In solution
		    Var cell As Integer = rowId \ N
		    Var row As Integer = cell \ N
		    Var col As Integer = cell Mod N
		    Var digit As Integer = (rowId Mod N) + 1
		    mGrid.Set(row, col) = digit
		  Next
		  
		End Sub
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
		Private Function DLXCoverGivens(ByRef coveredCols() As Integer) As Boolean
		  ' Cover all columns corresponding to filled cells (givens) in the grid.
		  ' Returns True if all givens are consistent, False if any conflict.
		  ' The coveredCols array is populated for later uncovering.
		  
		  #Pragma DisableBoundsChecking
		  
		  Var N As Integer = mGrid.Settings.N
		  Var NN As Integer = N * N
		  
		  Redim coveredCols(-1)
		  
		  For cell As Integer = 0 To NN - 1
		    Var row As Integer = cell \ N
		    Var col As Integer = cell Mod N
		    Var digit As Integer = mGrid.Get(row, col)
		    If digit = 0 Then Continue
		    
		    Var rowId As Integer = row * NN + col * N + (digit - 1)
		    
		    If Not DLXRowSelectionApply(rowId, coveredCols) Then
		      Return False
		    End If
		  Next
		  
		  Return True
		  
		End Function
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
		  ' Solve the current grid using DLX.
		  ' Covers filled cells (givens), solves, then restores matrix.
		  ' Returns True if a solution was found, False otherwise.
		  
		  Var coveredCols() As Integer
		  If Not DLXCoverGivens(coveredCols) Then
		    DLXUncoverAll(coveredCols)
		    Redim solution(-1)
		    Return False
		  End If
		  
		  Redim solution(-1)
		  Var solved As Boolean = DLXSolveRecursive(solution, randomize)
		  
		  DLXUncoverAll(coveredCols)
		  Return solved
		  
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

	#tag Method, Flags = &h21
		Private Sub DLXUncoverAll(coveredCols() As Integer)
		  ' Uncover all columns in reverse order to restore DLX matrix state.
		  
		  For i As Integer = coveredCols.LastIndex DownTo 0
		    DLXUncover(coveredCols(i))
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GenerateRandomSolution() As Boolean
		  ' Generate a complete random valid Sudoku solution.
		  ' The grid will be completely filled with a valid solution.
		  ' Returns True on success.
		  
		  mGrid.Clear
		  
		  Var solution() As Integer
		  ' Call DLXSolveRecursive directly since we start from empty grid
		  If Not DLXSolveRecursive(solution, True) Then
		    Return False
		  End If
		  
		  DLXApplySolutionToGrid(solution)
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Invalidate()
		  ' Invalidate the cached solvability state
		  mCacheIsSolvable = IsSolvableState.Unknown
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsSolvable() As Boolean
		  ' Check if the puzzle has at least one valid solution.
		  ' Uses cached result if available.
		  
		  Select Case mCacheIsSolvable
		    
		  Case IsSolvableState.Solvable
		    Return True
		    
		  Case IsSolvableState.NotSolvable
		    Return False
		    
		  Else
		    ' Check basic validity first
		    If Not mGrid.IsValid Then
		      mCacheIsSolvable = IsSolvableState.NotSolvable
		      Return False
		    End If
		    
		    ' For sparse puzzles, assume solvable (skip expensive DLX check)
		    If mGrid.Settings.N > 6 Then
		      Var limitAssumeIsSolvable As Integer = Ceiling(kTresholdFactorAssumeIsSolvable * (mGrid.Settings.N * mGrid.Settings.N))
		      If mGrid.GetCountNonEmpty <= limitAssumeIsSolvable Then
		        mCacheIsSolvable = IsSolvableState.Solvable
		        Return True
		      End If
		    End If
		    
		    ' Use DLX to check if at least one solution exists
		    If Me.CountSolutions(1) >= 1 Then
		      mCacheIsSolvable = IsSolvableState.Solvable
		      Return True
		    Else
		      mCacheIsSolvable = IsSolvableState.NotSolvable
		      Return False
		    End If
		    
		  End Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetStateIsSolvable()
		  ' Mark the puzzle as solvable (used after generation)
		  mCacheIsSolvable = IsSolvableState.Solvable
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Solve() As Boolean
		  ' Solve the puzzle, filling in all empty cells with the solution.
		  ' Returns True on success, False if no solution exists.
		  
		  ' Check basic validity first
		  If Not mGrid.IsValid Then
		    mCacheIsSolvable = IsSolvableState.NotSolvable
		    Return False
		  End If
		  
		  ' Solve using DLX
		  Var solution() As Integer
		  If DLXSolve(solution, False) Then
		    DLXApplySolutionToGrid(solution)
		    mCacheIsSolvable = IsSolvableState.Solvable
		    Return True
		  Else
		    mCacheIsSolvable = IsSolvableState.NotSolvable
		    Return False
		  End If
		  
		End Function
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


	#tag Note, Name = Solver
		' ============================================================================
		' Sudoku Solver - Dancing Links (DLX) - Knuth's Algorithm X - Implementation
		' ============================================================================
		'
		' Implements Knuth's Algorithm X using Dancing Links to solve Sudoku
		' as an exact-cover problem:
		' - 4*N² constraint columns: cell, row–digit, column–digit, box–digit.
		' - N³ possibility rows: each cell–digit assignment as one exact-cover row.
		' - Efficient Cover/Uncover operations support fast backtracking.
		' - MRV (Minimum Remaining Values) heuristic selects the column with
		'   the fewest remaining options.
		'
		' ============================================================================
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private mCacheIsSolvable As IsSolvableState = IsSolvableState.Unknown
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 444C583A20436F6C756D6E2068656164657220666F722065616368206E6F6465
		Private mDLXColHeader() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 444C583A2053697A65206F66206561636820636F6C756D6E2028636F756E74206F6620726F777329
		Private mDLXColSize() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 444C583A20547261636B732077686963682063616E64696461746573206172652063757272656E746C7920636F7665726564
		Private mDLXColumnCovered() As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 444C583A20446F776E20706F696E7465727320666F7220766572746963616C206C696E6B696E67
		Private mDLXDown() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 444C583A204C65667420706F696E7465727320666F7220686F72697A6F6E74616C206C696E6B696E67
		Private mDLXLeft() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 444C583A204E756D626572206F6620636F6C756D6E7320696E20746865206D6174726978
		Private mDLXNumCols As Integer
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 444C583A204E756D626572206F6620726F777320696E20746865206D6174726978
		Private mDLXNumRows As Integer
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 444C583A20526967687420706F696E7465727320666F7220686F72697A6F6E74616C206C696E6B696E67
		Private mDLXRight() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 444C583A20486561642028666972737420636F6C756D6E206E6F64652920666F72206561636820726F77
		Private mDLXRowHead() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 444C583A20526F77204944202872657072657365746E74696E6720726F772C20636F6C2C20646967697429
		Private mDLXRowId() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 444C583A20557020706F696E7465727320666F7220766572746963616C206C696E6B696E67
		Private mDLXUp() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGrid As Grid
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 52616E646F6D20696E7374616E636520666F722070757A7A6C652067656E65726174696F6E
		Private mRandom As Random
	#tag EndProperty


	#tag Constant, Name = kTresholdFactorAssumeIsSolvable, Type = Double, Dynamic = False, Default = \".172", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kTresholdFactorSolveEnabled, Type = Double, Dynamic = False, Default = \".209", Scope = Private
	#tag EndConstant


	#tag Enum, Name = IsSolvableState, Type = Integer, Flags = &h21
		Unknown = 0
		  NotSolvable = 1
		Solvable = 2
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

#tag Class
Private Class Generator
	#tag Method, Flags = &h0
		Sub Constructor(n As Integer)
		  // TODO: Move all basic Grid functionality into Grid class
		  
		  ' Initialize the Generator for a Sudoku of size N x N
		  
		  ' Init Grid
		  Select Case n
		  Case 4
		    mN = 4
		    mBoxWidth = 2
		    mBoxHeight = 2
		  Case 6
		    mN = 6
		    mBoxWidth = 3
		    mBoxHeight = 2
		  Case 8
		    mN = 8
		    mBoxWidth = 4
		    mBoxHeight = 2
		  Case 9
		    mN = 9
		    mBoxWidth = 3
		    mBoxHeight = 3
		  Case 12
		    mN = 12
		    mBoxWidth = 4
		    mBoxHeight = 3
		  Case 16
		    mN = 16
		    mBoxWidth = 4
		    mBoxHeight = 4
		  Else
		    Raise New InvalidArgumentException("Unsupported Sudoku Size N=" + n.ToString)
		  End Select
		  
		  mNN = mN * mN
		  mNumCols = 4 * mNN
		  mNumRows = mN * mNN  ' N³
		  
		  ' Allocate result grid
		  Redim mGrid(mNN - 1)
		  
		  ' Init a Random Instance used to generate new Sudoku Puzzles
		  mRandom = New Random
		  
		  ' Build the DLX matrix once - we'll reuse it
		  DLXMatrixBuild
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CountSolutions(limit As Integer) As Integer
		  // TODO: Move all solver logic into Solver Class
		  
		  ' Count solutions using DLX with incremental covering
		  ' We cover columns for filled cells, count, then uncover to restore.
		  
		  #Pragma DisableBoundsChecking
		  
		  ' Track which columns we covered for filled cells (to uncover later)
		  Var coveredCols() As Integer
		  Var presetsValid As Boolean = True
		  
		  ' For each filled cell, cover the row that represents this assignment
		  For cell As Integer = 0 To mNN - 1
		    Var digit As Integer = mGrid(cell)
		    If digit = 0 Then Continue
		    
		    Var row As Integer = cell \ mN
		    Var col As Integer = cell Mod mN
		    Var rowId As Integer = row * mNN + col * mN + (digit - 1)
		    
		    If (Not DLXRowSelectionApply(rowId, coveredCols)) Then
		      presetsValid = False
		      Exit
		    End If
		  Next
		  
		  ' Now count solutions with DLX (only if givens were consistent)
		  Var count As Integer = 0
		  If presetsValid Then
		    CountSolutionsRecursive(count, limit)
		  End If
		  
		  ' Uncover in reverse order to restore matrix to clean state
		  For i As Integer = coveredCols.LastIndex DownTo 0
		    DLXUncover(coveredCols(i))
		  Next
		  
		  Return count
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CountSolutionsRecursive(ByRef count As Integer, limit As Integer)
		  // TODO: Move all solver logic into Solver Class
		  ' Recursive DLX solution counter
		  
		  #Pragma DisableBoundsChecking
		  
		  If count >= limit Then Return
		  
		  ' If no columns left, found a solution
		  If mRight(0) = 0 Then
		    count = count + 1
		    Return
		  End If
		  
		  ' Choose column with minimum size (MRV heuristic)
		  Var bestCol As Integer = mRight(0)
		  Var bestSize As Integer = mColSize(bestCol)
		  
		  Var col As Integer = mRight(bestCol)
		  While col <> 0
		    If mColSize(col) < bestSize Then
		      bestSize = mColSize(col)
		      bestCol = col
		      If bestSize <= 1 Then Exit ' Can't do better
		    End If
		    col = mRight(col)
		  Wend
		  
		  ' If column has no rows, dead end
		  If bestSize = 0 Then Return
		  
		  ' Cover the chosen column
		  DLXCover(bestCol)
		  
		  ' Try each row in this column
		  Var row As Integer = mDown(bestCol)
		  While row <> bestCol
		    If count >= limit Then Exit
		    
		    ' Cover all other columns in this row
		    Var node As Integer = mRight(row)
		    While node <> row
		      DLXCover(mColHeader(node))
		      node = mRight(node)
		    Wend
		    
		    ' Recurse
		    CountSolutionsRecursive(count, limit)
		    
		    ' Uncover columns in reverse order
		    node = mLeft(row)
		    While node <> row
		      DLXUncover(mColHeader(node))
		      node = mLeft(node)
		    Wend
		    
		    row = mDown(row)
		  Wend
		  
		  ' Uncover the chosen column
		  DLXUncover(bestCol)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DLXCover(colHeader As Integer)
		  // TODO: Move all solver logic into Solver Class
		  ' Cover a column: remove it from the header list and remove all rows
		  ' that have a 1 in this column from all other columns they're in
		  
		  #Pragma DisableBoundsChecking
		  
		  If mColumnCovered(colHeader) Then Return
		  mColumnCovered(colHeader) = True
		  
		  ' Unlink column header from horizontal list
		  mRight(mLeft(colHeader)) = mRight(colHeader)
		  mLeft(mRight(colHeader)) = mLeft(colHeader)
		  
		  ' For each row in this column
		  Var row As Integer = mDown(colHeader)
		  While row <> colHeader
		    ' For each other node in this row
		    Var node As Integer = mRight(row)
		    While node <> row
		      ' Unlink from its column's vertical list
		      Var up As Integer = mUp(node)
		      Var down As Integer = mDown(node)
		      mDown(up) = down
		      mUp(down) = up
		      mColSize(mColHeader(node)) = mColSize(mColHeader(node)) - 1
		      node = mRight(node)
		    Wend
		    row = mDown(row)
		  Wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DLXMatrixBuild()
		  // TODO: Move all solver logic into Solver Class
		  ' Build the exact cover matrix for Sudoku using Dancing Links
		  ' 
		  ' Node layout:
		  ' - Node 0 is the root header
		  ' - Nodes 1 to mNumCols are column headers
		  ' - Remaining nodes are the actual matrix entries
		  
		  #Pragma DisableBoundsChecking
		  
		  ' Each row has 4 nodes, plus we need column headers and root
		  Var totalNodes As Integer = 1 + mNumCols + mNumRows * 4
		  
		  Redim mLeft(totalNodes - 1)
		  Redim mRight(totalNodes - 1)
		  Redim mUp(totalNodes - 1)
		  Redim mDown(totalNodes - 1)
		  Redim mColHeader(totalNodes - 1)
		  Redim mRowId(totalNodes - 1)
		  Redim mColSize(mNumCols)  ' Index 0 unused, 1..mNumCols for headers
		  Redim mRowHead(mNumRows - 1)
		  Redim mColumnCovered(mNumCols)
		  
		  ' Initialize root (node 0)
		  mLeft(0) = mNumCols
		  mRight(0) = 1
		  
		  ' Initialize column headers (nodes 1 to mNumCols)
		  For c As Integer = 1 To mNumCols
		    mLeft(c) = c - 1
		    mRight(c) = If(c = mNumCols, 0, c + 1)
		    mUp(c) = c
		    mDown(c) = c
		    mColHeader(c) = c
		    mColSize(c) = 0
		  Next
		  
		  ' Track last node in each column for efficient insertion
		  Var colTail() As Integer
		  Redim colTail(mNumCols)
		  For c As Integer = 1 To mNumCols
		    colTail(c) = c
		  Next
		  
		  ' Add rows for each possibility (row, col, digit)
		  Var nodeIdx As Integer = mNumCols + 1
		  
		  For row As Integer = 0 To mN - 1
		    For col As Integer = 0 To mN - 1
		      For digit As Integer = 0 To mN - 1
		        ' Calculate the 4 constraint columns (1-indexed)
		        Var cellConstraint As Integer = row * mN + col + 1
		        Var rowDigitConstraint As Integer = mNN + row * mN + digit + 1
		        Var colDigitConstraint As Integer = 2 * mNN + col * mN + digit + 1
		        Var boxIdx As Integer = (row \ mBoxHeight) * (mN \ mBoxWidth) + (col \ mBoxWidth)
		        Var boxDigitConstraint As Integer = 3 * mNN + boxIdx * mN + digit + 1
		        
		        ' Row ID encodes (row, col, digit)
		        Var rowId As Integer = row * mNN + col * mN + digit
		        
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
		          mRowId(nodeIdx) = rowId
		          mColHeader(nodeIdx) = c
		          
		          ' Insert into column's vertical list (at end)
		          mUp(nodeIdx) = colTail(c)
		          mDown(nodeIdx) = c  ' Points back to header
		          mDown(colTail(c)) = nodeIdx
		          mUp(c) = nodeIdx
		          colTail(c) = nodeIdx
		          
		          ' Increment column size
		          mColSize(c) = mColSize(c) + 1
		          
		          nodeIdx = nodeIdx + 1
		        Next
		        
		        ' Link nodes horizontally (circular)
		        Var lastNode As Integer = nodeIdx - 1
		        mRowHead(rowId) = firstNode
		        For i As Integer = firstNode To lastNode
		          mLeft(i) = If(i = firstNode, lastNode, i - 1)
		          mRight(i) = If(i = lastNode, firstNode, i + 1)
		        Next
		      Next
		    Next
		  Next
		  
		  mNodeCount = nodeIdx
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DLXRowSelectionApply(rowId As Integer, ByRef coveredCols() As Integer) As Boolean
		  // TODO: Move all solver logic into Solver Class
		  ' Covers all columns corresponding to a specific row (assignment)
		  ' Returns False if the row conflicts with already-covered columns.
		  
		  #Pragma DisableBoundsChecking
		  
		  If rowId < 0 Or rowId > mRowHead.LastIndex Then Return False
		  
		  Var rowNode As Integer = mRowHead(rowId)
		  If rowNode = 0 Then Return False
		  
		  Var localCols() As Integer
		  
		  ' Cover secondary columns first (move right)
		  Var node As Integer = mRight(rowNode)
		  While node <> rowNode
		    Var colHeader As Integer = mColHeader(node)
		    If mColumnCovered(colHeader) Then
		      DLXRowSelectionRollback(localCols)
		      Return False
		    End If
		    
		    DLXCover(colHeader)
		    localCols.Add(colHeader)
		    node = mRight(node)
		  Wend
		  
		  ' Finally cover the primary column for this row
		  Var primaryCol As Integer = mColHeader(rowNode)
		  If mColumnCovered(primaryCol) Then
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
		  // TODO: Move all solver logic into Solver Class
		  #Pragma DisableBoundsChecking
		  
		  For i As Integer = localCols.LastIndex DownTo 0
		    DLXUncover(localCols(i))
		  Next
		  
		  Redim localCols(-1)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DLXUncover(colHeader As Integer)
		  // TODO: Move all solver logic into Solver Class
		  ' Uncover a column: reverse the cover operation exactly
		  ' This is where the "dancing" happens - we relink nodes using their preserved pointers
		  
		  #Pragma DisableBoundsChecking
		  
		  If (Not mColumnCovered(colHeader)) Then Return
		  
		  ' For each row in this column (in reverse order)
		  Var row As Integer = mUp(colHeader)
		  While row <> colHeader
		    ' For each other node in this row (in reverse order)
		    Var node As Integer = mLeft(row)
		    While node <> row
		      ' Relink into its column's vertical list
		      Var colIdx As Integer = mColHeader(node)
		      mColSize(colIdx) = mColSize(colIdx) + 1
		      mDown(mUp(node)) = node
		      mUp(mDown(node)) = node
		      node = mLeft(node)
		    Wend
		    row = mUp(row)
		  Wend
		  
		  ' Relink column header into horizontal list
		  mRight(mLeft(colHeader)) = colHeader
		  mLeft(mRight(colHeader)) = colHeader
		  
		  mColumnCovered(colHeader) = False
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Generate(numClues As Integer) As Boolean
		  // TODO: Move the public Method to generate a new Sudoku into Puzzle Class
		  ' Generate a random Sudoku puzzle with numClues
		  ' (may be more if not reached while guaranteeing a unique solution)
		  
		  #Pragma DisableBoundsChecking
		  
		  ' Sanitize numClues
		  If numClues < 1 Then numClues = 1
		  If numClues > mNN Then numClues = mNN
		  
		  ' Generate a complete valid solution using DLX
		  Var solution() As Integer
		  If Not Solve(solution, True) Then
		    Return False
		  End If
		  
		  ' Clear grid
		  For i As Integer = 0 To mNN - 1
		    mGrid(i) = 0
		  Next
		  
		  ' Decode solution into grid
		  For Each rowId As Integer In solution
		    Var cell As Integer = rowId \ mN
		    Var digit As Integer = (rowId Mod mN) + 1
		    mGrid(cell) = digit
		  Next
		  
		  ' Remove cells to target numClues while maintaining unique solution
		  
		  ' Build shuffled list of cell indices
		  Var indices() As Integer
		  Redim indices(mNN - 1)
		  For i As Integer = 0 To mNN - 1
		    indices(i) = i
		  Next
		  
		  ' Fisher-Yates shuffle
		  For i As Integer = mNN - 1 DownTo 1
		    Var j As Integer = mRandom.InRange(0, i)
		    Var tmp As Integer = indices(i)
		    indices(i) = indices(j)
		    indices(j) = tmp
		  Next
		  
		  ' Try to remove cells
		  Var targetRemovals As Integer = mNN - numClues
		  Var removed As Integer = 0
		  
		  For Each idx As Integer In indices
		    If removed >= targetRemovals Then Exit
		    
		    Var backup As Integer = mGrid(idx)
		    If backup = 0 Then Continue
		    
		    ' Try removing this cell
		    mGrid(idx) = 0
		    
		    ' Check if puzzle still has unique solution using DLX
		    If CountSolutions(2) = 1 Then
		      removed = removed + 1
		    Else
		      ' Restore
		      mGrid(idx) = backup
		    End If
		  Next
		  
		  If removed < targetRemovals Then
		    ' Could not remove enough cells while keeping uniqueness.
		    ' Let's just accept the puzzle with more clues than requested...
		    ' Otherwise we'd need to do repeated passes (retry with a new shuffle)
		    ' until the target is reached or a max attempt count is exhausted
		    Break ' Just to show this information in Debug Builds
		    Return False
		  End If
		  
		  ' Done — grid now contains the generated puzzle
		  Return True
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSolution(row As Integer, col As Integer) As Integer
		  // TODO: Move all basic Grid functionality into Grid class (this should be Grid.Get)
		  Return mGrid(row * mN + col)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Solve(ByRef solution() As Integer, randomize As Boolean) As Boolean
		  // TODO: Move all solver logic into Solver Class
		  ' Solve using Dancing Links (DLX) - Knuth's Algorithm X
		  
		  #Pragma DisableBoundsChecking
		  
		  Redim solution(-1)
		  Return SolveRecursive(solution, randomize)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SolveRecursive(ByRef solution() As Integer, randomize As Boolean) As Boolean
		  // TODO: Move all solver logic into Solver Class
		  ' Recursive DLX solver
		  
		  #Pragma DisableBoundsChecking
		  
		  ' If no columns left, we found a solution
		  If mRight(0) = 0 Then
		    Return True
		  End If
		  
		  ' Choose column with minimum size (MRV heuristic)
		  Var bestCol As Integer = mRight(0)
		  Var bestSize As Integer = mColSize(bestCol)
		  
		  Var col As Integer = mRight(bestCol)
		  While col <> 0
		    If mColSize(col) < bestSize Then
		      bestSize = mColSize(col)
		      bestCol = col
		      If bestSize <= 1 Then Exit ' Can't do better
		    End If
		    col = mRight(col)
		  Wend
		  
		  ' If column has no rows, dead end
		  If bestSize = 0 Then
		    Return False
		  End If
		  
		  ' Cover the chosen column
		  DLXCover(bestCol)
		  
		  ' Collect rows in this column
		  Var rows() As Integer
		  Var row As Integer = mDown(bestCol)
		  While row <> bestCol
		    rows.Add(row)
		    row = mDown(row)
		  Wend
		  
		  ' Shuffle rows for randomization
		  If randomize And rows.Count > 1 Then
		    For i As Integer = rows.LastIndex DownTo 1
		      Var j As Integer = mRandom.InRange(0, i)
		      Var tmp As Integer = rows(i)
		      rows(i) = rows(j)
		      rows(j) = tmp
		    Next
		  End If
		  
		  '  Try each row
		  For Each r As Integer In rows
		    '  Add this row to solution
		    solution.Add(mRowId(r))
		    
		    ' Cover all other columns in this row
		    Var node As Integer = mRight(r)
		    While node <> r
		      DLXCover(mColHeader(node))
		      node = mRight(node)
		    Wend
		    
		    ' Recurse
		    If SolveRecursive(solution, randomize) Then
		      ' Uncover local covered columns for this row before returning,
		      ' so that matrix remains in consistent state
		      node = mLeft(r)
		      While node <> r
		        DLXUncover(mColHeader(node))
		        node = mLeft(node)
		      Wend
		      
		      ' Uncover the chosen column
		      DLXUncover(bestCol)
		      
		      Return True
		    End If
		    
		    ' Backtrack: uncover columns in reverse order
		    node = mLeft(r)
		    While node <> r
		      DLXUncover(mColHeader(node))
		      node = mLeft(node)
		    Wend
		    
		    solution.RemoveAt(solution.LastIndex)
		  Next
		  
		  ' Uncover the chosen column
		  DLXUncover(bestCol)
		  
		  Return False
		  
		End Function
	#tag EndMethod


	#tag Note, Name = DLX
		' ============================================================================
		' Fast Sudoku Generator using Dancing Links (DLX) - Knuth's Algorithm X
		' 
		' DLX uses a sparse matrix representation with doubly-linked lists.
		' 
		' For Sudoku, we have:
		' - 4*N² columns (constraints): cell, row-digit, col-digit, box-digit
		' - N³ rows (possibilities): each cell can have each digit
		' - Each row has exactly 4 nodes (one per constraint type)
		' ============================================================================
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private mBoxHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBoxWidth As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mColHeader() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mColSize() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mColumnCovered() As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDown() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGrid() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLeft() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mN As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNN As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNodeCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNumCols As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNumRows As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRandom As Random
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRight() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRowHead() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRowId() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUp() As Integer
	#tag EndProperty


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

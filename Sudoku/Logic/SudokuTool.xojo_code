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
		  Var row, col As Integer
		  If Not FindEmpty(row, col) Then
		    Return 1 ' Found one solution
		  End If
		  
		  Var total As Integer = 0
		  ' Try every possible digit for that empty cell
		  For val As Integer = 1 To N
		    If IsValueValid(row, col, val) Then
		      ' After trying a digit, reset the cell to 0 and try the next digit
		      grid(row, col) = val
		      total = total + CountSolutions(limit)
		      grid(row, col) = 0
		      
		      If total >= limit Then
		        Exit ' No need to count more
		      End If
		    End If
		  Next
		  
		  Return total
		End Function
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
		Sub GenerateRandomPuzzle(numClues As Integer = 32)
		  Var Rnd As New Random
		  
		  ' Sanitize numClues
		  If numClues < 1 Then numClues = 1
		  If numClues > N*N Then numClues = N*N
		  
		  ClearGrid
		  
		  ' Place a random Number
		  grid(Rnd.InRange(0, N-1), Rnd.InRange(0, N-1)) = Rnd.InRange(1, N)
		  
		  ' Start with a valid, solved grid
		  Call Solve
		  
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
		  For i As Integer = 0 To removeCount - 1
		    Var idx As Integer = indices(i)
		    Var rr As Integer = idx \ N
		    Var cc As Integer = idx Mod N
		    Var backup As Integer = grid(rr, cc)
		    
		    grid(rr, cc) = 0
		    If CountSolutions(2) <> 1 Then
		      ' Not unique anymore, restore the number
		      grid(rr, cc) = backup
		    End If
		  Next
		  
		  ' Done — grid now contains the generated puzzle (numClues non-zero cells)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetGridCell(r As Integer, c As Integer) As Integer
		  Return grid(r,c)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsEmpty() As Boolean
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
		Private Function IsValueValid(r As Integer, c As Integer, val As Integer) As Boolean
		  ' Check if placing 'val' at grid(r, c) is allowed according
		  ' to Sudoku rules. Returns True if valid, False otherwise.
		  
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
		  ' Ensure current filled-in digits are valid
		  If (Not IsValid()) Then Return False
		  
		  Return SolveInternal()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SolveInternal() As Boolean
		  Var row As Integer
		  Var col As Integer
		  
		  ' Find the next empty cell
		  ' If there are no empty cells left, the puzzle is solved
		  If Not FindEmpty(row, col) Then
		    Return True
		  End If
		  
		  ' Try all possible numbers (1-9) for this empty cell
		  For Val As Integer = 1 To N
		    ' Check if placing 'val' here is allowed by Sudoku rules
		    If IsValueValid(row, col, Val) Then
		      ' Tentatively place 'val' in the cell
		      grid(row, col) = Val
		      
		      ' Recursively attempt to solve the rest of the grid
		      If SolveInternal() Then
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


	#tag Property, Flags = &h21
		Private grid(-1,-1) As Integer
	#tag EndProperty


	#tag Constant, Name = N, Type = Double, Dynamic = False, Default = \"9", Scope = Public
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

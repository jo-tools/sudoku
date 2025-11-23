#tag Class
Private Class HintsSearcher
	#tag Method, Flags = &h0
		Sub Constructor(grid As Grid)
		  Me.grid = grid
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CreateCellHint(row As Integer, col As Integer, solveHint As SolveHint, solutionValue As Integer) As CellHint
		  Var h As CellHint
		  h.Row = row
		  h.Col = col
		  h.SolveHint = solveHint
		  h.SolutionValue = solutionValue
		  
		  Return h
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Get(row As Integer, col As Integer) As CellHint
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  Var cellHint As CellHint
		  cellHint.Row = row
		  cellHint.Col = col
		  cellHint.SolveHint = SolveHint.None
		  cellHint.SolutionValue = 0
		  
		  ' No Hints in non empty Cells
		  If Me.grid.Get(row, col) <> 0 Then
		    Return Me.CreateCellHint(row, col, SolveHint.None, 0)
		  End If
		  
		  ' 1. Basic Sudoku Rules (Naked Single)
		  ' Distinct digit in each row/col/block
		  Var candidates() As Integer
		  For value As Integer = 1 To N
		    If Me.grid.IsValueValid(row, col, value) Then
		      candidates.Add(value)
		      If (candidates.Count > 1) Then Exit ' We just need to know if more than two candidates for the Naked Single Check
		    End If
		  Next
		  
		  If candidates.Count = 1 Then
		    Return Me.CreateCellHint(row, col, SolveHint.NakedSingle, candidates(0))
		  End If
		  
		  ' 2. Hidden Single
		  ' Only one spot for a digit in row/col/block
		  For value As Integer = 1 To N
		    If Me.IsValueHiddenSingle(row, col, value) Then
		      Return Me.CreateCellHint(row, col, SolveHint.HiddenSingle, value)
		      Exit 
		    End If
		  Next
		  
		  Return Me.CreateCellHint(row, col, SolveHint.None, 0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCellHints() As CellHint()
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  Var cellHints() As CellHint
		  
		  ' Add Solve Cell Hints
		  For row As Integer = 0 To N-1
		    For col As Integer = 0 To N-1
		      ' No Hints in non empty Cells
		      If Me.grid.Get(row, col) <> 0 Then
		        Continue
		      End If
		      
		      Var solveCellHint As CellHint = Me.Get(row, col)
		      If (solveCellHint.SolveHint = SolveHint.None) Then Continue
		      
		      cellHints.Add(solveCellHint)
		    Next
		  Next
		  
		  Return cellHints
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsValueHiddenSingle(row As Integer, col As Integer, value As Integer) As Boolean
		  ' Check if value at grid(r,c) is a hidden single.
		  
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  ' Row check
		  Var possibleCols() As Integer
		  For cc As Integer = 0 To N-1
		    If Me.grid.Get(row, cc) = 0 And Me.grid.IsValueValid(row, cc, value) Then
		      possibleCols.Add(cc)
		      If (possibleCols.Count > 1) Then Exit ' We just need to know if more than one candidate
		    End If
		  Next
		  If possibleCols.Count = 1 And possibleCols(0) = col Then
		    Return True
		  End If
		  
		  ' Column check
		  Var possibleRows() As Integer
		  For rr As Integer = 0 To N-1
		    If Me.grid.Get(rr, col) = 0 And Me.grid.IsValueValid(rr, col, value) Then
		      If (possibleRows.Count > 1) Then Exit ' We just need to know if more than one candidate
		      possibleRows.Add(rr)
		    End If
		  Next
		  If possibleRows.Count = 1 And possibleRows(0) = row Then
		    Return True
		  End If
		  
		  ' Block check
		  Var blockR As Integer = (row \ 3) * 3
		  Var blockC As Integer = (col \ 3) * 3
		  Var possibleBlockCells() As Integer
		  For rr As Integer = blockR To blockR+2
		    For cc As Integer = blockC To blockC+2
		      If Me.grid.Get(rr, cc) = 0 And Me.grid.IsValueValid(rr, cc, value) Then
		        possibleBlockCells.Add(rr * N + cc)
		      End If
		    Next
		  Next
		  
		  Var index As Integer = row * N + col
		  If possibleBlockCells.Count = 1 And possibleBlockCells(0) = index Then
		    Return True
		  End If
		  
		  Return False
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private grid As Grid
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

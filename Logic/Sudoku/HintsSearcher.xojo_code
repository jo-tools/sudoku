#tag Class
Private Class HintsSearcher
	#tag Method, Flags = &h0
		Sub Constructor(grid As Grid)
		  mGrid = grid
		  
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
		  #Pragma DisableBoundsChecking
		  
		  Var cellHint As CellHint
		  cellHint.Row = row
		  cellHint.Col = col
		  cellHint.SolveHint = SolveHint.None
		  cellHint.SolutionValue = 0
		  
		  ' No Hints in non empty Cells
		  If mGrid.Get(row, col) <> 0 Then
		    Return Me.CreateCellHint(row, col, SolveHint.None, 0)
		  End If
		  
		  ' 1. Basic Sudoku Rules (Naked Single)
		  ' Distinct digit in each row/col/block
		  Var candidateCount As Integer
		  Var singleCandidateValue As Integer
		  For value As Integer = 1 To mGrid.Settings.N
		    If mGrid.IsValueValid(row, col, value) Then
		      candidateCount = candidateCount + 1
		      singleCandidateValue = value
		      If (candidateCount > 1) Then Exit ' We just need to know if more than two candidates for the Naked Single Check
		    End If
		  Next
		  
		  If candidateCount = 1 Then
		    Return Me.CreateCellHint(row, col, SolveHint.NakedSingle, singleCandidateValue)
		  End If
		  
		  ' 2. Hidden Single
		  ' Only one spot for a digit in row/col/block
		  For value As Integer = 1 To mGrid.Settings.N
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
		  #Pragma DisableBoundsChecking
		  
		  Var cellHints() As CellHint
		  
		  ' Add Solve Cell Hints
		  For row As Integer = 0 To mGrid.Settings.N-1
		    For col As Integer = 0 To mGrid.Settings.N-1
		      ' No Hints in non empty Cells
		      If mGrid.Get(row, col) <> 0 Then
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
		  #Pragma DisableBoundsChecking
		  
		  ' Check if value at Grid(row, col) is a hidden single.
		  
		  ' Row check
		  Var rowCandidateCount As Integer
		  Var rowCandidateCol As Integer = -1
		  For cc As Integer = 0 To mGrid.Settings.N-1
		    If mGrid.Get(row, cc) = 0 And mGrid.IsValueValid(row, cc, value) Then
		      rowCandidateCount = rowCandidateCount + 1
		      rowCandidateCol = cc
		      If (rowCandidateCount > 1) Then Exit ' We just need to know if more than one candidate
		    End If
		  Next
		  If rowCandidateCount = 1 And rowCandidateCol = col Then
		    Return True
		  End If
		  
		  ' Column check
		  Var colCandidateCount As Integer
		  Var colCandidateRow As Integer = -1
		  For rr As Integer = 0 To mGrid.Settings.N-1
		    If mGrid.Get(rr, col) = 0 And mGrid.IsValueValid(rr, col, value) Then
		      colCandidateCount = colCandidateCount + 1
		      colCandidateRow = rr
		      If (colCandidateCount > 1) Then Exit ' We just need to know if more than one candidate
		    End If
		  Next
		  If colCandidateCount = 1 And colCandidateRow = row Then
		    Return True
		  End If
		  
		  ' Block check
		  Var blockR As Integer = (row \ mGrid.Settings.BoxHeight) * mGrid.Settings.BoxHeight
		  Var blockC As Integer = (col \ mGrid.Settings.BoxWidth) * mGrid.Settings.BoxWidth
		  Var blockCandidateCount As Integer
		  Var blockCandidateIndex As Integer = -1
		  For rr As Integer = blockR To blockR + mGrid.Settings.BoxHeight - 1
		    For cc As Integer = blockC To blockC + mGrid.Settings.BoxWidth - 1
		      If mGrid.Get(rr, cc) = 0 And mGrid.IsValueValid(rr, cc, value) Then
		        blockCandidateCount = blockCandidateCount + 1
		        blockCandidateIndex = mGrid.GetIndex(rr, cc)
		      End If
		    Next
		  Next
		  
		  If blockCandidateCount = 1 And blockCandidateIndex = mGrid.GetIndex(row, col) Then
		    Return True
		  End If
		  
		  Return False
		  
		End Function
	#tag EndMethod


	#tag Note, Name = HintsSearcher
		
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private mGrid As Grid
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

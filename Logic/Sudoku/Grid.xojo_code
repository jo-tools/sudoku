#tag Class
Private Class Grid
	#tag Method, Flags = &h0
		Sub Clear()
		  ' Fill entire grid with 0's
		  Redim grid(N-1, N-1)
		  For row As Integer = 0 To N-1
		    For col As Integer = 0 To N-1
		      grid(row, col) = 0
		    Next
		  Next
		  
		  Redim lockedCellIndexes(-1)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Clone() As Grid
		  Var clone As New Grid
		  
		  For row As Integer = 0 To N-1
		    For col As Integer = 0 To N-1
		      clone.Set(row, col) = Me.Get(row, col)
		      
		      If Me.IsGridCellLocked(row, col) Then
		        clone.Lock(row, col)
		      End If
		    Next
		  Next
		  
		  Return clone
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  Me.Clear
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindEmpty(ByRef outRow As Integer, ByRef outCol As Integer) As Boolean
		  ' Find the first empty cell
		  For row As Integer = 0 To N-1
		    For col As Integer = 0 To N-1
		      If grid(row, col) = 0 Then
		        outRow = row
		        outCol = col
		        Return True
		      End If
		    Next
		  Next
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Get(row As Integer, col As Integer) As Integer
		  Return grid(row, col)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasEmptyCells() As Boolean
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  For row As Integer = 0 To N-1
		    For col As Integer = 0 To N-1
		      If (grid(row, col) = 0) Then Return true
		    Next
		  Next
		  
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsEmpty() As Boolean
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  For row As Integer = 0 To N-1
		    For col As Integer = 0 To N-1
		      If (grid(row, col) <> 0) Then Return False
		    Next
		  Next
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsGridCellLocked(row As Integer, col As Integer) As Boolean
		  Var index As Integer = row * N + col
		  
		  Return (Me.Get(row, col) > 0) And (lockedCellIndexes.IndexOf(index) >= 0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsValueValid(row As Integer, col As Integer, value As Integer) As Boolean
		  ' Check if placing value at grid(r, c) is allowed according to Basic Sudoku rules.
		  ' Returns True if valid, False otherwise.
		  
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  ' 1. Check the row
		  ' A number must not appear twice in the same row
		  For cc As Integer = 0 To N-1
		    If grid(row,cc) = value Then
		      ' value already exists in this row → invalid
		      Return False
		    End If
		  Next
		  
		  ' 2. Check the column
		  ' A number must not appear twice in the same column
		  For rr As Integer = 0 To N-1
		    If grid(rr, col) = value Then
		      ' value already exists in this column → invalid
		      Return False
		    End If
		  Next
		  
		  ' 3. Check the 3x3 block
		  ' Each 3x3 block must contain unique numbers
		  ' Calculate the top-left corner of the block containing (r, c)
		  Var br As Integer = (row \ 3) * 3
		  Var bc As Integer = (col \ 3) * 3
		  
		  For rr As Integer = br To br + 2
		    For cc As Integer = bc To bc + 2
		      If grid(rr, cc) = value Then
		        ' value already exists in this 3x3 block → invalid
		        Return False
		      End If
		    Next
		  Next
		  
		  ' Passed all checks
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Lock(index As Integer)
		  If (lockedCellIndexes.IndexOf(index) < 0) Then
		    lockedCellIndexes.Add(index)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Lock(row As Integer, col As Integer)
		  Var index As Integer = row * N + col
		  
		  Me.Lock(index)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LockCurrentState()
		  ' Lock current state (used for Export in API only)
		  For row As Integer = 0 To N-1
		    For col As Integer = 0 To N-1
		      Var index As Integer = row * N + col
		      Var value As Integer = Me.Get(row, col)
		      
		      If (value > 0) Then
		        Me.Lock(row, col)
		      End If
		    Next
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Set(row As Integer, col As Integer, Assigns value As Integer)
		  grid(row, col) = value
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private grid(-1,-1) As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private lockedCellIndexes() As Integer
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

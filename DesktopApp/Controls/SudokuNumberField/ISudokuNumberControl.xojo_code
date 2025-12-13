#tag Interface
Protected Interface ISudokuNumberControl
	#tag Method, Flags = &h0
		Sub DoLock(lock As Boolean)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoSelectAll()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoSetFocus()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetColumnIndex() As Integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetHeight() As Integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetIsLocked() As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPositionIndex() As Integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRowIndex() As Integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetText() As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetWidth() As Integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetColumnIndex(columnIndex As Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetPositionIndex(positionIndex As Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetRowIndex(rowIndex As Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetText(newText As String)
		  
		End Sub
	#tag EndMethod


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
End Interface
#tag EndInterface

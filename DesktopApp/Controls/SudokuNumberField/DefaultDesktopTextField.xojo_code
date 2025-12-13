#tag Class
Protected Class DefaultDesktopTextField
Inherits DesktopTextField
Implements SudokuNumberField.ISudokuNumberControl
	#tag CompatibilityFlags = API2Only and ( (TargetDesktop and (Target32Bit or Target64Bit)) )
	#tag Event
		Sub FocusLost()
		  Me.SelectionStart = 0
		  Me.SelectionLength = 0
		  
		  delegateFocusLost.Invoke(Me)
		  FocusLost
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(key As String) As Boolean
		  Var res As Boolean = delegateKeyDown.Invoke(Me, key)
		  If KeyDown(key) Then res = True
		  Return res
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub TextChanged()
		  delegateTextChanged.Invoke(Me, Me.Text)
		  TextChanged(Me.Text)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub Constructor()
		  Super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(delegateFocusLost As SudokuNumberFocusLostDelegate, delegateKeyDown As SudokuNumberKeyDownDelegate, delegateTextChanged As SudokuNumberTextChangedDelegate)
		  Super.Constructor
		  
		  ' Setup TextField
		  Me.Width = 30
		  Me.Height = 30
		  Me.Text = ""
		  Me.FontName = "System"
		  Me.FontSize = 24
		  Me.TextAlignment = TextAlignments.Center
		  Me.HasBorder = False
		  
		  #If TargetMacOS Or TargetLinux Then
		    Me.BackgroundColor = &cffffffff 'Transparent
		  #EndIf
		  
		  #If TargetLinux Then
		    Me.Height = 32
		    Me.FontSize = 22
		  #EndIf
		  
		  ' Setup Delegates
		  Me.delegateFocusLost = delegateFocusLost
		  Me.delegateKeyDown = delegateKeyDown
		  Me.delegateTextChanged = delegateTextChanged
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DoLock(lock As Boolean)
		  // Part of the SudokuNumberField.ISudokuNumberControl interface.
		  
		  Me.Lock = lock
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DoSelectAll()
		  // Part of the SudokuNumberField.ISudokuNumberControl interface.
		  
		  Me.SelectAll
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DoSetFocus()
		  // Part of the SudokuNumberField.ISudokuNumberControl interface.
		  
		  Me.SetFocus
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetColumnIndex() As Integer
		  // Part of the SudokuNumberField.ISudokuNumberControl interface.
		  
		  Return Me.ColumnIndex
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetHeight() As Integer
		  // Part of the SudokuNumberField.ISudokuNumberControl interface.
		  
		  Return Me.Height
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetIsLocked() As Boolean
		  // Part of the SudokuNumberField.ISudokuNumberControl interface.
		  
		  Return Me.IsLocked
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetPositionIndex() As Integer
		  // Part of the SudokuNumberField.ISudokuNumberControl interface.
		  
		  Return Me.PositionIndex
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetRowIndex() As Integer
		  // Part of the SudokuNumberField.ISudokuNumberControl interface.
		  
		  Return Me.RowIndex
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetText() As String
		  // Part of the SudokuNumberField.ISudokuNumberControl interface.
		  
		  Return Me.Text
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetWidth() As Integer
		  // Part of the SudokuNumberField.ISudokuNumberControl interface.
		  
		  Return Me.Width
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsLocked() As Boolean
		  return mLocked
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Lock(Assigns lock As Boolean)
		  mLocked = lock
		  
		  If lock Then
		    Me.Bold = True
		  Else
		    Me.Bold = False
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetColumnIndex(columnIndex As Integer)
		  // Part of the SudokuNumberField.ISudokuNumberControl interface.
		  
		  Me.ColumnIndex = columnIndex
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetPositionIndex(positionIndex As Integer)
		  // Part of the SudokuNumberField.ISudokuNumberControl interface.
		  
		  Me.PositionIndex = positionIndex
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetRowIndex(rowIndex As Integer)
		  // Part of the SudokuNumberField.ISudokuNumberControl interface.
		  
		  Me.RowIndex = rowIndex
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetText(newText As String)
		  // Part of the SudokuNumberField.ISudokuNumberControl interface.
		  
		  Me.Text = newText
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event FocusLost()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event KeyDown(key As String) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TextChanged(text As String)
	#tag EndHook


	#tag Property, Flags = &h0
		ColumnIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private delegateFocusLost As SudokuNumberFocusLostDelegate
	#tag EndProperty

	#tag Property, Flags = &h21
		Private delegateKeyDown As SudokuNumberKeyDownDelegate
	#tag EndProperty

	#tag Property, Flags = &h21
		Private delegateTextChanged As SudokuNumberTextChangedDelegate
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLocked As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		PositionIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		RowIndex As Integer
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
			InitialValue=""
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
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="80"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="22"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackgroundColor"
			Visible=true
			Group="Appearance"
			InitialValue="&hFFFFFF"
			Type="ColorGroup"
			EditorType="ColorGroup"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasBorder"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Format"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Password"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextColor"
			Visible=true
			Group="Appearance"
			InitialValue="&h000000"
			Type="ColorGroup"
			EditorType="ColorGroup"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontName"
			Visible=true
			Group="Font"
			InitialValue="System"
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontSize"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="Single"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontUnit"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="FontUnits"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Pixel"
				"2 - Point"
				"3 - Inch"
				"4 - Millimeter"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Font"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Font"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Visible=true
			Group="Font"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hint"
			Visible=true
			Group="Initial State"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Text"
			Visible=true
			Group="Initial State"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextAlignment"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="TextAlignments"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Left"
				"2 - Center"
				"3 - Right"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowSpellChecking"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaximumCharactersAllowed"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ValidationMask"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReadOnly"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PositionIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RowIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

#tag Class
Protected Class WinUITextField
Inherits DesktopXAMLContainer
Implements SudokuNumberField.ISudokuNumberControl
	#tag CompatibilityFlags = API2Only and ( ( TargetDesktop and ( Target32Bit or Target64Bit ) ) )
	#tag Event
		Sub EventTriggered(eventName As String, parameters As Dictionary)
		  Select Case eventName
		    
		  Case "KeyDown"
		    Var key As String = Me.AdjustKeyDown(parameters.Value("Key"))
		    Call delegateKeyDown.Invoke(Me, key)
		    Call KeyDown(key)
		    
		  Case "TextChanged"
		    delegateTextChanged.Invoke(Me, parameters.Value("Text"))
		    TextChanged(parameters.Value("Text"))
		    
		  Case "FocusLost", "LostFocus"
		    Me.SelectionStart = 0
		    Me.SelectionLength = 0
		    delegateFocusLost.Invoke(Me)
		    FocusLost
		    
		  End Select
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub FocusLost()
		  ' Dummy Implementation
		  ' This Event does not get triggered on DesktopXAMLContainer
		  delegateFocusLost.Invoke(Me)
		  FocusLost
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(key As String) As Boolean
		  ' Dummy Implementation
		  ' This Event does not get triggered on DesktopXAMLContainer
		  key = Me.AdjustKeyDown(key)
		  Var res As Boolean = delegateKeyDown.Invoke(Me, key)
		  If KeyDown(key) Then res = True
		  Return res
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function AdjustKeyDown(key As String) As String
		  ' XAML Controls send different values for KeyDown
		  ' Let's just send them back as the DesktopTextFields would
		  
		  Select Case key
		    ' Handle arrow keys
		  case "37" ' Left arrow
		    return Chr(28)
		    
		  case "39" ' Right arrow
		    return Chr(29) 
		    
		  case "38" ' Up arrow
		    return Chr(30) 
		    
		  case "40" ' Down arrow
		    return Chr(31)
		    
		  case "13", "3" ' Return, Enter
		    return Chr(13)
		    
		    ' Other special keys
		  case "8" 'Backspace
		    return Chr(8)
		    
		  case "127"
		    return Chr(127) ' Delete
		    
		  case "9" 'Tab
		    return Chr(9)
		    
		  End Select
		  
		  Return key
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  Super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(delegateFocusLost As SudokuNumberFocusLostDelegate, delegateKeyDown As SudokuNumberKeyDownDelegate, delegateTextChanged As SudokuNumberTextChangedDelegate)
		  Super.Constructor
		  
		  ' Setup XAML TextBox
		  Me.Content = "<TextBox Text='' TextAlignment='Center' FontWeight='Normal' VerticalContentAlignment='Center' HorizontalContentAlignment='Center' FontSize='20' MinHeight='30' MinWidth='30' Padding='1' BorderThickness='0' />"
		  
		  ' Setup XAML Container
		  Me.Width = 30
		  Me.Height = 30
		  Me.Text = ""
		  Me.FontWeight = "Normal"
		  
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
		  Return mLocked
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Lock(Assigns lock As Boolean)
		  mLocked = lock
		  
		  If lock Then
		    Me.FontWeight = "Bold"
		  Else
		    Me.FontWeight = "Normal"
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectAll()
		  Me.SelectionStart = 0
		  Me.SelectionLength = Me.Text.Length
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

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.Value("FontWeight")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Me.Value("FontWeight") = value
			End Set
		#tag EndSetter
		FontWeight As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mLocked As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		PositionIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		RowIndex As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.Value("SelectionLength")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Me.Value("SelectionLength") = value
			End Set
		#tag EndSetter
		SelectionLength As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.Value("SelectionStart")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Me.Value("SelectionStart") = value
			End Set
		#tag EndSetter
		SelectionStart As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.Value("Text")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Me.Value("Text") = value
			End Set
		#tag EndSetter
		Text As String
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="PanelIndex"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mIndex"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mInitialParent"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mPanelIndex"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Active"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabStop"
			Visible=false
			Group="Behavior"
			InitialValue=""
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
			Name="Transparent"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
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
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
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
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
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
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Content"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Visible=false
			Group=""
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Text"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectionLength"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectionStart"
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
		#tag ViewProperty
			Name="FontWeight"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PositionIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

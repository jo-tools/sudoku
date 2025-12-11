#tag Class
Protected Class SudokuController
Inherits WebSDKControl
	#tag Event
		Function ExecuteEvent(name As String, parameters As JSONItem) As Boolean
		  If name = "EnterKeyPressed" Then
		    ' Get the field ID and value from the parameters
		    Var fieldId As String = parameters.Value("fieldId")
		    Var encodedValue As String = parameters.Value("value")
		    Var value As String = DecodeBase64(encodedValue, Encodings.UTF8)
		    
		    ' Find the SudokuNumberField and trigger its EnterKeyPressed event
		    If Self.Parent <> Nil Then
		      For Each ctl As WebUIControl In Self.Parent.Controls
		        If ctl IsA SudokuNumberField And ctl.ControlID = fieldId Then
		          SudokuNumberField(ctl).TriggerEnterKeyPressed(value)
		          Return True
		        End If
		      Next
		    End If
		  End If
		  
		  Return False
		End Function
	#tag EndEvent

	#tag Event
		Function HandleRequest(request As WebRequest, response As WebResponse) As Boolean
		  #Pragma unused request
		  #Pragma unused response
		  
		  // Ignored for this control
		  Return False
		End Function
	#tag EndEvent

	#tag Event
		Function JavaScriptClassName() As String
		  Return "JoTools.SudokuController"
		End Function
	#tag EndEvent

	#tag Event
		Sub Serialize(js As JSONItem)
		  If Self.Parent = Nil Then
		    Return
		  End If
		  
		  Var fieldsIDs As New JSONItem("[]")
		  For Each ctl As WebUIControl In Self.Parent.Controls
		    If ctl IsA SudokuNumberField Then
		      fieldsIDs.Add(ctl.ControlID)
		    End If
		  Next
		  
		  js.Value("sudoku_field_ids") = fieldsIDs
		  js.Value("sudoku_n") = mN
		  js.Value("container_width") = mContainerWidth
		  js.Value("container_height") = mContainerHeight
		End Sub
	#tag EndEvent

	#tag Event
		Function SessionHead(session As WebSession) As String
		  #Pragma unused session
		  
		  // Ignored for this control
		  Return ""
		End Function
	#tag EndEvent

	#tag Event
		Function SessionJavascriptURLs(session As WebSession) As String()
		  #Pragma unused session
		  
		  Var result() As String
		  
		  Static jsFile As WebFile
		  If jsFile = Nil Then
		    jsFile = New WebFile(False)
		    jsFile.Filename = "sudoku-controller.js"
		    jsFile.MIMEType = "application/javascript"
		    jsFile.Data = kJavaScript
		  End If
		  result.Add(jsFile.URL)
		  
		  Return result
		End Function
	#tag EndEvent


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mContainerHeight
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mContainerHeight = value
			  UpdateControl
			End Set
		#tag EndSetter
		ContainerHeight As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mContainerWidth
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mContainerWidth = value
			  UpdateControl
			End Set
		#tag EndSetter
		ContainerWidth As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mContainerHeight As Integer = 670
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mContainerWidth As Integer = 800
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mN As Integer = 9
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mN
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mN = value
			  UpdateControl
			End Set
		#tag EndSetter
		N As Integer
	#tag EndComputedProperty


	#tag Constant, Name = kJavaScript, Type = String, Dynamic = False, Default = \"var JoTools;\n(function (JoTools) {\n  class SudokuController extends XojoWeb.XojoControl {\n    constructor(id\x2C events) {\n      super(id\x2C events);\n      this.mFieldIds \x3D [];\n      this.mN \x3D 9;\n      this.mContainerWidth \x3D 800;\n      this.mContainerHeight \x3D 670;\n      this.mParentId \x3D null;\n      this.mResizeHandler \x3D () \x3D> this.applyScale();\n      window.addEventListener(\'keydown\'\x2C (ev) \x3D> this.handleKeyPress(ev));\n      window.addEventListener(\'resize\'\x2C this.mResizeHandler);\n    }\n\n    close() {\n      window.removeEventListener(\'keydown\'\x2C (ev) \x3D> this.handleKeyPress(ev));\n      window.removeEventListener(\'resize\'\x2C this.mResizeHandler);\n      super.close();\n    }\n\n    updateControl(data) {\n      super.updateControl(data);\n      const js \x3D JSON.parse(data);\n      if (!js.parent || !js.sudoku_field_ids) {\n        return;\n      }\n\n      this.mFieldIds \x3D js.sudoku_field_ids;\n      this.mN \x3D js.sudoku_n || 9;\n      this.mContainerWidth \x3D js.container_width || 800;\n      this.mContainerHeight \x3D js.container_height || 670;\n      this.mParentId \x3D js.parent;\n      this.setupWrapper();\n      this.applyScale();\n    }\n\n    setupWrapper() {\n      const el \x3D document.getElementById(this.mParentId);\n      if (!el) return;\n      if (el.parentElement && el.parentElement.classList.contains(\'sudoku-wrapper\')) return;\n      const wrapper \x3D document.createElement(\'div\');\n      wrapper.className \x3D \'sudoku-wrapper\';\n      wrapper.style.width \x3D \'100%\';\n      wrapper.style.display \x3D \'flex\';\n      wrapper.style.justifyContent \x3D \'center\';\n      wrapper.style.overflow \x3D \'hidden\';\n      el.parentNode.insertBefore(wrapper\x2C el);\n      wrapper.appendChild(el);\n    }\n\n    applyScale() {\n      const el \x3D document.getElementById(this.mParentId);\n      if (!el) return;\n      const baseWidth \x3D this.mContainerWidth;\n      const baseHeight \x3D this.mContainerHeight;\n      const windowWidth \x3D window.innerWidth;\n      const windowHeight \x3D window.innerHeight;\n      const scaleX \x3D windowWidth / baseWidth;\n      const scaleY \x3D windowHeight / baseHeight;\n      const scale \x3D Math.min(scaleX\x2C scaleY\x2C 1);\n      el.style.transform \x3D \'scale(\' + scale + \')\';\n      el.style.transformOrigin \x3D \'top left\';\n      if (scaleY < 1 && scaleX >\x3D 1) {\n        el.style.transformOrigin \x3D \'top center\';\n      }\n      if (el.parentElement && el.parentElement.classList.contains(\'sudoku-wrapper\')) {\n        el.parentElement.style.height \x3D (baseHeight * scale) + \'px\';\n      }\n    }\n\n    handleKeyPress(ev) {\n      const fieldId \x3D ev.target.id.split(\'_\')[0];\n      const i \x3D this.mFieldIds.indexOf(fieldId);\n      if (i \x3D\x3D\x3D -1) {\n        return;\n      }\n\n      // Handle Enter key - trigger EnterKeyPressed event on the field\n      if (ev.key \x3D\x3D\x3D \'Enter\') {\n        ev.preventDefault();\n        const ctl \x3D XojoWeb.controls.lookup(fieldId);\n        if (ctl) {\n          const value \x3D ctl.mValue || \'\';\n          this.triggerServerEvent(\'EnterKeyPressed\'\x2C { fieldId: fieldId\x2C value: btoa(value) }\x2C true);\n        }\n        return;\n      }\n\n      // Handle arrow keys for navigation\n      var nextIndex \x3D null;\n      switch (ev.key) {\n        case \'ArrowLeft\': nextIndex \x3D i - 1; break;\n        case \'ArrowRight\': nextIndex \x3D i + 1; break;\n        case \'ArrowUp\': nextIndex \x3D i - this.mN; break;\n        case \'ArrowDown\': nextIndex \x3D i + this.mN; break;\n        default: return;\n      }\n\n      const ctl \x3D XojoWeb.controls.lookup(this.mFieldIds[nextIndex]);\n      if (ctl) {\n        ev.preventDefault();\n        ctl.setFocus();\n      }\n    }\n  }\nJoTools.SudokuController \x3D SudokuController;\n})(JoTools || (JoTools \x3D {}));", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="N"
			Visible=true
			Group="Behavior"
			InitialValue="9"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ContainerWidth"
			Visible=true
			Group="Behavior"
			InitialValue="800"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ContainerHeight"
			Visible=true
			Group="Behavior"
			InitialValue="670"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mPanelIndex"
			Visible=false
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PanelIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
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
			Name="ControlID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

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


	#tag Constant, Name = kJavaScript, Type = String, Dynamic = False, Default = \"var JoTools;\r\n(function(JoTools) {\r\n    class SudokuController extends XojoWeb.XojoControl {\r\n        constructor(id\x2C events) {\r\n            super(id\x2C events);\r\n            this.mFieldIds \x3D [];\r\n            this.mN \x3D 9;\r\n            this.mContainerWidth \x3D 800;\r\n            this.mContainerHeight \x3D 670;\r\n            this.mParentId \x3D null;\r\n            this.mScalingMode \x3D \'no scaling\';\r\n            this.mResizeHandler \x3D () \x3D> this.applyScale();\r\n            window.addEventListener(\'keydown\'\x2C (ev) \x3D> this.handleKeyPress(ev));\r\n            window.addEventListener(\'resize\'\x2C this.mResizeHandler);\r\n        }\r\n\r\n        close() {\r\n            window.removeEventListener(\'keydown\'\x2C (ev) \x3D> this.handleKeyPress(ev));\r\n            window.removeEventListener(\'resize\'\x2C this.mResizeHandler);\r\n            super.close();\r\n        }\r\n\r\n        updateControl(data) {\r\n            super.updateControl(data);\r\n            const js \x3D JSON.parse(data);\r\n            if (!js.parent || !js.sudoku_field_ids) {\r\n                return;\r\n            }\r\n\r\n            this.mFieldIds \x3D js.sudoku_field_ids;\r\n            this.mN \x3D js.sudoku_n || 9;\r\n            this.mContainerWidth \x3D js.container_width || 800;\r\n            this.mContainerHeight \x3D js.container_height || 670;\r\n            this.mParentId \x3D js.parent;\r\n            this.setupWrapper();\r\n            this.applyScale();\r\n        }\r\n\r\n        setupWrapper() {\r\n            const el \x3D document.getElementById(this.mParentId);\r\n            if (!el) return;\r\n            if (el.parentElement && el.parentElement.classList.contains(\'sudoku-wrapper\')) return;\r\n            const wrapper \x3D document.createElement(\'div\');\r\n            wrapper.className \x3D \'sudoku-wrapper\';\r\n            wrapper.style.width \x3D \'100%\';\r\n            wrapper.style.display \x3D \'flex\';\r\n            wrapper.style.justifyContent \x3D \'center\';\r\n            wrapper.style.overflow \x3D \'hidden\';\r\n            el.parentNode.insertBefore(wrapper\x2C el);\r\n            wrapper.appendChild(el);\r\n        }\r\n\r\n        applyScale() {\r\n            const el \x3D document.getElementById(this.mParentId);\r\n            if (!el) return;\r\n\r\n            const wrapper \x3D el.parentElement;\r\n            const baseWidth \x3D this.mContainerWidth;\r\n            const baseHeight \x3D this.mContainerHeight;\r\n            const windowWidth \x3D window.innerWidth;\r\n            const windowHeight \x3D window.innerHeight;\r\n            const scaleX \x3D windowWidth / baseWidth;\r\n            const scaleY \x3D windowHeight / baseHeight;\r\n\r\n            // No scaling needed\r\n            if (scaleX >\x3D 1 && scaleY >\x3D 1) {\r\n                this.mScalingMode \x3D \'no scaling\';\r\n                el.style.transform \x3D \'scale(1)\';\r\n                el.style.transformOrigin \x3D \'top left\';\r\n\r\n                // Center horizontally when no scaling needed\r\n                const leftOffset \x3D (windowWidth - baseWidth) / 2;\r\n                el.style.marginLeft \x3D leftOffset + \'px\';\r\n\r\n                if (wrapper && wrapper.classList.contains(\'sudoku-wrapper\')) {\r\n                    wrapper.style.height \x3D baseHeight + \'px\';\r\n                }\r\n                return;\r\n            }\r\n\r\n            // Decide scaling mode only when transitioning from \"no scaling\"\r\n            if (this.mScalingMode \x3D\x3D\x3D \'no scaling\') {\r\n                if (scaleY < 1) {\r\n                    this.mScalingMode \x3D \'scaling height\';\r\n                } else {\r\n                    this.mScalingMode \x3D \'scaling width\';\r\n                }\r\n            }\r\n\r\n            // Always use the most restrictive scale to prevent overflow\r\n            const scale \x3D Math.min(scaleX\x2C scaleY);\r\n\r\n            el.style.transform \x3D \'scale(\' + scale + \')\';\r\n            el.style.transformOrigin \x3D \'top left\';\r\n\r\n            // Calculate centering manually when in height-scaling mode\r\n            if (this.mScalingMode \x3D\x3D\x3D \'scaling height\') {\r\n                const scaledWidth \x3D baseWidth * scale;\r\n                const leftOffset \x3D (windowWidth - scaledWidth) / 2;\r\n                el.style.marginLeft \x3D leftOffset + \'px\';\r\n            } else {\r\n                el.style.marginLeft \x3D \'\';\r\n            }\r\n\r\n            if (wrapper && wrapper.classList.contains(\'sudoku-wrapper\')) {\r\n                wrapper.style.height \x3D (baseHeight * scale) + \'px\';\r\n            }\r\n        }\r\n\r\n        handleKeyPress(ev) {\r\n            const fieldId \x3D ev.target.id.split(\'_\')[0];\r\n            const i \x3D this.mFieldIds.indexOf(fieldId);\r\n            if (i \x3D\x3D\x3D -1) {\r\n                return;\r\n            }\r\n\r\n            // Handle Enter key - trigger EnterKeyPressed event on the field\r\n            if (ev.key \x3D\x3D\x3D \'Enter\') {\r\n                ev.preventDefault();\r\n                const ctl \x3D XojoWeb.controls.lookup(fieldId);\r\n                if (ctl) {\r\n                    const value \x3D ctl.mValue || \'\';\r\n                    this.triggerServerEvent(\'EnterKeyPressed\'\x2C {\r\n                        fieldId: fieldId\x2C\r\n                        value: btoa(value)\r\n                    }\x2C true);\r\n                }\r\n                return;\r\n            }\r\n\r\n            // Handle arrow keys for navigation\r\n            var nextIndex \x3D null;\r\n            switch (ev.key) {\r\n                case \'ArrowLeft\':\r\n                    nextIndex \x3D i - 1;\r\n                    break;\r\n                case \'ArrowRight\':\r\n                    nextIndex \x3D i + 1;\r\n                    break;\r\n                case \'ArrowUp\':\r\n                    nextIndex \x3D i - this.mN;\r\n                    break;\r\n                case \'ArrowDown\':\r\n                    nextIndex \x3D i + this.mN;\r\n                    break;\r\n                default:\r\n                    return;\r\n            }\r\n\r\n            const ctl \x3D XojoWeb.controls.lookup(this.mFieldIds[nextIndex]);\r\n            if (ctl) {\r\n                ev.preventDefault();\r\n                ctl.setFocus();\r\n            }\r\n        }\r\n    }\r\n    JoTools.SudokuController \x3D SudokuController;\r\n})(JoTools || (JoTools \x3D {}));", Scope = Private
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

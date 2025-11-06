#tag Class
Protected Class SudokuController
Inherits WebSDKControl
	#tag Event
		Function ExecuteEvent(name As String, parameters As JSONItem) As Boolean
		  // Ignored for this control
		  Return False
		End Function
	#tag EndEvent

	#tag Event
		Function HandleRequest(request As WebRequest, response As WebResponse) As Boolean
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
		  
		  js.Value("field_ids") = fieldsIDs
		  js.Value("size") = mSize
		End Sub
	#tag EndEvent

	#tag Event
		Function SessionHead(session As WebSession) As String
		  // Ignored for this control
		  Return ""
		End Function
	#tag EndEvent

	#tag Event
		Function SessionJavascriptURLs(session As WebSession) As String()
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


	#tag Property, Flags = &h21
		Private mSize As Integer = 9
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mSize
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSize = value
			  UpdateControl
			End Set
		#tag EndSetter
		Size As Integer
	#tag EndComputedProperty


	#tag Constant, Name = kJavaScript, Type = String, Dynamic = False, Default = \"var JoTools;\n(function (JoTools) {\n  class SudokuController extends XojoWeb.XojoControl {\n    constructor(id\x2C events) {\n      super(id\x2C events);\n      this.mFieldIds \x3D [];\n      this.mSize \x3D 9;\n      window.addEventListener(\'keydown\'\x2C (ev) \x3D> this.handleKeyPress(ev));\n    }\n\n    close() {\n      window.removeEventListener(\'keydown\'\x2C (ev) \x3D> this.handleKeyPress(ev));\n      super.close();\n    }\n\n    updateControl(data) {\n      super.updateControl(data);\n      const js \x3D JSON.parse(data);\n      if (!js.parent || !js.field_ids) {\n        return;\n      }\n\n      this.mFieldIds \x3D js.field_ids;\n      this.mSize \x3D js.size ||\xC2\xA09;\n    }\n\n    handleKeyPress(ev) {\n      const fieldId \x3D ev.target.id.split(\'_\')[0];\n      const i \x3D this.mFieldIds.indexOf(fieldId)\n      if (i \x3D\x3D\x3D -1) {\n        return;\n      }\n\n      var nextIndex \x3D null;\n      switch (ev.key) {\n        case \'ArrowLeft\': nextIndex \x3D i - 1; break;\n        case \'ArrowRight\': nextIndex \x3D i + 1; break;\n        case \'ArrowUp\': nextIndex \x3D i - this.mSize; break;\n        case \'ArrowDown\': nextIndex \x3D i + this.mSize; break;\n        default: return;\n      }\n\n      const ctl \x3D XojoWeb.controls.lookup(this.mFieldIds[nextIndex]);\n      if (ctl) {\n        ev.preventDefault();\n        ctl.setFocus();\n      }\n    }\n  }\nJoTools.SudokuController \x3D SudokuController;\n})(JoTools || (JoTools \x3D {}));", Scope = Private
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
		#tag ViewProperty
			Name="Size"
			Visible=true
			Group="Behavior"
			InitialValue="9"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

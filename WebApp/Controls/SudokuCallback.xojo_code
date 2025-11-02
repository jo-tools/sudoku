#tag Class
Protected Class SudokuCallback
Inherits WebSDKControl
	#tag Event
		Function ExecuteEvent(name As String, parameters As JSONItem) As Boolean
		  Select Case name
		    
		  Case "arrowKeyPressed"
		    Var index As Integer = parameters.Lookup("index", -1).IntegerValue
		    Var arrowKey As String = parameters.Lookup("key", "").StringValue
		    If (index >= 0) And (arrowKey <> "") Then RaiseEvent ArrowKeyPressed(index, arrowKey)
		    Return True
		    
		  End Select
		  
		End Function
	#tag EndEvent

	#tag Event
		Function HandleRequest(request As WebRequest, response As WebResponse) As Boolean
		  #Pragma unused request
		  #Pragma unused response
		  
		  ' Hidden when placed on a WebPage
		  
		End Function
	#tag EndEvent

	#tag Event
		Function JavaScriptClassName() As String
		  ' This is case-sensitive and must match the javascript class exactly
		  Return "sudoku.callback"
		End Function
	#tag EndEvent

	#tag Event
		Sub Serialize(js As JSONItem)
		  #Pragma unused js
		  
		  ' Hidden when placed on a WebPage
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function SessionHead(session As WebSession) As String
		  #Pragma unused session
		  
		  ' Hidden when placed on a WebPage
		  
		End Function
	#tag EndEvent

	#tag Event
		Function SessionJavascriptURLs(session As WebSession) As String()
		  #Pragma unused session
		  
		  ' Create a WebFile to contain the callback javascript code,
		  ' but globally without session info so we're not creating this over and over
		  If SharedJSClassFile = Nil Then
		    SharedJSClassFile = New WebFile
		    SharedJSClassFile.MIMEType = "text/javascript"
		    SharedJSClassFile.Session = Nil
		    SharedJSClassFile.Filename = "sudoku-callback.js"
		    SharedJSClassFile.Data = kJSCode
		  End If
		  
		  Return Array (SharedJSClassFile.URL)
		  
		End Function
	#tag EndEvent


	#tag Hook, Flags = &h0
		Event ArrowKeyPressed(index As Integer, arrowKey As String)
	#tag EndHook


	#tag Property, Flags = &h21
		#tag Note
			This property is so we don't have separate WebFile objects for each session, since the contents will always be the same.
		#tag EndNote
		Private Shared SharedJSClassFile As WebFile
	#tag EndProperty


	#tag Constant, Name = kJSCode, Type = String, Dynamic = False, Default = \"var sudoku;\n(function (sudoku) {\n    class sudokuCallback extends XojoWeb.XojoControl {\n        constructor(target\x2C events) {\n            super(target\x2C events);\n        }\n        arrowKeyPressed(index\x2C key) {\n            var data \x3D { index: index\x2C key: key};\n            this.triggerServerEvent(\'arrowKeyPressed\'\x2C data\x2C true);\n        }\n    }\n    sudoku.callback \x3D sudokuCallback;\n})(sudoku || (sudoku \x3D {}));", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
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
			Visible=false
			Group="Appearance"
			InitialValue=""
			Type="Boolean"
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

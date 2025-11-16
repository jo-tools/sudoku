#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Function HandleURL(request As WebRequest, response As WebResponse) As Boolean
		  If Me.HandleApiRequest(request, response) Then Return True
		  
		  Return False
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function GetJsonApplication() As JSONItem
		  Var jsonApplication As New JSONItem
		  jsonApplication.Value(SudokuTool.kJSONKeyApplicationName) = "Sudoku"
		  jsonApplication.Value(SudokuTool.kJSONKeyApplicationVersion) = Me.GetVersion
		  jsonApplication.Value(SudokuTool.kJSONKeyApplicationUrl) = SudokuTool.kURL_Repository
		  
		  Return jsonApplication
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetVersion() As String
		  If (Me.Version <> "") Then Return Me.Version
		  Return Me.MajorVersion.ToString + "." + Me.MinorVersion.ToString + "." + Me.BugVersion.ToString
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleApiRequest(request As WebRequest, response As WebResponse) As Boolean
		  If (request.Path = "") Then Return False
		  
		  ' Handle /api Requests
		  Var pathParts() As String = request.Path.Split("/")
		  If (pathParts.LastIndex < 1) Or (pathParts(0) <> "api") Then Return False
		  pathParts.RemoveAt(0)
		  
		  Select Case pathParts(0)
		    
		  Case "info"
		    WriteResponseJson(response, GetJsonApplication)
		    Return True
		    
		  Case "generate"
		    Break
		    
		  Case "solve"
		    Break
		    
		    
		  End Select
		  
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WriteResponseJson(response As WebResponse, json As JSONItem)
		  Var jsonOptions As New JSONOptions
		  jsonOptions.Compact = False
		  
		  response.Status = 200
		  response.MIMEType ="application/json"
		  response.Write(json.ToString(jsonOptions))
		  
		End Sub
	#tag EndMethod


	#tag Constant, Name = constDockerTag, Type = String, Dynamic = False, Default = \"jotools/sudoku", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass

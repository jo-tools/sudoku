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

	#tag Method, Flags = &h21, Description = 4372656174657320616E20696E7465726E616C2064696374696F6E61727920726570726573656E74696E67207468652055524C20706172616D732E
		Private Function GetQueryStringAsDictionary(request As WebRequest) As Dictionary
		  ' Create a Dictionary with the Requests QueryString values
		  var dictQueryString As New Dictionary
		  
		  ' Split QueryString into array
		  ' Example: a=123&b=456&c=999
		  Var queryStringItems() As String = request.QueryString.Split("&")
		  
		  ' Populate dictionary
		  For Each queryStringItem As String In queryStringItems
		    Var key As String = queryStringItem.NthField( "=", 1 )
		    If (key = "") Then Continue
		    
		    Var value As String = queryStringItem.NthField( "=", 2 )
		    value = Me.URLDecode(value) 
		    
		    dictQueryString.Value(key) = value
		  Next
		  
		  Return dictQueryString
		  
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
		    If (request.Method <> "GET") Then
		      response.Status = 405
		      response.MIMEType ="text/plain"
		      response.Write("Method '" + request.Method + "' not allowed." + EndOfLine.UNIX + _
		      "Supported Method: GET")
		      Return True
		    End If
		    
		    
		    Var dictParams As Dictionary = Me.GetQueryStringAsDictionary(request)
		    
		    Var numClues As Integer = dictParams.Lookup("numClues", 40).IntegerValue
		    If (numClues < 24) Then numClues = 24
		    If (numClues > SudokuTool.N*SudokuTool.N) Then numClues = SudokuTool.N*SudokuTool.N
		    
		    Var sudoku As New SudokuTool
		    Call sudoku.GenerateRandomPuzzle(numClues)
		    
		    Select Case dictParams.Lookup("format", "json").StringValue
		      
		    Case "json"
		      Var json As JSONItem = sudoku.ToJson(Me.GetJsonApplication)
		      WriteResponseJson(response, json)
		      
		    Case "txt", "text"
		      Var txt As String = sudoku.ToString
		      WriteResponseTxt(response, txt)
		      
		    Else
		      response.Status = 400
		      response.MIMEType ="text/plain"
		      response.Write("Unsupported Format '" + dictParams.Lookup("format", "json").StringValue + "'." + EndOfLine.UNIX + _
		      "Supported Formats: [txt | text | json (default)])")
		      
		    End Select
		    
		    Return True
		    
		    
		  Case "solve"
		    Break
		    
		    
		  End Select
		  
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 46756C6C79206465636F64657320612055524C2D656E636F6465642076616C75652E
		Private Function URLDecode(encoded As String) As String
		  ' Fully decodes a URL-encoded value
		  ' Unlike Xojo's "DecodeURLComponent," this method decodes any "+" characters that represent encoded space characters.
		  
		  ' Replace any "+" chars with spaces.
		  encoded = encoded.ReplaceAll("+", " ")
		  
		  ' Decode everything else.
		  encoded = DecodeURLComponent(encoded)
		  
		  Return encoded
		  
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

	#tag Method, Flags = &h21
		Private Sub WriteResponseTxt(response As WebResponse, txt As String)
		  Var jsonOptions As New JSONOptions
		  jsonOptions.Compact = False
		  
		  response.Status = 200
		  response.MIMEType ="text/plain"
		  response.Write(txt)
		  
		End Sub
	#tag EndMethod


	#tag Constant, Name = constDockerTag, Type = String, Dynamic = False, Default = \"jotools/sudoku", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass

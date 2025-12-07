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
		  jsonApplication.Value(Sudoku.kJSONKeyApplicationName) = "Sudoku"
		  jsonApplication.Value(Sudoku.kJSONKeyApplicationVersion) = Me.GetVersion
		  jsonApplication.Value(Sudoku.kJSONKeyApplicationUrl) = Sudoku.kURL_Repository
		  
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
		  
		  ' Handle /api/sudoku Requests
		  Var pathParts() As String = request.Path.Split("/")
		  If (pathParts.LastIndex < 2) Or (pathParts(0) <> "api") Or (pathParts(1) <> "sudoku") Then Return False
		  
		  Select Case pathParts(2)
		    
		  Case "info"
		    Return HandleApiRequestInfo(request, response)
		    
		  Case "generate"
		    Return HandleApiRequestGenerate(request, response)
		    
		  Case "solve"
		    Return HandleApiRequestSolve(request, response)
		    
		  End Select
		  
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleApiRequestGenerate(request As WebRequest, response As WebResponse) As Boolean
		  Print("API Request: " + request.Path)
		  
		  If (request.Method <> "GET") Then
		    response.Status = 405
		    response.MIMEType ="text/plain"
		    response.Write("Method '" + request.Method + "' not allowed." + EndOfLine.UNIX + _
		    "Supported Method: GET")
		    Return True
		  End If
		  
		  
		  Var dictParams As Dictionary = Me.GetQueryStringAsDictionary(request)
		  
		  Var N As Integer = dictParams.Lookup("size", 9).IntegerValue
		  
		  Var minCluesFactor As Double = 0.296
		  Var minNumClues As Integer = CType(Ceiling(minCluesFactor * (N*N)), Integer)
		  
		  Var defaultCluesFactor As Double = 0.444
		  Var defaultNumClues As Integer = CType(Ceiling(defaultCluesFactor * (N*N)), Integer)
		  
		  Var numClues As Integer = dictParams.Lookup("numClues", defaultNumClues).IntegerValue
		  If (numClues < minNumClues) Then numClues = minNumClues
		  If (numClues > N*N) Then numClues = N*N
		  
		  var addSolution As Boolean = dictParams.Lookup("addSolution", false).BooleanValue
		  
		  Var sudokuPuzzle As Sudoku.Puzzle
		  
		  Try
		    sudokuPuzzle = New Sudoku.Puzzle(N)
		    Call sudokuPuzzle.GenerateRandomPuzzle(numClues)
		    sudokuPuzzle.LockCurrentState
		    
		  Catch err As InvalidArgumentException
		    response.Status = 400
		    response.MIMEType ="text/plain"
		    response.Write("Could not create the Sudoku Puzzle" + EndOfLine.Unix + err.Message)
		    
		  End Try
		  
		  
		  Select Case dictParams.Lookup("format", "json").StringValue
		    
		  Case "json"
		    Var json As JSONItem = sudokuPuzzle.ToJson(Me.GetJsonApplication, addSolution)
		    WriteResponseFileJson(response, json)
		    
		  Case "txt", "text"
		    If addSolution Then
		      response.Status = 400
		      response.MIMEType ="text/plain"
		      response.Write("Add Solution is not supported in Text Format. Use /solve instead.")
		      Return True
		    End If
		    
		    Var txt As String = sudokuPuzzle.ToString
		    WriteResponseFileTxt(response, txt)
		    
		  Case "pdf"
		    ' Setup PDF
		    Var pdf As New PDFDocument(PDFDocument.PageSizes.A4)
		    Var g As Graphics = pdf.Graphics
		    
		    ' PDF MetaData
		    pdf.Title = "Sudoku"
		    pdf.Subject = "Sudoku"
		    pdf.Author = Sudoku.kURL_Repository
		    pdf.Creator = "Sudoku " + me.GetVersion + " (Xojo " + XojoVersionString + ")"
		    pdf.Keywords = "Sudoku"
		    
		    ' Draw Sudoku
		    sudokuPuzzle.DrawInto(g, addSolution)
		    
		    ' Save PDF and Download
		    WriteResponseFilePdf(response, pdf)
		    
		  Else
		    response.Status = 400
		    response.MIMEType ="text/plain"
		    response.Write("Unsupported Format '" + dictParams.Lookup("format", "json").StringValue + "'." + EndOfLine.UNIX + _
		    "Supported Formats: [json (default) | txt | text | pdf])")
		    
		  End Select
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleApiRequestInfo(request As WebRequest, response As WebResponse) As Boolean
		  Print("API Request: " + request.Path)
		  
		  WriteResponseJson(response, GetJsonApplication)
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleApiRequestSolve(request As WebRequest, response As WebResponse) As Boolean
		  Print("API Request: " + request.Path)
		  
		  If (request.Method <> "POST") Then
		    response.Status = 405
		    response.MIMEType ="text/plain"
		    response.Write("Method '" + request.Method + "' not allowed." + EndOfLine.UNIX + _
		    "Supported Method: POST")
		    Return True
		  End If
		  
		  Var dictParams As Dictionary = Me.GetQueryStringAsDictionary(request)
		  var responseFormat As String = dictParams.Lookup("format", "").StringValue
		  
		  ' Load Sudoku from POST content
		  Var sudokuPuzzle As Sudoku.Puzzle
		  
		  If (request.Body.LeftBytes(1) = "{") And (request.Body.MiddleBytes(request.Body.Bytes-1, 1) = "}") Then
		    ' Assume it's a JSON Content
		    Try
		      Var json As New JSONItem(request.Body)
		      
		      sudokuPuzzle = New Sudoku.Puzzle(json)
		      
		      If (sudokuPuzzle <> Nil) And (responseFormat = "") Then
		        responseFormat = "json"
		      End If
		      
		    Catch err1 As JSONException
		      ' Invalid JSON
		    Catch err2 As InvalidArgumentException
		      ' Invalid JSON for Sudoku
		    End Try
		  End If
		  
		  If (sudokuPuzzle = Nil) Then
		    ' Otherwise try to load from Txt content
		    Try
		      sudokuPuzzle = New Sudoku.Puzzle(request.Body)
		      
		      If (sudokuPuzzle <> Nil) And (responseFormat = "") Then
		        responseFormat = "txt"
		      End If
		      
		    Catch err As InvalidArgumentException
		      ' Invalid String representation of a Sudoku
		      
		    End Try
		  End If
		  
		  If (sudokuPuzzle = Nil) Then
		    response.Status = 400
		    response.MIMEType ="text/plain"
		    response.Write("Invalid Content. Expects a Sudoku in JSON or TXT format.")
		    Return True
		  End If
		  
		  ' Sudoku State Checks
		  sudokuPuzzle.LockCurrentState
		  Var isEmpty As Boolean = sudokuPuzzle.IsEmpty
		  Var isValid As Boolean = isEmpty Or sudokuPuzzle.IsValid
		  Var isSolvable As Boolean = isEmpty Or (isValid And sudokuPuzzle.IsSolvable)
		  
		  If isEmpty Then
		    response.Status = 400
		    response.MIMEType ="text/plain"
		    response.Write("Sudoku is empty.")
		    Return True
		  End If
		  If (Not isValid) Then
		    response.Status = 400
		    response.MIMEType ="text/plain"
		    response.Write("Sudoku is not valid.")
		    Return True
		  End If
		  If (Not isSolvable) Or (Not sudokuPuzzle.Solve) Then
		    response.Status = 400
		    response.MIMEType ="text/plain"
		    response.Write("Sudoku is not solvable.")
		    Return True
		  End If
		  
		  ' We now have the solved Sudoku
		  Select Case responseFormat
		    
		  Case "json"
		    Var json As JSONItem = sudokuPuzzle.ToJson(Me.GetJsonApplication, False)
		    WriteResponseFileJson(response, json)
		    
		  case "txt", "text"
		    Var txt As String = sudokuPuzzle.ToString
		    WriteResponseFileTxt(response, txt)
		    
		  Else
		    response.Status = 400
		    response.MIMEType ="text/plain"
		    response.Write("Unsupported Format '" + dictParams.Lookup("format", "json").StringValue + "'." + EndOfLine.UNIX + _
		    "Supported Formats: [json (default) | txt | text | pdf])")
		    
		  End Select
		  
		  Return True
		  
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
		Private Sub WriteResponseFileJson(response As WebResponse, json As JSONItem)
		  Var jsonOptions As New JSONOptions
		  jsonOptions.Compact = False
		  
		  response.Status = 200
		  response.Header("X-Powered-By") = "Sudoku " + me.GetVersion
		  response.Header("Content-Disposition") = "attachment; filename=""Sudoku " + DateTime.now.SQLDateTime.ReplaceAll(":", "-") + ".sudoku"""
		  response.MIMEType ="application/json; charset=utf-8"
		  response.Write(json.ToString(jsonOptions))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WriteResponseFilePdf(response As WebResponse, pdf As PDFDocument)
		  response.Status = 200
		  response.Header("X-Powered-By") = "Sudoku " + Me.GetVersion
		  response.Header("Content-Disposition") = "attachment; filename=""Sudoku " + DateTime.now.SQLDateTime.ReplaceAll(":", "-") + ".pdf"""
		  response.MIMEType ="application/pdf"
		  response.Write(pdf.ToData)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WriteResponseFileTxt(response As WebResponse, txt As String)
		  Var jsonOptions As New JSONOptions
		  jsonOptions.Compact = False
		  
		  response.Status = 200
		  response.Header("X-Powered-By") = "Sudoku " + Me.GetVersion
		  response.Header("Content-Disposition") = "attachment; filename=""Sudoku " + DateTime.now.SQLDateTime.ReplaceAll(":", "-") + ".sudoku"""
		  response.MIMEType ="text/plain; charset=utf-8"
		  response.Write(txt)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WriteResponseJson(response As WebResponse, json As JSONItem)
		  Var jsonOptions As New JSONOptions
		  jsonOptions.Compact = False
		  
		  response.Status = 200
		  response.Header("X-Powered-By") = "Sudoku " + Me.GetVersion
		  response.MIMEType ="application/json; charset=utf-8"
		  response.Write(json.ToString(jsonOptions))
		  
		End Sub
	#tag EndMethod


	#tag Constant, Name = constDockerTag, Type = String, Dynamic = False, Default = \"jotools/sudoku", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass

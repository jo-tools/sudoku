#tag Module
Protected Module Sudoku
	#tag CompatibilityFlags = API2Only and ( (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) )
	#tag Method, Flags = &h1
		Protected Function CreateExclusionParams() As ExclusionParams
		  Var exclusionParams As ExclusionParams
		  exclusionParams.ExcludeLockedCandidates = False
		  exclusionParams.ExcludeNakedSubsets = False
		  exclusionParams.ExcludeHiddenSubsets = False
		  exclusionParams.ExcludeXWing = False
		  Return exclusionParams
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function LoadFrom(f As FolderItem) As Puzzle
		  ' Load from FolderItem (as JSON | as Text)
		  
		  Var t As TextInputStream = TextInputStream.Open(f)
		  t.Encoding = Encodings.UTF8
		  Var fileContent As String = t.ReadAll
		  t.Close
		  
		  fileContent = fileContent.Trim
		  If (fileContent = "") Then Return Nil
		  
		  If (fileContent.LeftBytes(1) = "{") And (fileContent.MiddleBytes(fileContent.Bytes-1, 1) = "}") Then
		    ' Assume it's a JSON Content
		    Try
		      #Pragma BreakOnExceptions Off
		      
		      Var json As New JSONItem(fileContent)
		      
		      Var sudoku As New Puzzle(json)
		      If (sudoku <> Nil) Then Return sudoku
		      
		    Catch err1 As JSONException
		      ' Invalid JSON
		    Catch err2 As InvalidArgumentException
		      ' Invalid JSON for Sudoku
		    End Try
		  End If
		  
		  Try
		    Var sudoku As New Puzzle(fileContent)
		    If (sudoku <> Nil) Then Return sudoku
		    
		  Catch err As InvalidArgumentException
		    ' Invalid String for Sudoku
		    
		  End Try
		  
		  ' No success loading from File
		  Return Nil
		  
		End Function
	#tag EndMethod


	#tag Constant, Name = kEmail_Contact, Type = String, Dynamic = False, Default = \"xojo@jo-tools.ch", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kJSONKeyApplication, Type = String, Dynamic = False, Default = \"application", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kJSONKeyApplicationName, Type = String, Dynamic = False, Default = \"name", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kJSONKeyApplicationUrl, Type = String, Dynamic = False, Default = \"url", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kJSONKeyApplicationVersion, Type = String, Dynamic = False, Default = \"version", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSolution, Type = String, Dynamic = True, Default = \"Solution", Scope = Private
		#Tag Instance, Platform = Any, Language = de, Definition  = \"L\xC3\xB6sung"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Solution"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Soluci\xC3\xB3n"
	#tag EndConstant

	#tag Constant, Name = kURL_PayPal, Type = String, Dynamic = False, Default = \"https://paypal.me/jotools", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kURL_Repository, Type = String, Dynamic = False, Default = \"https://github.com/jo-tools/sudoku", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = N, Type = Double, Dynamic = False, Default = \"9", Scope = Protected
	#tag EndConstant


	#tag Structure, Name = Candidate, Flags = &h1
		Value As Integer
		Hint As CandidateHint
	#tag EndStructure

	#tag Structure, Name = CellCandidates, Flags = &h1
		Row As Integer
		  Col As Integer
		Candidates(8) As Candidate
	#tag EndStructure

	#tag Structure, Name = CellHint, Flags = &h1
		Row As Integer
		  Col As Integer
		  SolveHint As SolveHint
		SolutionValue As Integer
	#tag EndStructure

	#tag Structure, Name = ExclusionParams, Flags = &h1
		ExcludeLockedCandidates As Boolean
		  ExcludeNakedSubsets As Boolean
		  ExcludeHiddenSubsets As Boolean
		ExcludeXWing As Boolean
	#tag EndStructure


	#tag Enum, Name = CandidateHint, Flags = &h1
		NoCandidate=0
		  Candidate=1
		  ExcludedAsLockedCandidate=2
		  ExcludedAsNakedSubset=3
		  ExcludedAsHiddenSubset=4
		ExcludedAsXWing=5
	#tag EndEnum

	#tag Enum, Name = SolveHint, Flags = &h1
		None=0
		  NakedSingle=1
		HiddenSingle=2
	#tag EndEnum


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
End Module
#tag EndModule

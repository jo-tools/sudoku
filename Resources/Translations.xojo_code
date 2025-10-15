#tag Module
Protected Module Translations
	#tag Constant, Name = kLabelContact, Type = String, Dynamic = True, Default = \"Contact", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Kontakt"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Contact"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Contacto"
	#tag EndConstant

	#tag Constant, Name = kLabelNumClues, Type = String, Dynamic = True, Default = \"Clues", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Vorgaben"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Indices"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Pistas"
	#tag EndConstant

	#tag Constant, Name = kLabelShow, Type = String, Dynamic = True, Default = \"Show", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Anzeigen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Afficher"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Mostrar"
	#tag EndConstant

	#tag Constant, Name = kLabelSudokuStatus, Type = String, Dynamic = True, Default = \"Sudoku Status", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Sudoku Status"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Sudoku Statut"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Sudoku Estado"
	#tag EndConstant

	#tag Constant, Name = kLabelThanks, Type = String, Dynamic = True, Default = \"Would you like to say \'Thank you\'\?", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"M\xC3\xB6chten Sie \'Danke\' sagen\?"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Vous souhaitez dire \'merci\'\?"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"\xC2\xBFQuiere dar las gracias\?"
	#tag EndConstant

	#tag Constant, Name = kSudokuEmpty, Type = String, Dynamic = True, Default = \"Empty", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Leer"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Vide"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Vac\xC3\xADo"
	#tag EndConstant

	#tag Constant, Name = kSudokuLock, Type = String, Dynamic = True, Default = \"Lock", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Sperren"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Verrou"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Bloqueo"
	#tag EndConstant

	#tag Constant, Name = kSudokuRandom, Type = String, Dynamic = True, Default = \"Random", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Zufall"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Al\xC3\xA9atoire"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Aleatorio"
	#tag EndConstant

	#tag Constant, Name = kSudokuShowCandidates, Type = String, Dynamic = True, Default = \"Candidates", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Kandidaten"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Candidats"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Candidatos"
	#tag EndConstant

	#tag Constant, Name = kSudokuShowHints, Type = String, Dynamic = True, Default = \"Hints", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Hinweise"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Indices"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Pistas"
	#tag EndConstant

	#tag Constant, Name = kSudokuSolve, Type = String, Dynamic = True, Default = \"Solve", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"L\xC3\xB6sen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"R\xC3\xA9soudre"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Resolver"
	#tag EndConstant

	#tag Constant, Name = kSudokuStatusEmpty, Type = String, Dynamic = True, Default = \"Empty", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Leer"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Vide"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Vac\xC3\xADo"
	#tag EndConstant

	#tag Constant, Name = kSudokuStatusInvalid, Type = String, Dynamic = True, Default = \"Invalid", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Ung\xC3\xBCltig"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Non valide"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"No v\xC3\xA1lido"
	#tag EndConstant

	#tag Constant, Name = kSudokuStatusSolved, Type = String, Dynamic = True, Default = \"Solved", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Gel\xC3\xB6st"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"R\xC3\xA9solu"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Resuelto"
	#tag EndConstant

	#tag Constant, Name = kSudokuStatusValid, Type = String, Dynamic = True, Default = \"Valid", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"G\xC3\xBCltig"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Valide"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"V\xC3\xA1lido"
	#tag EndConstant

	#tag Constant, Name = kSudokuStatusValidNotSolvable, Type = String, Dynamic = True, Default = \"Valid (not solvable)", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"G\xC3\xBCltig (nicht l\xC3\xB6sbar)"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Valide (non soluble)"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"V\xC3\xA1lido (sin soluci\xC3\xB3n)"
	#tag EndConstant


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

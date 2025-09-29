#tag Class
Protected Class App
Inherits DesktopApplication
	#tag Event
		Sub Opening()
		  Me.AllowAutoQuit = True
		  
		End Sub
	#tag EndEvent


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileExportPDF, Type = String, Dynamic = True, Default = \"&Export PDF", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&Export PDF"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"&Exporter PDF"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"&Exportar PDF"
	#tag EndConstant

	#tag Constant, Name = kFileMenu, Type = String, Dynamic = True, Default = \"&File", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&Datei"
		#Tag Instance, Platform = Mac OS, Language = de, Definition  = \"&Ablage"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"&Fichier"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"&Archivo"
	#tag EndConstant

	#tag Constant, Name = kFilePrint, Type = String, Dynamic = True, Default = \"&Print", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&Drucken"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"&Imprimer"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"&Imprimir"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = True, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&Beenden"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"&Quitter"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"&Salir"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant

	#tag Constant, Name = kSudokuEmpty, Type = String, Dynamic = True, Default = \"&Empty", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"L&eer"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"V&ide"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"&Vac\xC3\xADo"
	#tag EndConstant

	#tag Constant, Name = kSudokuLock, Type = String, Dynamic = True, Default = \"&Lock", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&Sperren"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"&Verrou"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"&Bloqueo"
	#tag EndConstant

	#tag Constant, Name = kSudokuRandom, Type = String, Dynamic = True, Default = \"&Random", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&Zufall"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"&Al\xC3\xA9atoire"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"&Aleatorio"
	#tag EndConstant

	#tag Constant, Name = kSudokuShowHints, Type = String, Dynamic = True, Default = \"&Hints", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&Hinweise"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"&Suggestions"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"&Sugerencias"
	#tag EndConstant

	#tag Constant, Name = kSudokuSolve, Type = String, Dynamic = True, Default = \"&Solve", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&L\xC3\xB6sen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"&R\xC3\xA9soudre"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"&Resolver"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="ProcessID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoQuit"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowHiDPI"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BugVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Copyright"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastWindowIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MajorVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinorVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NonReleaseVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RegionCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StageCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Version"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_CurrentEventTime"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

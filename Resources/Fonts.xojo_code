#tag Module
Protected Module Fonts
	#tag Method, Flags = &h0, CompatibilityFlags = API2Only and ( (TargetDesktop and (Target32Bit or Target64Bit)) )
		Sub ActivateFont()
		  ActivateFont(GetFontFile)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = API2Only and ( (TargetDesktop and (Target32Bit or Target64Bit)) )
		Private Sub ActivateFont(fontFile as FolderItem)
		  If (fontFile = Nil) Then Return
		  If (Not fontFile.Exists) Then Return
		  If fontFile.IsFolder Then Return
		  
		  #If TargetWindows Then
		    Soft Declare Sub AddFontResourceExW Lib "Gdi32" (filename As WString, flags As Integer, reserved As Integer)
		    Soft Declare Sub AddFontResourceA Lib "Gdi32" (filename As CString)
		    Soft Declare Sub AddFontResourceW Lib "Gdi32" (filename As WString)
		    
		    Const FR_PRIVATE = &h10
		    
		    If System.IsFunctionAvailable( "AddFontResourceExW", "Gdi32" ) Then
		      AddFontResourceExW( fontFile.NativePath, FR_PRIVATE, 0 )
		    End If
		    
		  #ElseIf TargetLinux Then
		    If System.IsFunctionAvailable( "FcConfigGetCurrent", "libfontconfig" ) And System.IsFunctionAvailable( "FcConfigAppFontAddFile", "libfontconfig" ) Then
		      Soft Declare Function FcConfigGetCurrent Lib "libfontconfig" () As Ptr
		      Soft Declare Function FcConfigAppFontAddFile Lib "libfontconfig" (ptr2FcConfig As Ptr, ptrToFile As CString) As Boolean
		      
		      Var ptrToFcConfig As Ptr = FcConfigGetCurrent
		      
		      If (Not FcConfigAppFontAddFile(ptrToFCConfig, fontFile.NativePath)) Then
		        ' Oops, it didn't work...
		        Break ' just for Debugging purpose
		      End If
		    End If
		    
		  #ElseIf TargetMacOS Then
		    ' Fonts are being activated via Info.plist
		    
		  #EndIf
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = API2Only and ( (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) )
		Function GetFontFile() As FolderItem
		  Var folderAppFonts As FolderItem = SpecialFolder.Resources.Child("AppFonts")
		  If (folderAppFonts <> Nil) And folderAppFonts.IsFolder And folderAppFonts.Exists Then
		    Return folderAppFonts.Child(Fonts.kFontFile)
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = API2Only and ( (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) )
		Function IsFontAvailable() As Boolean
		  Select Case mFontFound
		    
		  Case 1
		    Return True
		    
		  Case 0
		    Return False
		    
		  Else
		    Var found As Boolean = False
		    
		    For i As Integer = System.FontCount - 1 DownTo 0
		      If System.FontAt(i) = kFontName Then
		        found = True
		        Exit 'Loop
		      End If
		    Next
		    
		    If found Then
		      mFontFound = 1
		    Else
		      mFontFound = 0
		    End If
		    
		    Return found
		    
		  End Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = API2Only and ( (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) )
		Function UseAppFont(Extends g As Graphics) As FolderItem
		  If (Not IsFontAvailable) Then Return Nil
		  
		  Var fontFile As FolderItem = GetFontFile
		  If (fontFile = Nil) Or fontFile.IsFolder Or (Not fontFile.Exists) Then Return Nil
		  
		  g.FontName = kFontName
		  Return fontFile
		  
		  
		End Function
	#tag EndMethod


	#tag Note, Name = CustomAppFonts
		
		
		https://github.com/jo-tools/customappfonts
	#tag EndNote


	#tag Property, Flags = &h21
		Private mFontFound As Integer = -1
	#tag EndProperty


	#tag Constant, Name = kFontFile, Type = String, Dynamic = False, Default = \"Roboto.ttf", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kFontName, Type = String, Dynamic = False, Default = \"Roboto", Scope = Private
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

#tag BuildAutomation
			Begin BuildStepList Linux
				Begin BuildProjectStep Build
				End
				Begin CopyFilesBuildStep CopyAppFontsLinux
					AppliesTo = 0
					Architecture = 0
					Target = 0
					Destination = 1
					Subdirectory = AppFonts
					FolderItem = Li4vUmVzb3VyY2VzL0ZvbnRzL1JvYm90by50dGY=
				End
				Begin IDEScriptBuildStep CreateTGZ , AppliesTo = 2, Architecture = 0, Target = 0
					'This is a MonoRepo with multiple Projects (which therefore share the Build Automation steps).
					'So make sure this script is only being run when needed:
					If (PropertyValue("App.InternalName") <> "SudokuDesktop") Then Return
					
					'**************************************************
					' Create .tgz for Linux Builds
					'**************************************************
					' https://github.com/jo-tools
					'**************************************************
					' 1. Read the comments in this PostBuild Script
					' 2. Edit the values according to your needs
					'**************************************************
					' 3. If it's working for you:
					'    Do you like it? Does it help you? Has it saved you time and money?
					'    You're welcome - it's free...
					'    If you want to say thanks I appreciate a message or a small donation.
					'    Contact: xojo@jo-tools.ch
					'    PayPal:  https://paypal.me/jotools
					'**************************************************
					
					If DebugBuild Then Return 'don't create .tgz for DebugRuns
					
					' bSILENT=True : don't show any error messages
					Var bSILENT As Boolean = True
					
					'Check Build Target
					Select Case CurrentBuildTarget
					Case 4 'Linux (Intel, 32Bit)
					Case 17 'Linux (Intel, 64Bit)
					Case 18 'Linux (ARM, 32Bit)
					Case 26 'Linux (ARM, 64Bit)
					Else
					If (Not bSILENT) Then Print "CreateTGZ: Unsupported Build Target"
					Return
					End Select
					
					'Xojo Project Settings
					Var sPROJECT_PATH As String
					Var sBUILD_LOCATION As String = CurrentBuildLocation
					Var sAPP_NAME As String = CurrentBuildAppName
					Var sCHAR_FOLDER_SEPARATOR As String
					If TargetWindows Then 'Xojo IDE is running on Windows
					sPROJECT_PATH = DoShellCommand("echo %PROJECT_PATH%", 0).Trim
					sCHAR_FOLDER_SEPARATOR = "\"
					ElseIf TargetMacOS Or TargetLinux Then 'Xojo IDE running on macOS or Linux
					sPROJECT_PATH = DoShellCommand("echo $PROJECT_PATH", 0).Trim
					If sPROJECT_PATH.Right(1) = "/" Then
					'no trailing /
					sPROJECT_PATH = sPROJECT_PATH.Left(sPROJECT_PATH.Length - 1)
					End If
					If sBUILD_LOCATION.Right(1) = "/" Then
					'no trailing /
					sBUILD_LOCATION = sBUILD_LOCATION.Left(sBUILD_LOCATION.Length - 1)
					End If
					sBUILD_LOCATION = sBUILD_LOCATION.ReplaceAll("\", "") 'don't escape Path
					sCHAR_FOLDER_SEPARATOR = "/"
					End If
					
					If (sPROJECT_PATH = "") Then
					If (Not bSILENT) Then Print "CreateTGZ: Could not get the Environment Variable PROJECT_PATH from the Xojo IDE." + EndOfLine + EndOfLine + "Unfortunately, it's empty.... try again after re-launching the Xojo IDE and/or rebooting your machine."
					Return
					End If
					
					'Check Stage Code for TGZ Filename
					Var sSTAGECODE_SUFFIX As String
					Select Case PropertyValue("App.StageCode")
					Case "0" 'Development
					sSTAGECODE_SUFFIX = "-dev"
					Case "1" 'Alpha
					sSTAGECODE_SUFFIX = "-alpha"
					Case "2" 'Beta
					sSTAGECODE_SUFFIX = "-beta"
					Case "3" 'Final
					'not used in filename
					End Select
					
					'Build TGZ Filename
					Var sTGZ_FILENAME As String
					Select Case CurrentBuildTarget
					Case 4 'Linux (Intel, 32Bit)
					sTGZ_FILENAME = sAPP_NAME.ReplaceAll(" ", "_") + sSTAGECODE_SUFFIX + "_Linux_Intel_32Bit.tgz"
					Case 17 'Linux (Intel, 64Bit)
					sTGZ_FILENAME = sAPP_NAME.ReplaceAll(" ", "_") + sSTAGECODE_SUFFIX + "_Linux_Intel_64Bit.tgz"
					Case 18 'Linux (ARM, 32Bit)
					sTGZ_FILENAME = sAPP_NAME.ReplaceAll(" ", "_") + sSTAGECODE_SUFFIX + "_Linux_ARM_32Bit.tgz"
					Case 26 'Linux (ARM, 64Bit)
					sTGZ_FILENAME = sAPP_NAME.ReplaceAll(" ", "_") + sSTAGECODE_SUFFIX + "_Linux_ARM_64Bit.tgz"
					Else
					Return
					End Select
					
					'Create .tgz
					Var sPATH_PARTS() As String = sBUILD_LOCATION.Split(sCHAR_FOLDER_SEPARATOR)
					Var sAPP_FOLDERNAME As String = sPATH_PARTS(sPATH_PARTS.LastIndex)
					If TargetWindows Then sAPP_FOLDERNAME = sAPP_NAME 'on Windows, BuildLocation is short shell path (e.g. APPNAM~1)
					sPATH_PARTS.RemoveAt(sPATH_PARTS.LastIndex)
					Var sFOLDER_BASE As String = String.FromArray(sPATH_PARTS, sCHAR_FOLDER_SEPARATOR)
					
					Var sTGZ_PARAMS_MACOS As String = If(TargetMacOS, "--no-mac-metadata --no-xattrs", "")
					Var sTGZ_COMMAND As String = "cd """ + sFOLDER_BASE + """ && tar -c -z -v " + sTGZ_PARAMS_MACOS + " -f "".." + sCHAR_FOLDER_SEPARATOR + sTGZ_FILENAME + """ ""." + sCHAR_FOLDER_SEPARATOR + sAPP_FOLDERNAME + """"
					
					Var iTGZ_RESULT As Integer
					Var sTGZ_OUTPUT As String = DoShellCommand(sTGZ_COMMAND, 0, iTGZ_RESULT)
					If (iTGZ_RESULT <> 0) Then
					If (Not bSILENT) Then Print "CreateTGZ Error" + EndOfLine + EndOfLine + _
					sTGZ_OUTPUT.Trim + EndOfLine + _
					"[ExitCode: " + iTGZ_RESULT.ToString + "]"
					End If
					
				End
				Begin IDEScriptBuildStep WebBuildDockerImage , AppliesTo = 2, Architecture = 0, Target = 0
					'This is a MonoRepo with multiple Projects (which therefore share the Build Automation steps).
					'So make sure this script is only being run when needed:
					If (PropertyValue("App.InternalName") <> "SudokuWeb") Then Return
					
					'*************************************************************
					'Xojo Web App 2 Docker - How to use with your Xojo-built .app?
					'*************************************************************
					'1. copy the folder 'Scripts' to your project folder.
					'2. Edit the file 'Dockerfile' in your favourite Text Editor.
					'   1. Look for the last line: CMD /app/CRCCalculatorWeb
					'      Make sure the App Name is the same as in your Xojo
					'      project in Build Settings -> Linux
					'   2. Look for the line: EXPOSE 80
					'      Make sure the App Name is the same as in your Xojo
					'      project in Build Settings -> Shared: Build (Port)
					'3. Create a PostBuild Copy File Step 'CopyDockerfile'
					'   Copy the file 'resources/Dockerfile' to 'App Parent Folder'
					'4. create a PostBuild Script, place it after the
					'   build step and copy-and-paste this one.
					'5. Add/Modify the Constant App.constDockerTag to fit your
					'   Company/App
					'6. Read the Comments in the PostBuild Script,
					'   modify according to your needs.
					'**************************************************
					
					'**************************************************
					'Setup Xojo Web App 2 Docker - Post Build Script
					'**************************************************
					'1. Read the comments in this PostBuild Script
					'2. Edit the values according to your needs
					'**************************************************
					'3. If it's working for you: Do you like it? Does it help you? Has it saved you time and money?
					'   You're welcome - it's free...
					'   If you want to say thanks I appreciate a message or a small donation.
					'   Contact: xojo@jo-tools.ch
					'   PayPal:  https://paypal.me/jotools
					'**************************************************
					
					
					'**************************************************
					'Requires Docker Installation
					'**************************************************
					'Download, install and run Docker.app:
					'https://docs.docker.com/docker-for-mac/install/
					'**************************************************
					'Note: Error creating MultiArch Images
					'https://github.com/docker/for-win/issues/14011
					'Try re-setting qemu. Execute this in Terminal:
					'docker run --rm --privileged multiarch/qemu-user-Static --reset -p yes -c yes
					'This should effectively pull multiarch/qemu-user-Static, re-setup qemu-user-Static With :latest
					'to be properly installed and configured
					'**************************************************
					
					'Configuration
					'-------------
					'Docker Tag: will be used from App.constDockerTag
					'Docker Push (to Docker Hub):
					Var bDockerPushEnabled As Boolean = False
					Select Case PropertyValue("App.StageCode")
					Case "0" 'Development
					bDockerPushEnabled = False
					Case "1" 'Alpha
					bDockerPushEnabled = False
					Case "2" 'Beta
					bDockerPushEnabled = False
					Case "3" 'Final
					bDockerPushEnabled = True
					End Select
					
					
					'*******************************************
					'Xojo Web App 2 Docker  - Let's go...
					'*******************************************
					'you shouldn't need to modify anything below
					'(but feel free to do so :-)
					'*******************************************
					If (Not TargetMacOS) Then
					Print "The Post Build Script 'Xojo Web App 2 Docker' can only be run on macOS. You need to modify the Shell Commands if you're building on Linux or Windows."
					Return
					End If
					
					
					'Check Build Target
					Var sDOCKER_ARCH As String
					Var sDOCKER_BUILD_MULTIARCH_IMAGE As String = "amd64-arm64v8"
					Select Case CurrentBuildTarget
					Case 17
					'Linux (Intel, 64Bit)
					sDOCKER_ARCH = "amd64"
					Case 26
					'Linux (ARM, 64Bit)
					sDOCKER_ARCH = "arm64v8"
					Else
					Print "The only supported Build Targets for the example 'Dockerfile' are: Linux Intel 64Bit, Linux ARM 64Bit"
					Return
					End Select
					
					'Check Build
					If DebugBuild Then
					Print "The Post Build Script 'Xojo Web App 2 Docker' should not be run for Debug Run's."
					Return
					End If
					
					'Xojo Project Settings
					Var sPROJECT_PATH As String = DoShellCommand("echo $PROJECT_PATH", 0).Trim
					If sPROJECT_PATH.Right(1) = "/" Then
					'no trailing /
					sPROJECT_PATH = sPROJECT_PATH.Left(sPROJECT_PATH.Length)
					End If
					Var sBUILD_LOCATION As String = CurrentBuildLocation.ReplaceAll("\", "") 'don't escape Path
					Var sBUILD_APPNAME As String = CurrentBuildAppName
					
					If (sPROJECT_PATH = "") Then
					Print "Xojo Web App 2 Docker requires to get the Environment Variable $PROJECT_PATH from the Xojo IDE." + EndOfLine + EndOfLine + "Unfortunately, it's empty.... try again after re-launching the Xojo IDE and/or rebooting your machine."
					Return
					End If
					
					'App Version -> used for Docker Image Tag
					Var sAPP_VERSION As String = PropertyValue("App.MajorVersion") + "." + PropertyValue("App.MinorVersion") + "." + PropertyValue("App.BugVersion")
					Select Case PropertyValue("App.StageCode")
					Case "0"
					sAPP_VERSION = sAPP_VERSION + "-dev"
					Case "1"
					sAPP_VERSION = sAPP_VERSION + "-alpha"
					Case "2"
					sAPP_VERSION = sAPP_VERSION + "-beta"
					End Select
					
					'DockerTag
					Var sDOCKER_TAG As String = ConstantValue("App.constDockerTag")
					If (sDOCKER_TAG = "") Then
					Print "Xojo Web App 2 Docker requires the Constant: App.constDockerTag."
					Return
					End If
					sDOCKER_TAG = sDOCKER_TAG + ":" + sAPP_VERSION
					
					'Add DockerFile
					Call DoShellCommand("cp """ + sPROJECT_PATH + "/Scripts/Dockerfile"" """ + sBUILD_LOCATION + "/Dockerfile""", 0)
					
					
					'The Contents of Array will later be passed to
					'the ShellScript 'xojo2docker.sh', which does all the processing
					'
					'The order is important, so don't change anything here without
					'changing the ShellScript, too.
					Var sShellArguments() As String
					
					'Parameters required to create the Docker Image
					sShellArguments.Add(sPROJECT_PATH)
					sShellArguments.Add(sBUILD_LOCATION)
					sShellArguments.Add(sBUILD_APPNAME)
					sShellArguments.Add(sDOCKER_TAG)
					sShellArguments.Add(sDOCKER_ARCH)
					sShellArguments.Add(sDOCKER_BUILD_MULTIARCH_IMAGE)
					sShellArguments.Add(If(bDockerPushEnabled, "yes", "no"))
					
					'Make sure the ShellScript is executable:
					Call DoShellCommand("chmod 755 """ + sPROJECT_PATH + "/Scripts/xojo2docker.sh""", 0)
					
					If (Not DebugBuild) Then
					'Automate Terminal:
					'Pass ShellArguments to Script and execute it in Terminal.app
					Call DoShellCommand("osascript -e 'tell application ""Terminal"" to activate'", 0)
					Call DoShellCommand("osascript -e 'tell application ""Terminal"" to do script ""\""" + sPROJECT_PATH + "/Scripts/xojo2docker.sh\"" \""" + Join(sShellArguments, "\"" \""") + "\""""'", 0)
					Return 'see progress and errors in Terminal.app
					End If
					
				End
			End
			Begin BuildStepList Mac OS X
				Begin IDEScriptBuildStep EnsureBundleIdentifier , AppliesTo = 0, Architecture = 0, Target = 0
					'This is a MonoRepo with multiple Projects (which therefore share the Build Automation steps).
					'So make sure this script is only being run when needed:
					If (PropertyValue("App.InternalName") <> "SudokuDesktop") Then Return
					
					If (PropertyValue("App.Application Identifier") <> ConstantValue("App.kBundleIdentifier")) Then
					PropertyValue("App.Application Identifier") = ConstantValue("App.kBundleIdentifier")
					End If
				End
				Begin BuildProjectStep Build
				End
				Begin CopyFilesBuildStep CopyAppFontsMacOs
					AppliesTo = 0
					Architecture = 0
					Target = 0
					Destination = 1
					Subdirectory = AppFonts
					FolderItem = Li4vUmVzb3VyY2VzL0ZvbnRzL1JvYm90by50dGY=
				End
				Begin CopyFilesBuildStep AssetsCar
					AppliesTo = 0
					Architecture = 0
					Target = 0
					Destination = 1
					Subdirectory = 
					FolderItem = Li4vUmVzb3VyY2VzL0Fzc2V0cy5jYXI=
					FolderItem = Li4vUmVzb3VyY2VzL0FwcC5pY25z
					FolderItem = Li4vUmVzb3VyY2VzL1N1ZG9rdS5pY25z
				End
				Begin SignProjectStep Sign
				  DeveloperID=
				  macOSEntitlements={"App Sandbox":"False","Hardened Runtime":"False","Notarize":"False","UserEntitlements":""}
				End
				Begin IDEScriptBuildStep Xojo2DMG , AppliesTo = 0, Architecture = 0, Target = 0
					'This is a MonoRepo with multiple Projects (which therefore share the Build Automation steps).
					'So make sure this script is only being run when needed:
					If (PropertyValue("App.InternalName") <> "SudokuDesktop") Then Return
					
					'**************************************************
					' Create .dmg | Notarization
					'**************************************************
					' https://github.com/jo-tools/xojo2dmg
					'**************************************************
					' This Post Build Script only runs on a local
					' setup of Xojo2DMG.
					' Have a look at the GitHub Repository to read
					' more about Xojo2DMG.
					'**************************************************
					
					
					If (Not TargetMacOS) Then Return 'Xojo IDE must be running on macOS
					
					'Check Xojo's Build Target
					Select Case CurrentBuildTarget
					Case 16 'macOS: Intel 64Bit
					Case 24 'macOS: ARM 64Bit
					Case 9 'macOS: Universal (Intel 64Bit, ARM 64Bit)
					Else
					Return
					End Select
					
					' Check if a custom local Build Script is available
					Var sCOMPANYNAME As String = PropertyValue("App.CompanyName")
					If (sCOMPANYNAME = "") Then Return
					
					Var sXOJO2DMG As String = DoShellCommand("[ -f ~/.xojo2dmg/" + sCOMPANYNAME + ".sh ] && echo ~/.xojo2dmg/" + sCOMPANYNAME + ".sh").Trim
					If (sXOJO2DMG = "") Then Return 'local company setup of Xojo2DMG not found
					
					'**************************************************
					' Setup Xojo2DMG
					'**************************************************
					Var sPROJECT_PATH As String = DoShellCommand("echo $PROJECT_PATH", 0).Trim
					If sPROJECT_PATH.Right(1) = "/" Then
					'No trailing /
					sPROJECT_PATH = sPROJECT_PATH.Left(sPROJECT_PATH.Length - 1)
					End If
					If (sPROJECT_PATH = "") Then Return
					
					Var sBUILD_LOCATION As String = CurrentBuildLocation.ReplaceAll("\", "") 'don't escape Path
					If sBUILD_LOCATION.Right(1) = "/" Then
					'No trailing /
					sBUILD_LOCATION = sBUILD_LOCATION.Left(sBUILD_LOCATION.Length - 1)
					End If
					
					'Sanity Check: Unsupported XojoVersion when building Universal (Intel 64Bit, ARM 64Bit)
					If ((CurrentBuildTarget = 24) And (sBUILD_LOCATION.Right(18) = "/_macOS ARM 64 bit")) _
					Or _
					((CurrentBuildTarget = 16) And (sBUILD_LOCATION.Right(14) = "/_macOS 64 bit")) Then
					Return
					End If
					
					Var sBUILD_APPNAME As String = CurrentBuildAppName 'Xojo 2022r1 adds .app
					If (sBUILD_APPNAME.Right(4) = ".app") Then sBUILD_APPNAME = sBUILD_APPNAME.Left(sBUILD_APPNAME.Length-4)
					
					Var sBUILD_APP_VERSION As String = PropertyValue("App.Version")
					If (sBUILD_APP_VERSION = "") Then
					sBUILD_APP_VERSION = PropertyValue("App.MajorVersion") + "." + PropertyValue("App.MinorVersion") + "." + PropertyValue("App.BugVersion")
					End If
					
					Var BUILD_APP_STAGECODE As String = ""
					Select Case PropertyValue("App.StageCode")
					Case "0"
					BUILD_APP_STAGECODE = "Dev"
					Case "1"
					BUILD_APP_STAGECODE = "Alpha"
					Case "2"
					BUILD_APP_STAGECODE = "Beta"
					Case "3"
					BUILD_APP_STAGECODE = "Final"
					End Select
					
					Var sBUILD_TYPE As String = "release"
					If DebugBuild Then sBUILD_TYPE = "debug"
					
					Var sBUILD_TARGET As String = "macOS"
					Select Case CurrentBuildTarget
					Case 16 'macOS: Intel 64Bit
					sBUILD_TARGET = "macOS_Intel_64Bit"
					Case 24 'macOS: ARM 64Bit
					sBUILD_TARGET = "macOS_ARM_64Bit"
					Case 9 'macOS: Universal (Intel 64Bit, ARM 64Bit)
					sBUILD_TARGET = "macOS_Universal"
					End Select
					
					
					'**************************************************
					' Launch Xojo2DMG
					'**************************************************
					Var sShellArguments() As String
					sShellArguments.Add(sPROJECT_PATH)
					sShellArguments.Add(sBUILD_LOCATION)
					sShellArguments.Add(sBUILD_APPNAME)
					sShellArguments.Add(sBUILD_APP_VERSION)
					sShellArguments.Add(BUILD_APP_STAGECODE)
					sShellArguments.Add(sBUILD_TYPE)
					sShellArguments.Add(sBUILD_TARGET)
					
					If (Not DebugBuild) Then
					'Launch Xojo2DMG in Terminal
					Call DoShellCommand("osascript -e 'tell application ""Terminal"" to activate'", 0)
					Call DoShellCommand("osascript -e 'tell application ""Terminal"" to do script ""\""" + sXOJO2DMG + "\"" \""" + String.FromArray(sShellArguments, "\"" \""") + "\""""'", 0)
					Return 'see progress and errors in Terminal.app
					End If
					
					Var iShellResult As Integer
					Var sShellResult As String = DoShellCommand("""" + sXOJO2DMG +  """ """ + String.FromArray(sShellArguments, """ """) + """", 0, iShellResult)
					
					'Process and Parse the Output of the ShellScript
					Var sXojo2DMG_Errors() As String
					Var sShellResultLines() As String = sShellResult.ReplaceAll(EndOfLine, "*****").Split("*****")
					For i As Integer = 0 To sShellResultLines.LastIndex
					'get all lines with Xojo2DMG Errors (and not the full output)
					If (sShellResultLines(i).Left(15) = "Xojo2DMG ERROR:") Then
					sXojo2DMG_Errors.Add(sShellResultLines(i))
					End If
					Next
					
					
					Select Case iShellResult
					Case 0
					'Yeah... it's all OK!
					Case 2
					'DebugRun without Codesigning: xojo2dmg.sh will return with 'exit 2'
					'Don't show errors - it's all OK
					Return
					Else
					'Hmm... something went wrong...
					sXojo2DMG_Errors.Add("Xojo2DMG quit with ShellResult: " + iShellResult.ToString)
					End Select
					
					'If there are errors:
					If (sXojo2DMG_Errors.LastIndex >= 0) Then
					'Print just the Errors, and have the full output in Clipboard
					Print String.FromArray(sXojo2DMG_Errors, EndOfLine) + EndOfLine + _
					"Note: Shell Output is in Clipboard"
					Clipboard = sShellResult
					End If
					
					Return
					
				End
			End
			Begin BuildStepList Windows
				Begin BuildProjectStep Build
				End
				Begin CopyFilesBuildStep CopyAppFontsWindows
					AppliesTo = 0
					Architecture = 0
					Target = 0
					Destination = 1
					Subdirectory = AppFonts
					FolderItem = Li4vUmVzb3VyY2VzL0ZvbnRzL1JvYm90by50dGY=
				End
				Begin CopyFilesBuildStep CopyIcoFiles
					AppliesTo = 0
					Architecture = 0
					Target = 0
					Destination = 1
					Subdirectory = 
					FolderItem = Li4vUmVzb3VyY2VzL0FwcEljb24uaWNv
					FolderItem = Li4vUmVzb3VyY2VzL0RvY3VtZW50SWNvbi5pY28=
				End
				Begin IDEScriptBuildStep CodeSign , AppliesTo = 2, Architecture = 0, Target = 0
					'This is a MonoRepo with multiple Projects (which therefore share the Build Automation steps).
					'So make sure this script is only being run when needed:
					If (PropertyValue("App.InternalName") <> "SudokuDesktop") Then Return
					
					'*********************************************************************************************
					' CodeSign | Azure Trusted Signing | PFX | Docker
					'*********************************************************************************************
					' https://github.com/jo-tools/ats-codesign-innosetup
					'*********************************************************************************************
					' Requirements
					'*********************************************************************************************
					' 1.  Set up Codesigning with one of the following
					' 1.1 Azure Trusted Signing
					'     Requires acs.json and azure.json in ~/.ats-codesign
					'     Strongly recommends ats-codesign-credential.sh in ~/.ats-codesign
					' 1.2 CodeSign Certificate .pfx
					'     Requires pfx.json and certificate.pfx in ~/.pfx-codesign
					'     Strongly recommends pfx-codesign-credential.sh in ~/.pfx-codesign
					' 2.  Have Docker up and running
					' 3.  Read the comments in this Post Build Script
					' 4.  Modify it according to your needs
					'
					'     Especially look out for sDOCKER_EXE
					'     You might need to set the full path to the executable
					'*********************************************************************************************
					' 5.  If it's working for you:
					'     Do you like it? Does it help you? Has it saved you time and money?
					'     You're welcome - it's free...
					'     If you want to say thanks I appreciate a message or a small donation.
					'     Contact: xojo@jo-tools.ch
					'     PayPal:  https://paypal.me/jotools
					'*********************************************************************************************
					
					If DebugBuild Then Return 'don't CodeSign DebugRun's
					
					'bSILENT=True : don't show any messages until checking configuration
					'               once .json required files are found: expect Docker and codesign to work
					'               use this e.g. in Open Source projects so that your builds will be codesigned,
					'               but if others are building the project it won't show messages to them
					Var bSILENT As Boolean = True
					
					'Check Build Target
					Select Case CurrentBuildTarget
					Case 3  'Windows (Intel, 32Bit)
					Case 19 'Windows (Intel, 64Bit)
					Case 25 'Windows(ARM, 64Bit)
					Else
					If (Not bSILENT) Then Print "Codesign: Unsupported Build Target"
					Return
					End Select
					
					'Don't CodeSign Development and Alpha Builds
					Select Case PropertyValue("App.StageCode")
					Case "0" 'Development
					If (Not bSILENT) Then Print "Codesign: Not enabled for Development Builds"
					Return
					Case "1" 'Alpha
					If (Not bSILENT) Then Print "Codesign: Not enabled for Alpha Builds"
					Return
					Case "2" 'Beta
					Case "3" 'Final
					End Select
					
					'Configure what to be CodeSigned
					Var sSIGN_FILES() As String
					
					Select Case PropertyValue("App.StageCode")
					Case "3" 'Final
					' sign all .exe's and all .dll's
					sSIGN_FILES.Add("""./**/*.exe""") 'recursively all .exe's
					sSIGN_FILES.Add("""./**/*.dll""") 'recursively all .dll's
					Else
					' only sign all .exe's for Beta/Alpha/Development builds
					sSIGN_FILES.Add("""./**/*.exe""") 'recursively all .exe's
					End Select
					
					'Note: In your project use jotools/codesign if you are not using the InnoSetup Build Step.
					'      It's a smaller Docker Image...
					'      Should your project use the Post Build Script 'InnoSetup' too, then change here to use jotools/innosetup.
					'      InnoSetup includes codesign, too. So you don't need having two different Docker Images taking up space on your machine.
					Var sDOCKER_IMAGE As String = "jotools/codesign" 'or: "jotools/innosetup"
					
					Var sFILE_ACS_JSON As String = "" 'will be searched in ~/.ats-codesign
					Var sFILE_AZURE_JSON As String = "" 'will be searched in ~/.ats-codesign
					Var sFILE_PFX_JSON As String = "" 'will be searched in ~/.pfx-codesign
					Var sFILE_PFX_CERTIFICATE As String = "" 'will be searched in ~/.pfx-codesign
					Var sBUILD_LOCATION As String = CurrentBuildLocation
					
					'Check Environment
					Var sDOCKER_EXE As String = "docker"
					If TargetWindows Then 'Xojo IDE is running on Windows
					sFILE_ACS_JSON = DoShellCommand("if exist %USERPROFILE%\.ats-codesign\acs.json echo %USERPROFILE%\.ats-codesign\acs.json").Trim
					sFILE_AZURE_JSON = DoShellCommand("if exist %USERPROFILE%\.ats-codesign\azure.json echo %USERPROFILE%\.ats-codesign\azure.json").Trim
					sFILE_PFX_JSON = DoShellCommand("if exist %USERPROFILE%\.pfx-codesign\pfx.json echo %USERPROFILE%\.pfx-codesign\pfx.json").Trim
					sFILE_PFX_CERTIFICATE = DoShellCommand("if exist %USERPROFILE%\.pfx-codesign\certificate.pfx echo %USERPROFILE%\.pfx-codesign\certificate.pfx").Trim
					ElseIf TargetMacOS Or TargetLinux Then 'Xojo IDE running on macOS or Linux
					sDOCKER_EXE = DoShellCommand("[ -f /usr/local/bin/docker ] && echo /usr/local/bin/docker").Trim
					If (sDOCKER_EXE = "") Then sDOCKER_EXE = DoShellCommand("[ -f /snap/bin/docker ] && echo /snap/bin/docker").Trim
					sFILE_ACS_JSON = DoShellCommand("[ -f ~/.ats-codesign/acs.json ] && echo ~/.ats-codesign/acs.json").Trim
					sFILE_AZURE_JSON = DoShellCommand("[ -f ~/.ats-codesign/azure.json ] && echo ~/.ats-codesign/azure.json").Trim
					sBUILD_LOCATION = sBUILD_LOCATION.ReplaceAll("\", "") 'don't escape Path
					sFILE_PFX_JSON = DoShellCommand("[ -f ~/.pfx-codesign/pfx.json ] && echo ~/.pfx-codesign/pfx.json").Trim
					sFILE_PFX_CERTIFICATE = DoShellCommand("[ -f ~/.pfx-codesign/certificate.pfx ] && echo ~/.pfx-codesign/certificate.pfx").Trim
					Else
					If (Not bSILENT) Then Print "Codesign: Xojo IDE running on unknown Target"
					Return
					End If
					
					Var bCODESIGN_ATS As Boolean = (sFILE_ACS_JSON <> "") And (sFILE_AZURE_JSON <> "")
					Var bCODESIGN_PFX As Boolean = (sFILE_PFX_JSON <> "") And (sFILE_PFX_CERTIFICATE <> "")
					
					If (Not bCODESIGN_ATS) And (Not bCODESIGN_PFX) Then
					If (Not bSILENT) Then
					Print "Codesign:" + EndOfLine + _
					"acs.json and azure.json not found in [UserHome]-[.ats-codesign]-[acs|azure.json]" + EndOfLine + _
					"pfx.json and certificate.pfx not found in [UserHome]-[.pfx-codesign]-[pfx.json|certificate.pfx]"
					End If
					Return
					End If
					
					'Check Docker
					Var iCHECK_DOCKER_RESULT As Integer
					Var sCHECK_DOCKER_EXE As String = DoShellCommand(sDOCKER_EXE + " --version", 0, iCHECK_DOCKER_RESULT).Trim
					If (iCHECK_DOCKER_RESULT <> 0) Or (Not sCHECK_DOCKER_EXE.Contains("Docker")) Or (Not sCHECK_DOCKER_EXE.Contains("version")) Or (Not sCHECK_DOCKER_EXE.Contains("build "))Then
					Print "Codesign: Docker not available"
					Return
					End If
					
					Var sCHECK_DOCKER_PROCESS As String = DoShellCommand(sDOCKER_EXE + " ps", 0, iCHECK_DOCKER_RESULT).Trim
					If (iCHECK_DOCKER_RESULT <> 0) Then
					Print "Codesign: Docker not running"
					Return
					End If
					
					'Get Credential from Secure Storage
					Var bENV_ATS_CREDENTIAL As Boolean
					Var bENV_PFX_CREDENTIAL As Boolean
					
					If bCODESIGN_ATS Or bCODESIGN_PFX Then
					Var SFILE_CREDENTIAL As String
					Var sCREDENTIAL_COMMAND As String
					
					If TargetWindows Then 'Xojo IDE is running on Windows
					If bCODESIGN_ATS Then
					SFILE_CREDENTIAL = DoShellCommand("if exist %USERPROFILE%\.ats-codesign\ats-codesign-credential.ps1 echo %USERPROFILE%\.ats-codesign\ats-codesign-credential.ps1").Trim
					ElseIf bCODESIGN_PFX Then
					SFILE_CREDENTIAL = DoShellCommand("if exist %USERPROFILE%\.pfx-codesign\pfx-codesign-credential.ps1 echo %USERPROFILE%\.pfx-codesign\pfx-codesign-credential.ps1").Trim
					End If
					If (SFILE_CREDENTIAL <> "") Then
					sCREDENTIAL_COMMAND = "powershell """ + SFILE_CREDENTIAL + """"
					End If
					ElseIf TargetMacOS Or TargetLinux Then 'Xojo IDE running on macOS or Linux
					If bCODESIGN_ATS Then
					SFILE_CREDENTIAL = DoShellCommand("[ -f ~/.ats-codesign/ats-codesign-credential.sh ] && echo ~/.ats-codesign/ats-codesign-credential.sh").Trim
					ElseIf bCODESIGN_PFX Then
					SFILE_CREDENTIAL = DoShellCommand("[ -f ~/.pfx-codesign/pfx-codesign-credential.sh ] && echo ~/.pfx-codesign/pfx-codesign-credential.sh").Trim
					End If
					If (SFILE_CREDENTIAL <> "") Then
					Call DoShellCommand("chmod 755 """ + SFILE_CREDENTIAL + """") 'just to make sure it's executable
					sCREDENTIAL_COMMAND = SFILE_CREDENTIAL
					End If
					End If
					
					If (sCREDENTIAL_COMMAND <> "") Then
					'Once the Credential Helper Script is in place, we expect to get a value from it
					Var iCREDENTIAL_RESULT As Integer
					Var sCREDENTIAL As String = DoShellCommand(sCREDENTIAL_COMMAND, 0, iCREDENTIAL_RESULT).Trim
					If (iCREDENTIAL_RESULT <> 0) Or (sCREDENTIAL = "") Then
					Print  "Codesign: Could not retrieve " + If(bCODESIGN_ATS, "ATS", "PFX") + " Credential"
					Return
					End If
					
					'Use Environment Variable
					If bCODESIGN_ATS Then
					EnvironmentVariable("AZURE_CLIENT_SECRET") = sCREDENTIAL
					bENV_ATS_CREDENTIAL = True
					ElseIf bCODESIGN_PFX Then
					EnvironmentVariable("PFX_PASSWORD") = sCREDENTIAL
					bENV_PFX_CREDENTIAL = True
					End If
					End If
					End If
					
					'CodeSign in Docker Container
					Var sSIGN_COMMAND As String
					Var sSIGN_ENTRYPOINT As String
					If bCODESIGN_ATS Then
					'CodeSign using Azure Trusted Signing
					sSIGN_ENTRYPOINT = "ats-codesign.sh"
					sSIGN_COMMAND = _
					sDOCKER_EXE + " run " + _
					"--rm " + _
					"-v """ + sFILE_ACS_JSON + """:/etc/ats-codesign/acs.json " + _
					"-v """ + sFILE_AZURE_JSON + """:/etc/ats-codesign/azure.json " + _
					If(bENV_ATS_CREDENTIAL, "-e AZURE_CLIENT_SECRET ", "") + _
					"-v """ + sBUILD_LOCATION + """:/data " + _
					"-w /data " + _
					"--entrypoint " + sSIGN_ENTRYPOINT + " " + _
					sDOCKER_IMAGE + " " + _
					String.FromArray(sSIGN_FILES, " ")
					ElseIf bCODESIGN_PFX Then
					'CodeSign using .pfx
					sSIGN_ENTRYPOINT = "pfx-codesign.sh"
					sSIGN_COMMAND = _
					sDOCKER_EXE + " run " + _
					"--rm " + _
					"-v """ + sFILE_PFX_JSON + """:/etc/pfx-codesign/pfx.json " + _
					"-v """ + sFILE_PFX_CERTIFICATE + """:/etc/pfx-codesign/certificate.pfx " + _
					If(bENV_PFX_CREDENTIAL, "-e PFX_PASSWORD ", "") + _
					"-v """ + sBUILD_LOCATION + """:/data " + _
					"-w /data " + _
					"--entrypoint " + sSIGN_ENTRYPOINT + " " + _
					sDOCKER_IMAGE + " " + _
					String.FromArray(sSIGN_FILES, " ")
					End If
					
					Var iSIGN_RESULT As Integer
					Var sSIGN_OUTPUT As String = DoShellCommand(sSIGN_COMMAND, 0, iSIGN_RESULT)
					
					If (iSIGN_RESULT <> 0) Then
					Clipboard = sSIGN_OUTPUT
					Print "Codesign: " + sSIGN_ENTRYPOINT + " Error" + EndOfLine + _
					"[ExitCode: " + iSIGN_RESULT.ToString + "]" + EndOfLine + EndOfLine + _
					"Note: Shell Output is available in Clipboard."
					
					If (iSIGN_RESULT <> 125) Then
					Var iCHECK_DOCKERIMAGE_RESULT As Integer
					Var sCHECK_DOCKERIMAGE_OUTPUT As String = DoShellCommand(sDOCKER_EXE + " image inspect " + sDOCKER_IMAGE, 0, iCHECK_DOCKERIMAGE_RESULT)
					If (iCHECK_DOCKERIMAGE_RESULT <> 0) Then
					Print "Codesign: Docker Image '" + sDOCKER_IMAGE + "' not available"
					End If
					End If
					End If
					
				End
				Begin IDEScriptBuildStep CreateZIP , AppliesTo = 2, Architecture = 0, Target = 0
					'This is a MonoRepo with multiple Projects (which therefore share the Build Automation steps).
					'So make sure this script is only being run when needed:
					If (PropertyValue("App.InternalName") <> "SudokuDesktop") Then Return
					
					'**************************************************
					' Create .zip for Windows Builds
					'**************************************************
					' https://github.com/jo-tools
					'**************************************************
					' 1. Read the comments in this PostBuild Script
					' 2. Edit the values according to your needs
					'**************************************************
					' 3. If it's working for you:
					'    Do you like it? Does it help you? Has it saved you time and money?
					'    You're welcome - it's free...
					'    If you want to say thanks I appreciate a message or a small donation.
					'    Contact: xojo@jo-tools.ch
					'    PayPal:  https://paypal.me/jotools
					'**************************************************
					
					If DebugBuild Then Return 'don't create .zip for DebugRuns
					
					'bSILENT=True : don't show any error messages
					Var bSILENT As Boolean = True
					
					'Check Build Target
					Select Case CurrentBuildTarget
					Case 3 'Windows (Intel, 32Bit)
					Case 19 'Windows (Intel, 64Bit)
					Case 25 'Windows(ARM, 64Bit)
					Else
					If (Not bSILENT) Then Print "CreateZIP: Unsupported Build Target"
					Return
					End Select
					
					'Xojo Project Settings
					Var sPROJECT_PATH As String
					Var sBUILD_LOCATION As String = CurrentBuildLocation
					Var sAPP_NAME As String = CurrentBuildAppName
					If (sAPP_NAME.Right(4) = ".exe") Then
					sAPP_NAME = sAPP_NAME.Left(sAPP_NAME.Length - 4)
					End If
					Var sCHAR_FOLDER_SEPARATOR As String
					If TargetWindows Then 'Xojo IDE is running on Windows
					sPROJECT_PATH = DoShellCommand("echo %PROJECT_PATH%", 0).Trim
					sCHAR_FOLDER_SEPARATOR = "\"
					ElseIf TargetMacOS Or TargetLinux Then 'Xojo IDE running on macOS or Linux
					sPROJECT_PATH = DoShellCommand("echo $PROJECT_PATH", 0).Trim
					If sPROJECT_PATH.Right(1) = "/" Then
					'no trailing /
					sPROJECT_PATH = sPROJECT_PATH.Left(sPROJECT_PATH.Length - 1)
					End If
					If sBUILD_LOCATION.Right(1) = "/" Then
					'no trailing /
					sBUILD_LOCATION = sBUILD_LOCATION.Left(sBUILD_LOCATION.Length - 1)
					End If
					sBUILD_LOCATION = sBUILD_LOCATION.ReplaceAll("\", "") 'don't escape Path
					sCHAR_FOLDER_SEPARATOR = "/"
					End If
					
					If (sPROJECT_PATH = "") Then
					If (Not bSILENT) Then Print "CreateZIP: Could not get the Environment Variable PROJECT_PATH from the Xojo IDE." + EndOfLine + EndOfLine + "Unfortunately, it's empty.... try again after re-launching the Xojo IDE and/or rebooting your machine."
					Return
					End If
					
					'Check Stage Code for ZIP Filename
					Var sSTAGECODE_SUFFIX As String
					Select Case PropertyValue("App.StageCode")
					Case "0" 'Development
					sSTAGECODE_SUFFIX = "-dev"
					Case "1" 'Alpha
					sSTAGECODE_SUFFIX = "-alpha"
					Case "2" 'Beta
					sSTAGECODE_SUFFIX = "-beta"
					Case "3" 'Final
					'not used in filename
					End Select
					
					'Build ZIP Filename
					Var sZIP_FILENAME As String
					Select Case CurrentBuildTarget
					Case 3 'Windows (Intel, 32Bit)
					sZIP_FILENAME = sAPP_NAME.ReplaceAll(" ", "_") + sSTAGECODE_SUFFIX + "_Windows_Intel_32Bit.zip"
					Case 19 'Windows (Intel, 64Bit)
					sZIP_FILENAME = sAPP_NAME.ReplaceAll(" ", "_") + sSTAGECODE_SUFFIX + "_Windows_Intel_64Bit.zip"
					Case 25 'Windows(ARM, 64Bit)
					sZIP_FILENAME = sAPP_NAME.ReplaceAll(" ", "_") + sSTAGECODE_SUFFIX + "_Windows_ARM_64Bit.zip"
					Else
					Return
					End Select
					
					'Create .zip
					Var sPATH_PARTS() As String = sBUILD_LOCATION.Split(sCHAR_FOLDER_SEPARATOR)
					Var sAPP_FOLDERNAME As String = sPATH_PARTS(sPATH_PARTS.LastIndex)
					sPATH_PARTS.RemoveAt(sPATH_PARTS.LastIndex)
					Var sFOLDER_BASE As String = String.FromArray(sPATH_PARTS, sCHAR_FOLDER_SEPARATOR)
					
					If TargetWindows Then 'Xojo IDE is running on Windows
					Var sPOWERSHELL_COMMAND As String = "cd """ + sFOLDER_BASE + """; Compress-Archive -Path .\* -DestinationPath ""..\" + sZIP_FILENAME + """ -Force"
					Var iPOWERSHELL_RESULT As Integer
					Var sPOWERSHELL_OUTPUT As String = DoShellCommand("powershell -command """ + sPOWERSHELL_COMMAND.ReplaceAll("""", "'") + """", 0, iPOWERSHELL_RESULT)
					If (iPOWERSHELL_RESULT <> 0) Then
					If (Not bSILENT) Then Print "CreateZIP Error" + EndOfLine + EndOfLine + _
					sPOWERSHELL_OUTPUT.Trim + EndOfLine + _
					"[ExitCode: " + iPOWERSHELL_RESULT.ToString + "]"
					End If
					ElseIf TargetMacOS Or TargetLinux Then 'Xojo IDE running on macOS or Linux
					Var iZIP_RESULT As Integer
					Var sZIP_OUTPUT As String = DoShellCommand("cd """ + sFOLDER_BASE + """ && zip -r ""../" + sZIP_FILENAME + """ ""./" + sAPP_FOLDERNAME + """", 0, iZIP_RESULT)
					If (iZIP_RESULT <> 0) Then
					If (Not bSILENT) Then Print "CreateZIP Error" + EndOfLine + EndOfLine + _
					sZIP_OUTPUT.Trim + EndOfLine + _
					"[ExitCode: " + iZIP_RESULT.ToString + "]"
					End If
					End If
					
				End
				Begin IDEScriptBuildStep InnoSetup , AppliesTo = 2, Architecture = 0, Target = 0
					'This is a MonoRepo with multiple Projects (which therefore share the Build Automation steps).
					'So make sure this script is only being run when needed:
					If (PropertyValue("App.InternalName") <> "SudokuDesktop") Then Return
					
					'*********************************************************************************************
					' InnoSetup | Azure Trusted Signing | PFX | Docker
					'*********************************************************************************************
					' https://github.com/jo-tools/ats-codesign-innosetup
					'*********************************************************************************************
					' Requirements
					'*********************************************************************************************
					' 1.  Optional: Set up Codesigning with one of the following
					'     (only if you want a codesigned Installer)
					' 1.1 Azure Trusted Signing
					'     Requires acs.json and azure.json in ~/.ats-codesign
					'     Strongly recommends ats-codesign-credential.sh in ~/.ats-codesign
					' 1.2 CodeSign Certificate .pfx
					'     Requires pfx.json and certificate.pfx in ~/.pfx-codesign
					'     Strongly recommends pfx-codesign-credential.sh in ~/.pfx-codesign
					' 2.  Have Docker up and running
					' 3.  Put your own InnoSetup Script to the project location (or use the universal script
					'     provided with the example project - modify that according to your needs)
					' 4.  Read the comments in this Post Build Script
					' 5.  Modify it according to your needs
					'
					'     Especially look out for sDOCKER_EXE
					'     You might need to set the full path to the executable
					'
					'     Set bCODESIGN_ENABLED = False if you want to create a Windows Installer without
					'     CodeSigning. If this value is True, the Post Build Script will expect Codesigning to be
					'     available and print an Information Message if it's configuration is not found.
					'
					'     And at least change the sAPP_PUBLISHER_URL to your own Website if you're using
					'     the provided universal InnoSetup script
					'*********************************************************************************************
					' 6.  If it's working for you:
					'     Do you like it? Does it help you? Has it saved you time and money?
					'     You're welcome - it's free...
					'     If you want to say thanks I appreciate a message or a small donation.
					'     Contact: xojo@jo-tools.ch
					'     PayPal:  https://paypal.me/jotools
					'*********************************************************************************************
					
					'*********************************************************************************************
					' Note: Xojo IDE running on Linux
					'*********************************************************************************************
					' Make sure that docker can be run without requiring 'sudo':
					' More information e.g. in this article:
					' https://medium.com/devops-technical-notes-and-manuals/how-to-run-docker-commands-without-sudo-28019814198f
					' 1. sudo groupadd docker
					' 2. sudo gpasswd -a $USER docker
					' 3. (reboot)
					'*********************************************************************************************
					
					'*********************************************************************************************
					' Security Warning
					'*********************************************************************************************
					' This Post Build Script is intended as an example to demonstrate the functionality.
					' It allows to retrieve sensitive information (such as a Client Secret or Certificate
					' Password) from a plaintext `.json` configuration file, which is not secure.
					' However, this Post Build Script also supports retrieving credentials from a
					' Secret Storage. It's highly recommended to use that approach.
					'*********************************************************************************************
					
					
					If DebugBuild Then Return 'don't create a windows installer for DebugRun's
					
					'bCODESIGN_ENABLED: set this to False if you want to create a Windows Installer without CodeSigning
					Var bCODESIGN_ENABLED As Boolean = True 'when True this shows a Info when CodeSign Configuration is missing
					
					'bSILENT=True : don't show any messages until checking configuration
					Var bSILENT As Boolean = True
					
					'bVERYSILENT=True : don't show any messages at all - even if Docker not Available or InnoSetup errors
					'                   use this e.g. in Open Source projects so that your builds will get an installer,
					'                   but if others are building the project it won't show messages to them if that fails
					Var bVERYSILENT As Boolean = True 'in this example project we want to show if it's not going to work
					
					'Sanity Check
					If bVERYSILENT Then bSILENT = True
					
					'Set InnoSetup Script
					'Note: This project includes a universal .iss script
					'      That's why we specify the same .iss for all WIN32, WIN64 and ARM64
					'Note: Folder Separator in this variable can be both \ or /
					Var sINNOSETUP_SCRIPT As String
					Select Case CurrentBuildTarget
					Case 3 'Windows (Intel, 32Bit)
					sINNOSETUP_SCRIPT = "_build/sudoku.iss"
					Case 19 'Windows (Intel, 64Bit)
					sINNOSETUP_SCRIPT = "_build/sudoku.iss"
					Case 25 'Windows(ARM, 64Bit)
					sINNOSETUP_SCRIPT = "_build/sudoku.iss"
					Else
					If (Not bSILENT) Then Print "InnoSetup: Unsupported Build Target"
					Return
					End Select
					
					'Don't create Windows Installer for Development and Alpha Builds
					Select Case PropertyValue("App.StageCode")
					Case "0" 'Development
					If (Not bSILENT) Then Print "InnoSetup: Not enabled for Development Builds"
					Return
					Case "1" 'Alpha
					If (Not bSILENT) Then Print "InnoSetup: Not enabled for Alpha Builds"
					Return
					Case "2" 'Beta
					Case "3" 'Final
					End Select
					
					'Publisher Website
					Var sAPP_PUBLISHER_URL As String = "https://www.jo-tools.ch/"
					
					'****************************************************
					' Note: No more changes needed below here
					'****************************************************
					' This example includes a universal InnoSetup script.
					' All required information is being picked up from
					' the Xojo Project Settings.
					' Of course: feel free to change and modify it
					' according to your needs
					'****************************************************
					
					'Xojo Project Settings
					Var sBUILD_LOCATION As String = CurrentBuildLocation
					Var sAPP_EXE_BASEFILENAME As String = CurrentBuildAppName
					If (sAPP_EXE_BASEFILENAME.Right(4) = ".exe") Then
					sAPP_EXE_BASEFILENAME = sAPP_EXE_BASEFILENAME.Left(sAPP_EXE_BASEFILENAME.Length - 4)
					End If
					Var sAPP_PRODUCTNAME As String = PropertyValue("App.ProductName").Trim
					If (sAPP_PRODUCTNAME = "") Then
					If (Not bSILENT) Then
					Print "InnoSetup: App.ProductName is empty" + EndOfLine + EndOfLine + _
					"Set it in Xojo Build Settings: Windows"
					Return
					End If
					sAPP_PRODUCTNAME = sAPP_EXE_BASEFILENAME
					End If
					Var sAPP_COMPANYNAME As String = PropertyValue("App.CompanyName").Trim
					If (sAPP_COMPANYNAME = "") Then
					If (Not bSILENT) Then
					Print "InnoSetup: App.CompanyName is empty" + EndOfLine + EndOfLine + _
					"Set it in Xojo Build Settings: Windows"
					Return
					End If
					sAPP_COMPANYNAME = sAPP_EXE_BASEFILENAME
					End If
					
					'Check Stage Code for Application Version Name and Installer Filename
					Var sSTAGECODE_SUFFIX As String
					Var sAPP_PRODUCTNAME_STAGECODE_SUFFIX As String
					Select Case PropertyValue("App.StageCode")
					Case "0" 'Development
					sSTAGECODE_SUFFIX = "-dev"
					sAPP_PRODUCTNAME_STAGECODE_SUFFIX = "[Dev]"
					Case "1" 'Alpha
					sSTAGECODE_SUFFIX = "-alpha"
					sAPP_PRODUCTNAME_STAGECODE_SUFFIX = "[Alpha]"
					Case "2" 'Beta
					sSTAGECODE_SUFFIX = "-beta"
					sAPP_PRODUCTNAME_STAGECODE_SUFFIX = "[Beta]"
					Case "3" 'Final
					'not used in filename
					End Select
					
					'Build Installer Filename
					Var sSETUP_BASEFILENAME As String
					Select Case CurrentBuildTarget
					Case 3 'Windows (Intel, 32Bit)
					sSETUP_BASEFILENAME = sAPP_EXE_BASEFILENAME.ReplaceAll(" ", "_") + sSTAGECODE_SUFFIX + "_Setup_Intel_32Bit"
					Case 19 'Windows (Intel, 64Bit)
					sSETUP_BASEFILENAME = sAPP_EXE_BASEFILENAME.ReplaceAll(" ", "_") + sSTAGECODE_SUFFIX + "_Setup_Intel_64Bit"
					Case 25 'Windows(ARM, 64Bit)
					sSETUP_BASEFILENAME = sAPP_EXE_BASEFILENAME.ReplaceAll(" ", "_") + sSTAGECODE_SUFFIX + "_Setup_ARM_64Bit"
					Else
					Return
					End Select
					
					'System Requirements for built Windows application
					Var sMINVERSION As String = "6.3.9600" 'Require Windows 8.1 with Update 1
					If (XojoVersion >= 2025.0) Then
					sMINVERSION = "10.0.18362" 'Require Windows 10 Version 1903 (May 2019 Update)
					End If
					
					'Set Parameters for InnoSetup Script
					Var sISS_csProductName As String = sAPP_PRODUCTNAME
					Var sISS_csProductNameWithStageCode As String = sAPP_PRODUCTNAME + " " + sAPP_PRODUCTNAME_STAGECODE_SUFFIX
					sISS_csProductNameWithStageCode = sISS_csProductNameWithStageCode.Trim 'Trim if no Suffix
					Var sISS_csExeName As String = sAPP_EXE_BASEFILENAME + ".exe" // we removed that before
					Var sISS_csAppPublisher As String = sAPP_COMPANYNAME
					Var sISS_csAppPublisherURL As String = sAPP_PUBLISHER_URL
					Var sISS_csOutputBaseFilename As String = sSETUP_BASEFILENAME
					
					'Variables for Docker
					Var sDOCKER_IMAGE As String = "jotools/innosetup"
					Var sFILE_ACS_JSON As String = "" 'will be searched in ~/.ats-codesign
					Var sFILE_AZURE_JSON As String = "" 'will be searched in ~/.ats-codesign
					Var sFILE_PFX_JSON As String = "" 'will be searched in ~/.pfx-codesign
					Var sFILE_PFX_CERTIFICATE As String = "" 'will be searched in ~/.pfx-codesign
					Var sPROJECT_PATH As String
					
					'Check Environment
					Var sDOCKER_EXE As String = "docker"
					Var sCHAR_FOLDER_SEPARATOR As String
					
					If TargetWindows Then 'Xojo IDE is running on Windows
					sPROJECT_PATH = DoShellCommand("echo %PROJECT_PATH%", 0).Trim
					sCHAR_FOLDER_SEPARATOR = "\"
					If bCODESIGN_ENABLED Then
					sFILE_ACS_JSON = DoShellCommand("if exist %USERPROFILE%\.ats-codesign\acs.json echo %USERPROFILE%\.ats-codesign\acs.json").Trim
					sFILE_AZURE_JSON = DoShellCommand("if exist %USERPROFILE%\.ats-codesign\azure.json echo %USERPROFILE%\.ats-codesign\azure.json").Trim
					sFILE_PFX_JSON = DoShellCommand("if exist %USERPROFILE%\.pfx-codesign\pfx.json echo %USERPROFILE%\.pfx-codesign\pfx.json").Trim
					sFILE_PFX_CERTIFICATE = DoShellCommand("if exist %USERPROFILE%\.pfx-codesign\certificate.pfx echo %USERPROFILE%\.pfx-codesign\certificate.pfx").Trim
					End If
					ElseIf TargetMacOS Or TargetLinux Then 'Xojo IDE running on macOS or Linux
					sPROJECT_PATH = DoShellCommand("echo $PROJECT_PATH", 0).Trim
					If sPROJECT_PATH.Right(1) = "/" Then
					'no trailing /
					sPROJECT_PATH = sPROJECT_PATH.Left(sPROJECT_PATH.Length - 1)
					End If
					If sBUILD_LOCATION.Right(1) = "/" Then
					'no trailing /
					sBUILD_LOCATION = sBUILD_LOCATION.Left(sBUILD_LOCATION.Length - 1)
					End If
					sCHAR_FOLDER_SEPARATOR = "/"
					sBUILD_LOCATION = sBUILD_LOCATION.ReplaceAll("\", "") 'don't escape Path
					sDOCKER_EXE = DoShellCommand("[ -f /usr/local/bin/docker ] && echo /usr/local/bin/docker").Trim
					If (sDOCKER_EXE = "") Then sDOCKER_EXE = DoShellCommand("[ -f /snap/bin/docker ] && echo /snap/bin/docker").Trim
					If bCODESIGN_ENABLED Then
					sFILE_ACS_JSON = DoShellCommand("[ -f ~/.ats-codesign/acs.json ] && echo ~/.ats-codesign/acs.json").Trim
					sFILE_AZURE_JSON = DoShellCommand("[ -f ~/.ats-codesign/azure.json ] && echo ~/.ats-codesign/azure.json").Trim
					sFILE_PFX_JSON = DoShellCommand("[ -f ~/.pfx-codesign/pfx.json ] && echo ~/.pfx-codesign/pfx.json").Trim
					sFILE_PFX_CERTIFICATE = DoShellCommand("[ -f ~/.pfx-codesign/certificate.pfx ] && echo ~/.pfx-codesign/certificate.pfx").Trim
					End If
					Else
					If (Not bSILENT) Then Print "InnoSetup: Xojo IDE running on unknown Target"
					Return
					End If
					
					Var bCODESIGN_ATS As Boolean = (sFILE_ACS_JSON <> "") And (sFILE_AZURE_JSON <> "")
					Var bCODESIGN_PFX As Boolean = (sFILE_PFX_JSON <> "") And (sFILE_PFX_CERTIFICATE <> "")
					
					If (sPROJECT_PATH = "") Then
					If (Not bSILENT) Then Print "CreateZIP: Could not get the Environment Variable PROJECT_PATH from the Xojo IDE." + EndOfLine + EndOfLine + "Unfortunately, it's empty.... try again after re-launching the Xojo IDE and/or rebooting your machine."
					Return
					End If
					
					'Check InnoSetup Script
					If (sINNOSETUP_SCRIPT <> "") Then
					sINNOSETUP_SCRIPT = sINNOSETUP_SCRIPT.ReplaceAll("/", sCHAR_FOLDER_SEPARATOR).ReplaceAll("\", sCHAR_FOLDER_SEPARATOR)
					If TargetWindows Then 'Xojo IDE is running on Windows
					sINNOSETUP_SCRIPT = DoShellCommand("if exist """ + sPROJECT_PATH + sCHAR_FOLDER_SEPARATOR + sINNOSETUP_SCRIPT + """ echo " + sPROJECT_PATH + sCHAR_FOLDER_SEPARATOR + sINNOSETUP_SCRIPT).Trim
					ElseIf TargetMacOS Or TargetLinux Then 'Xojo IDE running on macOS or Linux
					sINNOSETUP_SCRIPT = DoShellCommand("[ -f """ + sPROJECT_PATH + sCHAR_FOLDER_SEPARATOR + sINNOSETUP_SCRIPT + """ ] && echo " + sPROJECT_PATH + sCHAR_FOLDER_SEPARATOR + sINNOSETUP_SCRIPT).Trim
					End If
					End If
					
					If (sINNOSETUP_SCRIPT = "") Then
					If (Not bSILENT) Then Print "InnoSetup: No InnoSetup Script"
					Return
					End If
					
					Var bCODESIGN_AVAILABLE As Boolean
					If bCODESIGN_ENABLED Then
					bCODESIGN_AVAILABLE = bCODESIGN_ATS Or bCODESIGN_PFX
					If (Not bCODESIGN_AVAILABLE) And (Not bSILENT) Then
					Print "InnoSetup:" + EndOfLine + _
					"acs.json and azure.json not found in [UserHome]-[.ats-codesign]-[acs|azure.json]" + EndOfLine + _
					"pfx.json and certificate.pfx not found in [UserHome]-[.pfx-codesign]-[pfx.json|certificate.pfx]" + EndOfLine + _
					EndOfLine + _
					"Proceeding without codesigning the windows installer"
					End If
					End If
					
					'Check Docker
					Var iCHECK_DOCKER_RESULT As Integer
					Var sCHECK_DOCKER_EXE As String = DoShellCommand(sDOCKER_EXE + " --version", 0, iCHECK_DOCKER_RESULT).Trim
					If (iCHECK_DOCKER_RESULT <> 0) Or (Not sCHECK_DOCKER_EXE.Contains("Docker")) Or (Not sCHECK_DOCKER_EXE.Contains("version")) Or (Not sCHECK_DOCKER_EXE.Contains("build "))Then
					If (Not bVERYSILENT) Then Print "InnoSetup: Docker not available"
					Return
					End If
					
					Var sCHECK_DOCKER_PROCESS As String = DoShellCommand(sDOCKER_EXE + " ps", 0, iCHECK_DOCKER_RESULT).Trim
					If (iCHECK_DOCKER_RESULT <> 0) Then
					If (Not bVERYSILENT) Then Print "InnoSetup: Docker not running"
					Return
					End If
					
					Var sPATH_PARTS() As String = sBUILD_LOCATION.Split(sCHAR_FOLDER_SEPARATOR)
					Var sAPP_FOLDERNAME As String = sPATH_PARTS(sPATH_PARTS.LastIndex)
					sPATH_PARTS.RemoveAt(sPATH_PARTS.LastIndex)
					Var sAPP_PARENT_FOLDERNAME As String = sPATH_PARTS(sPATH_PARTS.LastIndex)
					sPATH_PARTS.RemoveAt(sPATH_PARTS.LastIndex)
					Var sFOLDER_BASE As String = String.FromArray(sPATH_PARTS, sCHAR_FOLDER_SEPARATOR)
					Var sISS_RELATIVE_SOURCEPATH As String = sAPP_PARENT_FOLDERNAME + "/" + sAPP_FOLDERNAME
					
					'Run InnoSetup (and CodeSign) in Docker Container
					Var sINNOSETUP_PARAMETERS() As String
					
					Var bENV_ATS_CREDENTIAL As Boolean
					Var bENV_PFX_CREDENTIAL As Boolean
					
					'Enable Codesigning
					If bCODESIGN_AVAILABLE Then
					If (sFILE_ACS_JSON <> "") And (sFILE_AZURE_JSON <> "") Then
					sINNOSETUP_PARAMETERS.Add("""/SATS=Z:/usr/local/bin/ats-codesign.bat $f""")
					sINNOSETUP_PARAMETERS.Add("/DcsCodeSignATS")
					ElseIf (sFILE_PFX_JSON <> "") And (sFILE_PFX_CERTIFICATE <> "") Then
					sINNOSETUP_PARAMETERS.Add("""/SATS=Z:/usr/local/bin/pfx-codesign.bat $f""")
					sINNOSETUP_PARAMETERS.Add("/DcsCodeSignATS")
					End If
					
					'Get Credential from Secure Storage
					If bCODESIGN_ATS Or bCODESIGN_PFX Then
					Var SFILE_CREDENTIAL As String
					Var sCREDENTIAL_COMMAND As String
					
					If TargetWindows Then 'Xojo IDE is running on Windows
					If bCODESIGN_ATS Then
					SFILE_CREDENTIAL = DoShellCommand("if exist %USERPROFILE%\.ats-codesign\ats-codesign-credential.ps1 echo %USERPROFILE%\.ats-codesign\ats-codesign-credential.ps1").Trim
					ElseIf bCODESIGN_PFX Then
					SFILE_CREDENTIAL = DoShellCommand("if exist %USERPROFILE%\.pfx-codesign\pfx-codesign-credential.ps1 echo %USERPROFILE%\.pfx-codesign\pfx-codesign-credential.ps1").Trim
					End If
					If (SFILE_CREDENTIAL <> "") Then
					sCREDENTIAL_COMMAND = "powershell """ + SFILE_CREDENTIAL + """"
					End If
					ElseIf TargetMacOS Or TargetLinux Then 'Xojo IDE running on macOS or Linux
					If bCODESIGN_ATS Then
					SFILE_CREDENTIAL = DoShellCommand("[ -f ~/.ats-codesign/ats-codesign-credential.sh ] && echo ~/.ats-codesign/ats-codesign-credential.sh").Trim
					ElseIf bCODESIGN_PFX Then
					SFILE_CREDENTIAL = DoShellCommand("[ -f ~/.pfx-codesign/pfx-codesign-credential.sh ] && echo ~/.pfx-codesign/pfx-codesign-credential.sh").Trim
					End If
					If (SFILE_CREDENTIAL <> "") Then
					Call DoShellCommand("chmod 755 """ + SFILE_CREDENTIAL + """") 'just to make sure it's executable
					sCREDENTIAL_COMMAND = SFILE_CREDENTIAL
					End If
					End If
					
					If (sCREDENTIAL_COMMAND <> "") Then
					'Once the Credential Helper Script is in place, we expect to get a value from it
					Var iCREDENTIAL_RESULT As Integer
					Var sCREDENTIAL As String = DoShellCommand(sCREDENTIAL_COMMAND, 0, iCREDENTIAL_RESULT).Trim
					If (iCREDENTIAL_RESULT <> 0) Or (sCREDENTIAL = "") Then
					Print  "InnoSetup: Could not retrieve " + If(bCODESIGN_ATS, "ATS", "PFX") + " Credential"
					Return
					End If
					
					'Use Environment Variable
					If bCODESIGN_ATS Then
					EnvironmentVariable("AZURE_CLIENT_SECRET") = sCREDENTIAL
					bENV_ATS_CREDENTIAL = true
					ElseIf bCODESIGN_PFX Then
					EnvironmentVariable("PFX_PASSWORD") = sCREDENTIAL
					bENV_PFX_CREDENTIAL = true
					End If
					End If
					End If
					End If
					
					'Parameters for our universal InnoSetup Script
					sINNOSETUP_PARAMETERS.Add("/DcsProductName=""" + sISS_csProductName + """")
					sINNOSETUP_PARAMETERS.Add("/DcsProductNameWithStageCode=""" + sISS_csProductNameWithStageCode + """")
					sINNOSETUP_PARAMETERS.Add("/DcsExeName=""" + sISS_csExeName + """")
					sINNOSETUP_PARAMETERS.Add("/DcsAppPublisher=""" + sISS_csAppPublisher + """")
					sINNOSETUP_PARAMETERS.Add("/DcsAppPublisherURL=""" + sISS_csAppPublisherURL + """")
					sINNOSETUP_PARAMETERS.Add("/DcsOutputBaseFilename=""" + sISS_csOutputBaseFilename + """")
					
					'Define Build Target for our universal InnoSetup Script
					Select Case CurrentBuildTarget
					Case 3 'Windows (Intel, 32Bit)
					sINNOSETUP_PARAMETERS.Add("/DcsBuildTargetWIN32")
					Case 19 'Windows (Intel, 64Bit)
					sINNOSETUP_PARAMETERS.Add("/DcsBuildTargetWIN64")
					Case 25 'Windows(ARM, 64Bit)
					sINNOSETUP_PARAMETERS.Add("/DcsBuildTargetARM64")
					End Select
					
					'System Requirements for built Windows application
					sINNOSETUP_PARAMETERS.Add("/DcsMinVersion=""" + sMINVERSION + """")
					
					'Docker related Parameters
					sINNOSETUP_PARAMETERS.Add("/O""Z:/data""") 'Output in Folder
					sINNOSETUP_PARAMETERS.Add("/Dsourcepath=""Z:/data/" + sISS_RELATIVE_SOURCEPATH + """") 'Folder of built App
					sINNOSETUP_PARAMETERS.Add("""Z:/tmp/innosetup-script.iss""") 'we mount the script to this location
					
					Var sISCC_SH_ARGUMENT As String
					If TargetWindows Then 'Xojo IDE is running on Windows
					sISCC_SH_ARGUMENT = """" + String.FromArray(sINNOSETUP_PARAMETERS, " ").ReplaceAll("$f", "\$f").ReplaceAll("""", "\""") + """"
					ElseIf TargetMacOS Or TargetLinux Then 'Xojo IDE running on macOS or Linux
					sISCC_SH_ARGUMENT = "'" + String.FromArray(sINNOSETUP_PARAMETERS, " ").ReplaceAll("$f", "\$f") + "'"
					End If
					
					Var sINNOSETUP_COMMAND As String = _
					sDOCKER_EXE + " run " + _
					"--rm " + _
					If(sFILE_ACS_JSON <> "", "-v """ + sFILE_ACS_JSON + """:/etc/ats-codesign/acs.json ", "") + _
					If(sFILE_AZURE_JSON <> "", "-v """ + sFILE_AZURE_JSON + """:/etc/ats-codesign/azure.json ", "") + _
					If(bENV_ATS_CREDENTIAL, "-e AZURE_CLIENT_SECRET ", "") + _
					If(sFILE_PFX_JSON <> "", "-v """ + sFILE_PFX_JSON + """:/etc/pfx-codesign/pfx.json ", "") + _
					If(sFILE_PFX_CERTIFICATE <> "", "-v """ + sFILE_PFX_CERTIFICATE + """:/etc/pfx-codesign/certificate.pfx ", "") + _
					If(bENV_PFX_CREDENTIAL, "-e PFX_PASSWORD ", "") + _
					"-v """ + sFOLDER_BASE + """:/data " + _
					"-v """ + sINNOSETUP_SCRIPT + """:/tmp/innosetup-script.iss " + _
					"-w /data " + _
					"--entrypoint iscc.sh " + _
					sDOCKER_IMAGE + " " + _
					sISCC_SH_ARGUMENT
					
					Var iINNOSETUP_RESULT As Integer
					Var sINNOSETUP_OUTPUT As String = DoShellCommand(sINNOSETUP_COMMAND, 0, iINNOSETUP_RESULT)
					
					If (iINNOSETUP_RESULT <> 0) And (Not bVERYSILENT) Then
					If (iINNOSETUP_RESULT <> 125) Then
					Var iCHECK_DOCKERIMAGE_RESULT As Integer
					Var sCHECK_DOCKERIMAGE_OUTPUT As String = DoShellCommand(sDOCKER_EXE + " image inspect " + sDOCKER_IMAGE, 0, iCHECK_DOCKERIMAGE_RESULT)
					If (iCHECK_DOCKERIMAGE_RESULT <> 0) Then
					Print "InnoSetup: Docker Image '" + sDOCKER_IMAGE + "' not available" + EndOfLine + EndOfLine + _
					"This sometimes occurs if Docker hasn't been able to automatically download the Docker Image when executing a 'docker run' command." + EndOfLine + EndOfLine + _
					"Download the required Docker Image once manually by executing this command in a Terminal Window:" + EndOfLine + _
					sDOCKER_EXE + " image pull " + sDOCKER_IMAGE
					Return
					End If
					End If
					
					Clipboard = sINNOSETUP_OUTPUT
					Print "InnoSetup: iscc.sh Error" + EndOfLine + _
					"[ExitCode: " + iINNOSETUP_RESULT.ToString + "]" + EndOfLine + EndOfLine + _
					"Note: Shell Output is available in Clipboard."
					End If
					
				End
			End
			Begin BuildStepList Xojo Cloud
				Begin BuildProjectStep Build
				End
			End
#tag EndBuildAutomation

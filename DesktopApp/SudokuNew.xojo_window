#tag DesktopWindow
Begin DesktopWindow SudokuNew
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composite       =   False
   DefaultLocation =   1
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   False
   HasMinimizeButton=   False
   HasTitleBar     =   True
   Height          =   155
   ImplicitInstance=   False
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   ""
   MenuBarVisible  =   False
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   False
   Title           =   "New Sudoku"
   Type            =   8
   Visible         =   True
   Width           =   330
   Begin SudokuButton btnCancel
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   True
      Caption         =   "#Translations.kButtonCancel"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   2
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   115
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
   End
   Begin SudokuButton btnCreate
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "#Translations.kButtonCreate"
      Default         =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   152
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   2
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   115
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   160
   End
   Begin DesktopSeparator sepBottom
      Active          =   False
      AllowAutoDeactivate=   True
      AllowTabStop    =   True
      Enabled         =   True
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   4
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   87
      Transparent     =   False
      Visible         =   True
      Width           =   330
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin SudokuLabel labSudokuN
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#Translations.kLabelSudokuSizeN"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
   End
   Begin SudokuPopupMenu lstSudokuN
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialValue    =   ""
      Italic          =   False
      Left            =   150
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      SelectedRowIndex=   -1
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin SudokuLabel labDifficulty
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#Translations.kLabelDifficulty"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   55
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
   End
   Begin SudokuPopupMenu lstDifficulty
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialValue    =   ""
      Italic          =   False
      Left            =   150
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      SelectedRowIndex=   -1
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   55
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   160
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub Constructor(defaultN As Integer, defaultCluesFactor As Double)
		  mDefaultN = defaultN
		  mDefaultCluesFactor = defaultCluesFactor
		  
		  Super.Constructor
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ActionNew(newN As Integer, newCluesFactor As Double)
	#tag EndHook


	#tag Property, Flags = &h21
		Private mDefaultCluesFactor As Double = 0.0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDefaultN As Integer = 9
	#tag EndProperty


#tag EndWindowCode

#tag Events btnCancel
	#tag Event
		Sub Pressed()
		  Self.Close
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnCreate
	#tag Event
		Sub Pressed()
		  Var n As Integer = 9
		  If (lstSudokuN.SelectedRowIndex >= 0) Then
		    n = lstSudokuN.RowTagAt(lstSudokuN.SelectedRowIndex).IntegerValue
		  End If
		  
		  Var numCluesFactor As Double = 0.444
		  If (lstDifficulty.SelectedRowIndex >= 0) Then
		    numCluesFactor = lstDifficulty.RowTagAt(lstDifficulty.SelectedRowIndex).DoubleValue
		  End If
		  
		  ActionNew(n, numCluesFactor)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstSudokuN
	#tag Event
		Sub Opening()
		  Me.RemoveAllRows
		  
		  Var sudokuSizes() As Integer = Array(4, 6, 8, 9, 12, 16)
		  Var preselectRowIndex As Integer = -1
		  
		  For Each sudokuN As Integer In sudokuSizes
		    
		    Me.AddRow(sudokuN.ToString + "x" + sudokuN.ToString)
		    Me.RowTagAt(Me.LastAddedRowIndex) = sudokuN
		    
		    If (mDefaultN = sudokuN) Then preselectRowIndex = Me.LastAddedRowIndex
		  Next
		  
		  If (preselectRowIndex >= 0) Then
		    Me.SelectedRowIndex = preselectRowIndex
		  Else
		    Me.SelectRowWithTag(9)
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstDifficulty
	#tag Event
		Sub Opening()
		  Me.RemoveAllRows
		  
		  Var preselectRowIndex As Integer = -1
		  
		  Me.AddRow(Translations.kSudokuEmpty)
		  Me.RowTagAt(Me.LastAddedRowIndex) = 0.0
		  If (mDefaultCluesFactor = Me.RowTagAt(Me.LastAddedRowIndex)) Then preselectRowIndex = Me.LastAddedRowIndex
		  
		  Me.AddSeparator
		  
		  Me.AddRow(Translations.kDifficultyVeryHard)
		  Me.RowTagAt(Me.LastAddedRowIndex) = 0.296
		  If (mDefaultCluesFactor = Me.RowTagAt(Me.LastAddedRowIndex)) Then preselectRowIndex = Me.LastAddedRowIndex
		  
		  Me.AddRow(Translations.kDifficultyHard)
		  Me.RowTagAt(Me.LastAddedRowIndex) = 0.345
		  If (mDefaultCluesFactor = Me.RowTagAt(Me.LastAddedRowIndex)) Then preselectRowIndex = Me.LastAddedRowIndex
		  
		  Me.AddRow(Translations.kDifficultyMediumHard)
		  Me.RowTagAt(Me.LastAddedRowIndex) = 0.395
		  If (mDefaultCluesFactor = Me.RowTagAt(Me.LastAddedRowIndex)) Then preselectRowIndex = Me.LastAddedRowIndex
		  
		  Me.AddRow(Translations.kDifficultyMedium)
		  Me.RowTagAt(Me.LastAddedRowIndex) = 0.444
		  If (mDefaultCluesFactor = Me.RowTagAt(Me.LastAddedRowIndex)) Then preselectRowIndex = Me.LastAddedRowIndex
		  
		  Me.AddRow(Translations.kDifficultyMediumEasy)
		  Me.RowTagAt(Me.LastAddedRowIndex) = 0.493
		  If (mDefaultCluesFactor = Me.RowTagAt(Me.LastAddedRowIndex)) Then preselectRowIndex = Me.LastAddedRowIndex
		  
		  Me.AddRow(Translations.kDifficultyEasy)
		  Me.RowTagAt(Me.LastAddedRowIndex) = 0.592
		  If (mDefaultCluesFactor = Me.RowTagAt(Me.LastAddedRowIndex)) Then preselectRowIndex = Me.LastAddedRowIndex
		  
		  Me.AddRow(Translations.kDifficultyVeryEasy)
		  Me.RowTagAt(Me.LastAddedRowIndex) = 0.691
		  If (mDefaultCluesFactor = Me.RowTagAt(Me.LastAddedRowIndex)) Then preselectRowIndex = Me.LastAddedRowIndex
		  
		  If (preselectRowIndex >= 0) Then
		    Me.SelectedRowIndex = preselectRowIndex
		  Else
		    Me.SelectRowWithTag(0.444)
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
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
		Name="Interfaces"
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
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasTitleBar"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Window Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&cFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="DesktopMenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior

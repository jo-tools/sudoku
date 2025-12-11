#tag WebContainerControl
Begin WebContainer SudokuNew
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   CSSClasses      =   ""
   Enabled         =   True
   Height          =   214
   Indicator       =   0
   LayoutDirection =   0
   LayoutType      =   0
   Left            =   0
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   LockVertical    =   False
   PanelIndex      =   0
   ScrollDirection =   0
   TabIndex        =   0
   Top             =   0
   Visible         =   True
   Width           =   422
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebButton btnCreate
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "#Translations.kButtonCreateWeb"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   True
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   1
      Left            =   170
      LockBottom      =   False
      LockedInPosition=   True
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   7
      TabStop         =   True
      Tooltip         =   ""
      Top             =   156
      Visible         =   True
      Width           =   232
      _mPanelIndex    =   -1
   End
   Begin WebLabel labSeparator
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   True
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   5
      TabStop         =   True
      Text            =   "---"
      TextAlignment   =   2
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   110
      Underline       =   False
      Visible         =   True
      Width           =   422
      _mPanelIndex    =   -1
   End
   Begin WebButton btnCancel
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "#Translations.kButtonCancelWeb"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   True
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   6
      TabStop         =   True
      Tooltip         =   ""
      Top             =   156
      Visible         =   True
      Width           =   140
      _mPanelIndex    =   -1
   End
   Begin WebLabel labSudokuN
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   34
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   True
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Parent          =   "rctSudoku"
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#Translations.kLabelSudokuSizeN"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   120
      _mPanelIndex    =   -1
   End
   Begin WebLabel labDifficulty
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   34
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   True
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Parent          =   "rctSudoku"
      Scope           =   2
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#Translations.kLabelDifficulty"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   65
      Underline       =   False
      Visible         =   True
      Width           =   120
      _mPanelIndex    =   -1
   End
   Begin SudokuPopupMenu lstSudokuN
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   34
      Index           =   -2147483648
      Indicator       =   ""
      InitialValue    =   ""
      LastAddedRowIndex=   0
      LastRowIndex    =   0
      Left            =   170
      LockBottom      =   False
      LockedInPosition=   True
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      RowCount        =   0
      Scope           =   2
      SelectedRowIndex=   0
      SelectedRowText =   ""
      TabIndex        =   1
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   120
      _mPanelIndex    =   -1
   End
   Begin SudokuPopupMenu lstDifficulty
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   34
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
      LastAddedRowIndex=   0
      LastRowIndex    =   0
      Left            =   170
      LockBottom      =   False
      LockedInPosition=   True
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      RowCount        =   0
      Scope           =   2
      SelectedRowIndex=   0
      SelectedRowText =   ""
      TabIndex        =   4
      TabStop         =   True
      Tooltip         =   ""
      Top             =   65
      Visible         =   True
      Width           =   230
      _mPanelIndex    =   -1
   End
   Begin WebProgressWheel pgrWheel
      Colorize        =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   32
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   370
      LockBottom      =   False
      LockedInPosition=   True
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   2
      SVGColor        =   &c00000000
      SVGData         =   ""
      TabIndex        =   2
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Visible         =   False
      Width           =   32
      _mPanelIndex    =   -1
   End
   Begin WebThread thrCreate
      DebugIdentifier =   ""
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   True
      Priority        =   8
      Scope           =   0
      StackSize       =   0
      ThreadID        =   0
      ThreadState     =   ""
      Type            =   0
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  Me.SetDefaults
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(defaultN As Integer, defaultCluesFactor As Double)
		  mDefaultN = defaultN
		  mDefaultCluesFactor = defaultCluesFactor
		  
		  Super.Constructor
		  
		  Me.SetDefaults
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetDefaults()
		  Try
		    lstSudokuN.SelectRowWithTag(mDefaultN)
		  Catch InvalidArgumentException
		    lstSudokuN.SelectRowWithTag(9)
		  End Try
		  
		  Try
		    lstDifficulty.SelectRowWithTag(mDefaultCluesFactor)
		  Catch InvalidArgumentException
		    lstDifficulty.SelectRowWithTag(0.444)
		  End Try
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ActionCancel()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ActionNew(newN As Integer, newCluesFactor As Double, newSudokuPuzzle As Sudoku.Puzzle)
	#tag EndHook


	#tag Property, Flags = &h21
		Private mDefaultCluesFactor As Double = 0.0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDefaultN As Integer = 9
	#tag EndProperty


#tag EndWindowCode

#tag Events btnCreate
	#tag Event
		Sub Pressed()
		  Me.Enabled = False
		  
		  
		  Var N As Integer = 9
		  If (lstSudokuN.SelectedRowIndex >= 0) Then
		    N = lstSudokuN.RowTagAt(lstSudokuN.SelectedRowIndex).IntegerValue
		    mDefaultN = N
		  End If
		  
		  Var numCluesFactor As Double = 0.444
		  If (lstDifficulty.SelectedRowIndex >= 0) Then
		    numCluesFactor = lstDifficulty.RowTagAt(lstDifficulty.SelectedRowIndex).DoubleValue
		    mDefaultCluesFactor = numCluesFactor
		  End If
		  
		  ' Stack Size required for Recursion of a 16x16 Sudoku
		  thrCreate.StackSize = 2 * 1024 * 1024
		  thrCreate.Start
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events labSeparator
	#tag Event
		Sub Opening()
		  me.Text = "<raw><hr /></raw>"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnCancel
	#tag Event
		Sub Pressed()
		  If (thrCreate.ThreadState <> Thread.ThreadStates.NotRunning) Then
		    thrCreate.Stop
		  End If
		  
		  Self.Close
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstSudokuN
	#tag Event
		Sub Opening()
		  Me.RemoveAllRows
		  
		  Var sudokuSizes() As Integer = Array(4, 6, 8, 9, 12, 16)
		  
		  For Each sudokuN As Integer In sudokuSizes
		    Me.AddRow(sudokuN.ToString + "x" + sudokuN.ToString)
		    Me.RowTagAt(Me.LastAddedRowIndex) = sudokuN
		  Next
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstDifficulty
	#tag Event
		Sub Opening()
		  Me.RemoveAllRows
		  
		  Me.AddRow(Translations.kSudokuEmpty)
		  Me.RowTagAt(Me.LastAddedRowIndex) = 0.0
		  
		  Me.AddSeparator
		  
		  Me.AddRow(Translations.kDifficultyVeryHard)
		  Me.RowTagAt(Me.LastAddedRowIndex) = 0.296
		  
		  Me.AddRow(Translations.kDifficultyHard)
		  Me.RowTagAt(Me.LastAddedRowIndex) = 0.345
		  
		  Me.AddRow(Translations.kDifficultyMediumHard)
		  Me.RowTagAt(Me.LastAddedRowIndex) = 0.395
		  
		  Me.AddRow(Translations.kDifficultyMedium)
		  Me.RowTagAt(Me.LastAddedRowIndex) = 0.444
		  
		  Me.AddRow(Translations.kDifficultyMediumEasy)
		  Me.RowTagAt(Me.LastAddedRowIndex) = 0.493
		  
		  Me.AddRow(Translations.kDifficultyEasy)
		  Me.RowTagAt(Me.LastAddedRowIndex) = 0.592
		  
		  Me.AddRow(Translations.kDifficultyVeryEasy)
		  Me.RowTagAt(Me.LastAddedRowIndex) = 0.691
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events thrCreate
	#tag Event
		Sub Run()
		  Dim d As New Dictionary
		  d.Value("start") = Nil
		  
		  Me.AddUserInterfaceUpdate(d)
		  Me.Sleep(100)
		  
		  Var sudokuPuzzle As Sudoku.Puzzle = New Sudoku.Puzzle(mDefaultN)
		  
		  Var numClues As Integer = CType(Ceiling(mDefaultCluesFactor * (mDefaultN*mDefaultN)), Integer)
		  If (numClues > 0) Then
		    Me.Sleep(100)
		    Call sudokuPuzzle.GenerateRandomPuzzle(numClues)
		    sudokuPuzzle.LockCurrentState
		  End If
		  
		  d = New Dictionary
		  d.Value("created") = sudokuPuzzle
		  
		  Me.AddUserInterfaceUpdate(d)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub UserInterfaceUpdate(data() As Dictionary)
		  For Each update As Dictionary In data
		    If update.HasKey("start") Then
		      pgrWheel.Visible = True
		      btnCreate.Enabled = False
		      lstDifficulty.Enabled = False
		      lstSudokuN.Enabled = False
		    End If
		    
		    If update.HasKey("created") Then
		      pgrWheel.Visible = True
		      ActionNew(mDefaultN, mDefaultCluesFactor, update.Value("created"))
		    End If
		  Next
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="PanelIndex"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mPanelIndex"
		Visible=false
		Group="Behavior"
		InitialValue="-1"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
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
		Name="ControlID"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockHorizontal"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockVertical"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignHeight"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignWidth"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
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
		Name="ScrollDirection"
		Visible=true
		Group="Behavior"
		InitialValue="ScrollDirections.None"
		Type="WebContainer.ScrollDirections"
		EditorType="Enum"
		#tag EnumValues
			"0 - None"
			"1 - Horizontal"
			"2 - Vertical"
			"3 - Both"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Visual Controls"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Indicator"
		Visible=false
		Group="Visual Controls"
		InitialValue=""
		Type="WebUIControl.Indicators"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Primary"
			"2 - Secondary"
			"3 - Success"
			"4 - Danger"
			"5 - Warning"
			"6 - Info"
			"7 - Light"
			"8 - Dark"
			"9 - Link"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutType"
		Visible=true
		Group="View"
		InitialValue="LayoutTypes.Fixed"
		Type="LayoutTypes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Fixed"
			"1 - Flex"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutDirection"
		Visible=true
		Group="View"
		InitialValue="LayoutDirections.LeftToRight"
		Type="LayoutDirections"
		EditorType="Enum"
		#tag EnumValues
			"0 - LeftToRight"
			"1 - RightToLeft"
			"2 - TopToBottom"
			"3 - BottomToTop"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=false
		Group=""
		InitialValue="250"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=false
		Group=""
		InitialValue="250"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior

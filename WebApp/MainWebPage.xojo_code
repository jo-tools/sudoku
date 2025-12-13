#tag WebPage
Begin WebPage MainWebPage
   AllowTabOrderWrap=   True
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   CSSClasses      =   ""
   Enabled         =   False
   Height          =   670
   ImplicitInstance=   True
   Index           =   -2147483648
   Indicator       =   0
   IsImplicitInstance=   False
   LayoutDirection =   0
   LayoutType      =   0
   Left            =   0
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   LockVertical    =   False
   MinimumHeight   =   670
   MinimumWidth    =   800
   PanelIndex      =   0
   ScaleFactor     =   0.0
   TabIndex        =   0
   Title           =   "Sudoku"
   Top             =   0
   Visible         =   True
   Width           =   800
   _ImplicitInstance=   False
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebRectangle rctSudoku
      BorderColor     =   colAppLabel
      BorderThickness =   0
      ControlCount    =   0
      ControlID       =   ""
      CornerSize      =   -1
      CSSClasses      =   "main-container"
      Enabled         =   True
      FillColor       =   &cFFFFFF
      HasFillColor    =   False
      Height          =   670
      Index           =   -2147483648
      Indicator       =   ""
      LayoutDirection =   "LayoutDirections.LeftToRight"
      LayoutType      =   "LayoutTypes.Fixed"
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   True
      LockHorizontal  =   True
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Visible         =   True
      Width           =   800
      _mDesignHeight  =   0
      _mDesignWidth   =   0
      _mPanelIndex    =   -1
      Begin WebLabel labStatus
         Bold            =   True
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         FontName        =   ""
         FontSize        =   0.0
         Height          =   28
         Index           =   -2147483648
         Indicator       =   0
         InitialParent   =   "rctSudoku"
         Italic          =   False
         Left            =   580
         LockBottom      =   True
         LockedInPosition=   True
         LockHorizontal  =   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         LockVertical    =   False
         Multiline       =   False
         PanelIndex      =   0
         Parent          =   "rctSudoku"
         Scope           =   2
         TabIndex        =   8
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "..."
         TextAlignment   =   2
         TextColor       =   &c000000FF
         Tooltip         =   ""
         Top             =   622
         Underline       =   False
         Visible         =   True
         Width           =   220
         _mPanelIndex    =   -1
      End
      Begin WebButton btnSolve
         AllowAutoDisable=   False
         Cancel          =   False
         Caption         =   "#kSudokuSolve"
         ControlID       =   ""
         CSSClasses      =   ""
         Default         =   True
         Enabled         =   True
         Height          =   38
         Index           =   -2147483648
         Indicator       =   1
         InitialParent   =   "rctSudoku"
         Left            =   600
         LockBottom      =   True
         LockedInPosition=   True
         LockHorizontal  =   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         LockVertical    =   False
         Outlined        =   False
         PanelIndex      =   0
         Parent          =   "rctSudoku"
         Scope           =   2
         TabIndex        =   23
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   530
         Visible         =   True
         Width           =   180
         _mPanelIndex    =   -1
      End
      Begin SudokuCheckbox chkShowCandidates
         Caption         =   "#Translations.kSudokuShowCandidates"
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         Height          =   30
         Indeterminate   =   False
         Index           =   -2147483648
         Indicator       =   0
         InitialParent   =   "rctSudoku"
         Left            =   600
         LockBottom      =   False
         LockedInPosition=   True
         LockHorizontal  =   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         LockVertical    =   False
         PanelIndex      =   0
         Parent          =   "rctSudoku"
         Scope           =   2
         TabIndex        =   17
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   295
         Value           =   True
         Visible         =   True
         Width           =   180
         _mPanelIndex    =   -1
      End
      Begin SudokuCheckbox chkShowHints
         Caption         =   "#Translations.kSudokuShowHints"
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         Height          =   30
         Indeterminate   =   False
         Index           =   -2147483648
         Indicator       =   0
         InitialParent   =   "rctSudoku"
         Left            =   600
         LockBottom      =   False
         LockedInPosition=   True
         LockHorizontal  =   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         LockVertical    =   False
         PanelIndex      =   0
         Parent          =   "rctSudoku"
         Scope           =   2
         TabIndex        =   16
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   265
         Value           =   True
         Visible         =   True
         Width           =   180
         _mPanelIndex    =   -1
      End
      Begin WebLabel labShow
         Bold            =   False
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         FontName        =   ""
         FontSize        =   0.0
         Height          =   30
         Index           =   -2147483648
         Indicator       =   0
         InitialParent   =   "rctSudoku"
         Italic          =   False
         Left            =   600
         LockBottom      =   False
         LockedInPosition=   True
         LockHorizontal  =   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         LockVertical    =   False
         Multiline       =   False
         PanelIndex      =   0
         Parent          =   "rctSudoku"
         Scope           =   2
         TabIndex        =   15
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "#Translations.kLabelShow"
         TextAlignment   =   0
         TextColor       =   &c000000FF
         Tooltip         =   ""
         Top             =   235
         Underline       =   False
         Visible         =   True
         Width           =   180
         _mPanelIndex    =   -1
      End
      Begin WebButton btnLock
         AllowAutoDisable=   False
         Cancel          =   False
         Caption         =   "#Translations.kSudokuLock"
         ControlID       =   ""
         CSSClasses      =   ""
         Default         =   False
         Enabled         =   True
         Height          =   38
         Index           =   -2147483648
         Indicator       =   5
         InitialParent   =   "rctSudoku"
         Left            =   600
         LockBottom      =   False
         LockedInPosition=   True
         LockHorizontal  =   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         LockVertical    =   False
         Outlined        =   False
         PanelIndex      =   0
         Parent          =   "rctSudoku"
         Scope           =   2
         TabIndex        =   14
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   180
         Visible         =   True
         Width           =   180
         _mPanelIndex    =   -1
      End
      Begin WebButton btnNew
         AllowAutoDisable=   False
         Cancel          =   False
         Caption         =   "#Translations.kSudokuNew"
         ControlID       =   ""
         CSSClasses      =   ""
         Default         =   False
         Enabled         =   True
         Height          =   38
         Index           =   -2147483648
         Indicator       =   0
         InitialParent   =   "rctSudoku"
         Left            =   600
         LockBottom      =   False
         LockedInPosition=   True
         LockHorizontal  =   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         LockVertical    =   False
         Outlined        =   False
         PanelIndex      =   0
         Parent          =   "rctSudoku"
         Scope           =   2
         TabIndex        =   10
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   110
         Visible         =   True
         Width           =   180
         _mPanelIndex    =   -1
      End
      Begin WebLabel labExport
         Bold            =   False
         ControlID       =   ""
         CSSClasses      =   "mouse-cursor-pointer"
         Enabled         =   True
         FontName        =   ""
         FontSize        =   0.0
         Height          =   35
         Index           =   -2147483648
         Indicator       =   ""
         InitialParent   =   "rctSudoku"
         Italic          =   False
         Left            =   480
         LockBottom      =   False
         LockedInPosition=   True
         LockHorizontal  =   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         LockVertical    =   False
         Multiline       =   False
         PanelIndex      =   0
         Parent          =   "rctSudoku"
         Scope           =   2
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "#Translations.kLabelExport"
         TextAlignment   =   3
         TextColor       =   colAppLabel
         Tooltip         =   ""
         Top             =   48
         Underline       =   True
         Visible         =   True
         Width           =   80
         _mPanelIndex    =   -1
      End
      Begin WebImageViewer imgPayPal
         ControlID       =   ""
         CSSClasses      =   "mouse-cursor-pointer"
         DisplayMode     =   0
         Enabled         =   True
         Height          =   26
         Image           =   1158877183
         Index           =   -2147483648
         Indicator       =   0
         InitialParent   =   "rctSudoku"
         Left            =   680
         LockBottom      =   False
         LockedInPosition=   True
         LockHorizontal  =   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         LockVertical    =   False
         PanelIndex      =   0
         Parent          =   "rctSudoku"
         Scope           =   2
         SVGData         =   ""
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   "#Sudoku.kURL_Paypal"
         Top             =   44
         URL             =   ""
         Visible         =   True
         Width           =   100
         _mPanelIndex    =   -1
         _ProtectImage   =   False
      End
      Begin WebLabel labContact
         Bold            =   False
         ControlID       =   ""
         CSSClasses      =   "mouse-cursor-pointer"
         Enabled         =   True
         FontName        =   ""
         FontSize        =   10.0
         Height          =   26
         Index           =   -2147483648
         Indicator       =   0
         InitialParent   =   "rctSudoku"
         Italic          =   False
         Left            =   615
         LockBottom      =   False
         LockedInPosition=   True
         LockHorizontal  =   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         LockVertical    =   False
         Multiline       =   False
         PanelIndex      =   0
         Parent          =   "rctSudoku"
         Scope           =   2
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "#Translations.kLabelContact"
         TextAlignment   =   1
         TextColor       =   colAppLabel
         Tooltip         =   "#Sudoku.kEmail_Contact"
         Top             =   44
         Underline       =   True
         Visible         =   True
         Width           =   65
         _mPanelIndex    =   -1
      End
      Begin WebLabel labThankYou
         Bold            =   False
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         FontName        =   ""
         FontSize        =   10.0
         Height          =   24
         Index           =   -2147483648
         Indicator       =   0
         InitialParent   =   "rctSudoku"
         Italic          =   False
         Left            =   590
         LockBottom      =   False
         LockedInPosition=   True
         LockHorizontal  =   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         LockVertical    =   False
         Multiline       =   False
         PanelIndex      =   0
         Parent          =   "rctSudoku"
         Scope           =   2
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "#Translations.kLabelThanks"
         TextAlignment   =   3
         TextColor       =   &c79797900
         Tooltip         =   ""
         Top             =   20
         Underline       =   False
         Visible         =   True
         Width           =   190
         _mPanelIndex    =   -1
      End
      Begin WebLabel labAppVersion
         Bold            =   False
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         FontName        =   ""
         FontSize        =   12.0
         Height          =   28
         Index           =   -2147483648
         Indicator       =   0
         InitialParent   =   "rctSudoku"
         Italic          =   False
         Left            =   85
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
         TabIndex        =   7
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "AppVersion"
         TextAlignment   =   0
         TextColor       =   &c000000FF
         Tooltip         =   ""
         Top             =   52
         Underline       =   False
         Visible         =   True
         Width           =   70
         _mPanelIndex    =   -1
      End
      Begin WebLabel labAppName
         Bold            =   True
         ControlID       =   ""
         CSSClasses      =   "mouse-cursor-pointer"
         Enabled         =   True
         FontName        =   ""
         FontSize        =   0.0
         Height          =   28
         Index           =   -2147483648
         Indicator       =   ""
         InitialParent   =   "rctSudoku"
         Italic          =   False
         Left            =   85
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
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Sudoku"
         TextAlignment   =   0
         TextColor       =   colAppLabel
         Tooltip         =   "#Sudoku.kURL_Repository"
         Top             =   24
         Underline       =   True
         Visible         =   True
         Width           =   100
         _mPanelIndex    =   -1
      End
      Begin WebImageViewer imgAppIcon
         ControlID       =   ""
         CSSClasses      =   "mouse-cursor-pointer"
         DisplayMode     =   0
         Enabled         =   True
         Height          =   64
         Image           =   1252120575
         Index           =   -2147483648
         Indicator       =   0
         InitialParent   =   "rctSudoku"
         Left            =   10
         LockBottom      =   False
         LockedInPosition=   True
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         LockVertical    =   False
         PanelIndex      =   0
         Parent          =   "rctSudoku"
         Scope           =   2
         SVGData         =   ""
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   "#Sudoku.kURL_Repository"
         Top             =   20
         URL             =   ""
         Visible         =   True
         Width           =   64
         _mPanelIndex    =   -1
         _ProtectImage   =   False
      End
      Begin WebLabel labExclusion
         Bold            =   False
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         FontName        =   ""
         FontSize        =   0.0
         Height          =   30
         Index           =   -2147483648
         Indicator       =   0
         Italic          =   False
         Left            =   600
         LockBottom      =   False
         LockedInPosition=   True
         LockHorizontal  =   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         LockVertical    =   False
         Multiline       =   False
         PanelIndex      =   0
         Parent          =   "rctSudoku"
         Scope           =   2
         TabIndex        =   18
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "#Translations.kLabelExclusion"
         TextAlignment   =   0
         TextColor       =   &c000000FF
         Tooltip         =   ""
         Top             =   335
         Underline       =   False
         Visible         =   True
         Width           =   180
         _mPanelIndex    =   -1
      End
      Begin SudokuCheckbox chkExcludeLockedCandidates
         Caption         =   "Locked Candidates"
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         Height          =   30
         Indeterminate   =   False
         Index           =   -2147483648
         Indicator       =   0
         Left            =   600
         LockBottom      =   False
         LockedInPosition=   True
         LockHorizontal  =   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         LockVertical    =   False
         PanelIndex      =   0
         Parent          =   "rctSudoku"
         Scope           =   2
         TabIndex        =   19
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   365
         Value           =   False
         Visible         =   True
         Width           =   180
         _mPanelIndex    =   -1
      End
      Begin SudokuCheckbox chkExcludeNakedSubsets
         Caption         =   "Naked Subsets"
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         Height          =   30
         Indeterminate   =   False
         Index           =   -2147483648
         Indicator       =   0
         Left            =   600
         LockBottom      =   False
         LockedInPosition=   True
         LockHorizontal  =   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         LockVertical    =   False
         PanelIndex      =   0
         Parent          =   "rctSudoku"
         Scope           =   2
         TabIndex        =   20
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   395
         Value           =   False
         Visible         =   True
         Width           =   180
         _mPanelIndex    =   -1
      End
      Begin WebLabel labStatusTitle
         Bold            =   False
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         FontName        =   ""
         FontSize        =   12.0
         Height          =   28
         Index           =   -2147483648
         Indicator       =   0
         InitialParent   =   "rctSudoku"
         Italic          =   False
         Left            =   580
         LockBottom      =   True
         LockedInPosition=   True
         LockHorizontal  =   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         LockVertical    =   False
         Multiline       =   False
         PanelIndex      =   0
         Parent          =   "rctSudoku"
         Scope           =   2
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "#kLabelSudokuStatus"
         TextAlignment   =   2
         TextColor       =   &c000000FF
         Tooltip         =   ""
         Top             =   594
         Underline       =   False
         Visible         =   True
         Width           =   220
         _mPanelIndex    =   -1
      End
      Begin SudokuCheckbox chkExcludeHiddenSubsets
         Caption         =   "Hidden Subsets"
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         Height          =   30
         Indeterminate   =   False
         Index           =   -2147483648
         Indicator       =   0
         Left            =   600
         LockBottom      =   False
         LockedInPosition=   True
         LockHorizontal  =   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         LockVertical    =   False
         PanelIndex      =   0
         Parent          =   "rctSudoku"
         Scope           =   2
         TabIndex        =   21
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   425
         Value           =   False
         Visible         =   True
         Width           =   180
         _mPanelIndex    =   -1
      End
      Begin SudokuCheckbox chkExcludeXWing
         Caption         =   "X-Wing"
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         Height          =   30
         Indeterminate   =   False
         Index           =   -2147483648
         Indicator       =   0
         Left            =   600
         LockBottom      =   False
         LockedInPosition=   True
         LockHorizontal  =   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         LockVertical    =   False
         PanelIndex      =   0
         Parent          =   "rctSudoku"
         Scope           =   2
         TabIndex        =   22
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   455
         Value           =   False
         Visible         =   True
         Width           =   180
         _mPanelIndex    =   -1
      End
      Begin SudokuCanvas cnvSudoku
         CandidateDark   =   &c00000000
         CandidateLight  =   &c00000000
         CellHintHiddenSingleDark=   &cFFFB00E6
         CellHintHiddenSingleLight=   &c945200BF
         CellHintNakedSingleDark=   &c4F8F00BF
         CellHintNakedSingleLight=   &c4F8F00BF
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         ExcludedHiddenSubset=   &c00000000
         ExcludedLockedCandidate=   &c00000000
         ExcludedNakedSubset=   &c00000000
         ExcludedXWing   =   &c00000000
         GridlineDark    =   &cC0C0C000
         GridlineHairDark=   &c5E5E5E00
         GridlineHairLight=   &cA9A9A900
         GridlineLight   =   &c42424200
         Height          =   580
         Index           =   -2147483648
         Indicator       =   0
         InitialParent   =   "rctSudoku"
         Left            =   0
         LockBottom      =   False
         LockedInPosition=   True
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         LockVertical    =   False
         N               =   9
         PanelIndex      =   0
         Parent          =   "rctSudoku"
         Scope           =   2
         TabIndex        =   9
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   90
         Visible         =   True
         Width           =   580
         _mPanelIndex    =   -1
      End
   End
   Begin SudokuController Controller
      ContainerHeight =   670
      ContainerWidth  =   800
      ControlID       =   ""
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   True
      N               =   9
      PanelIndex      =   0
      Scope           =   2
      _mPanelIndex    =   -1
   End
End
#tag EndWebPage

#tag WindowCode
	#tag Event
		Sub Opening()
		  ' Try to restore Session State
		  If Self.CookieGet Then
		    ' Sudoku loaded from Cookie
		    Return
		  End If
		  
		  ' Show a 9x9 Sudoku by default when first visiting this WebApp
		  Var N As Integer = 9
		  Var numClues As Integer = 36
		  
		  Me.SudokuPuzzle = New Sudoku.Puzzle(N)
		  Me.ActionRandom(N, numClues)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Shown()
		  ' Workaround: Re-Set first Focus
		  btnNew.SetFocus
		  
		  Var focusIndex As Integer = -1
		  
		  For row As Integer = 0 To Me.SudokuPuzzle.GetGridSettings.N-1
		    For col As Integer = 0 To Me.SudokuPuzzle.GetGridSettings.N-1
		      Var index As Integer = row * Me.SudokuPuzzle.GetGridSettings.N + col
		      
		      Var value As Integer = Me.SudokuPuzzle.GetGridValue(row, col)
		      If value = 0 Then
		        If (focusIndex < 0) Then focusIndex = index
		      End If
		      
		      If (focusIndex >= 0) Then Exit 'Loop
		    Next
		    If (focusIndex >= 0) Then Exit 'Loop
		  Next
		  
		  ' Set Focus into first empty field
		  If (focusIndex >= 0) Then
		    Me.SudokuTextFields(focusIndex).SetFocus
		  End If
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub ActionDownloadStarted(file As WebFile)
		  If (file = Me.Download) Then
		    Me.Download = Nil
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ActionEmpty()
		  Print "Session '" + Session.Identifier + "': Action Empty"
		  
		  Me.SudokuPuzzle.ClearGrid
		  Me.ShowSudoku
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ActionExport()
		  Var popDownloadChoice As New DownloadChoice
		  
		  AddHandler popDownloadChoice.ActionPDF, WeakAddressOf ActionExportPDF
		  AddHandler popDownloadChoice.ActionJson, WeakAddressOf ActionExportJson
		  AddHandler popDownloadChoice.ActionTxt, WeakAddressOf ActionExportTxt
		  
		  popDownloadChoice.ShowPopover(labExport, WebContainer.DisplaySides.Bottom)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ActionExportJson(obj As DownloadChoice)
		  Print "Session '" + Session.Identifier + "': Action Export Json"
		  
		  ' Dismiss Popover
		  If (obj <> Nil) Then obj.Close
		  
		  ' Export Json
		  Var json As JSONItem = Me.SudokuPuzzle.ToJson(App.GetJsonApplication, False)
		  
		  Var jsonOptions As New JSONOptions
		  jsonOptions.Compact = False
		  
		  ' Save Json and Download
		  Var prepareDownload As New WebFile
		  prepareDownload.MimeType = "application/json"
		  prepareDownload.ForceDownload = True
		  prepareDownload.FileName = "Sudoku " + DateTime.now.SQLDateTime.ReplaceAll(":", "-") + ".sudoku"
		  prepareDownload.Data = json.ToString(jsonOptions)
		  
		  AddHandler prepareDownload.Downloaded, WeakAddressOf Self.ActionDownloadStarted
		  
		  Me.Download = prepareDownload
		  Call prepareDownload.Download
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ActionExportPDF(obj As DownloadChoice)
		  Print "Session '" + Session.Identifier + "': Action Export Pdf"
		  
		  ' Dismiss Popover
		  If (obj <> Nil) Then obj.Close
		  
		  ' Setup PDF
		  Var pdf As New PDFDocument(PDFDocument.PageSizes.A4)
		  Var g As Graphics = pdf.Graphics
		  
		  ' PDF MetaData
		  pdf.Title = "Sudoku"
		  pdf.Subject = "Sudoku"
		  pdf.Author = Sudoku.kURL_Repository
		  pdf.Creator = "Sudoku " + labAppVersion.Text + " (Xojo " + XojoVersionString + ")"
		  pdf.Keywords = "Sudoku"
		  
		  ' Draw Sudoku
		  Me.SudokuPuzzle.DrawInto(g, True)
		  
		  ' Save PDF and Download
		  Var prepareDownload As New WebFile
		  prepareDownload.MimeType = "application/pdf"
		  prepareDownload.ForceDownload = True
		  prepareDownload.FileName = "Sudoku " + DateTime.now.SQLDateTime.ReplaceAll(":", "-") + ".pdf"
		  prepareDownload.Data = pdf.ToData
		  
		  AddHandler prepareDownload.Downloaded, WeakAddressOf Self.ActionDownloadStarted
		  
		  Me.Download = prepareDownload
		  Call prepareDownload.Download
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ActionExportTxt(obj As DownloadChoice)
		  Print "Session '" + Session.Identifier + "': Action Export Txt"
		  
		  ' Dismiss Popover
		  If (obj <> Nil) Then obj.Close
		  
		  ' Export Txt
		  Var txt As String = Me.SudokuPuzzle.ToString
		  
		  ' Save Txt and Download
		  Var prepareDownload As New WebFile
		  prepareDownload.MimeType = "text/plain"
		  prepareDownload.ForceDownload = True
		  prepareDownload.FileName = "Sudoku " + DateTime.now.SQLDateTime.ReplaceAll(":", "-") + ".sudoku"
		  prepareDownload.Data = txt
		  
		  AddHandler prepareDownload.Downloaded, WeakAddressOf Self.ActionDownloadStarted
		  
		  Me.Download = prepareDownload
		  Call prepareDownload.Download
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ActionLock()
		  Print "Session '" + Session.Identifier + "': Action Lock"
		  
		  ' Lock current state
		  For row As Integer = 0 To Me.SudokuPuzzle.GetGridSettings.N-1
		    For col As Integer = 0 To Me.SudokuPuzzle.GetGridSettings.N-1
		      Var index As Integer = row * Me.SudokuPuzzle.GetGridSettings.N + col
		      Var value As Integer = Me.SudokuPuzzle.GetGridValue(row, col)
		      
		      If (value > 0) Then
		        Me.SudokuTextFields(index).Lock = (value > 0)
		        Me.SudokuPuzzle.SetGridCellLocked(row, col)
		      End If
		    Next
		  Next
		  
		  Me.RefreshControls
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ActionNew()
		  Print "Session '" + Session.Identifier + "': Action Empty"
		  
		  Var popSudokuNew As New SudokuNew(Me.SudokuPuzzle.GetGridSettings.N, mCluesFactor)
		  
		  AddHandler popSudokuNew.ActionNew, WeakAddressOf ActionNewExecute
		  AddHandler popSudokuNew.ActionCancel, WeakAddressOf ActionNewCancel
		  
		  popSudokuNew.ShowPopover(btnNew, WebContainer.DisplaySides.Bottom)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ActionNewCancel(obj As SudokuNew)
		  Print "Session '" + Session.Identifier + "': Action New Cancel"
		  
		  ' Dismiss Popover
		  If (obj <> Nil) Then obj.Close
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ActionNewExecute(obj As SudokuNew, newN As Integer, newCluesFactor As Double, newSudokuPuzzle As Sudoku.Puzzle)
		  #Pragma unused newN
		  
		  Print "Session '" + Session.Identifier + "': Action New Execute"
		  
		  ' Dismiss Popover
		  If (obj <> Nil) Then obj.Close
		  
		  ' Show new Sudoku
		  If (newSudokuPuzzle = Nil) Then Return
		  
		  mCluesFactor = newCluesFactor
		  Me.SudokuPuzzle = newSudokuPuzzle
		  Me.ShowSudoku
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ActionRandom(n As Integer, numClues As Integer)
		  Print "Session '" + Session.Identifier + "': Action Random (" + n.ToString + "x" + n.ToString + " | " + numClues.ToString + ")"
		  
		  Call Me.SudokuPuzzle.GenerateRandomPuzzle(numClues)
		  Me.ShowSudoku
		  Me.ActionLock
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ActionSolve()
		  Print "Session '" + Session.Identifier + "': Action Solve"
		  
		  ' Sanity Check
		  If (Not Me.SudokuPuzzle.IsSolvable) Then Return
		  
		  ' Solve and Show
		  Call Me.SudokuPuzzle.Solve
		  Me.ShowSudoku
		  Me.ActionLock
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  Me.mExclusionParams = Sudoku.CreateExclusionParams
		  
		  Super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CookieGet() As Boolean
		  ' Restore Session State
		  
		  Try
		    
		    Var cookie As String = Session.Cookies.Value(kCookieKeySudokuState).Trim
		    If (cookie = "") Then Return False
		    cookie = DecodeBase64(cookie, Encodings.UTF8)
		    
		    Var json As New JSONItem(cookie)
		    
		    If json.HasKey(kJSONKeyShowHints) Then
		      mShowHints = json.Lookup(kJSONKeyShowHints, mShowHints).BooleanValue
		    End If
		    If json.HasKey(kJSONKeyShowCandidates) Then
		      mShowCandidates = json.Lookup(kJSONKeyShowCandidates, mShowCandidates).BooleanValue
		    End If
		    If json.HasKey(kJSONKeyExcludeLockedCandidates) Then
		      mExclusionParams.ExcludeLockedCandidates = json.Lookup(kJSONKeyExcludeLockedCandidates, mExclusionParams.ExcludeLockedCandidates).BooleanValue
		    End If
		    If json.HasKey(kJSONKeyExcludeNakedSubsets) Then
		      mExclusionParams.ExcludeNakedSubsets = json.Lookup(kJSONKeyExcludeNakedSubsets, mExclusionParams.ExcludeNakedSubsets).BooleanValue
		    End If
		    If json.HasKey(kJSONKeyExcludeHiddenSubsets) Then
		      mExclusionParams.ExcludeHiddenSubsets = json.Lookup(kJSONKeyExcludeHiddenSubsets, mExclusionParams.ExcludeHiddenSubsets).BooleanValue
		    End If
		    If json.HasKey(kJSONKeyExcludeXWing) Then
		      mExclusionParams.ExcludeXWing = json.Lookup(kJSONKeyExcludeXWing, mExclusionParams.ExcludeXWing).BooleanValue
		    End If
		    
		    If json.HasKey(kJSONKeyCluesFactor1000) Then
		      mCluesFactor = json.Lookup(kJSONKeyCluesFactor1000, 0).IntegerValue / 1000
		    End If
		    
		    If json.HasKey(kJSONKeySudoku) Then
		      Var sudokuString As String = json.Lookup(kJSONKeySudoku, "").StringValue.Trim
		      
		      Try
		        Var sudokuPuzzle As New Sudoku.Puzzle(sudokuString)
		        If (sudokuPuzzle <> Nil) Then
		          
		          If json.HasKey(kJSONKeySudokuLockedCellIndexes) Then
		            Var jsonLockedCellIndexes As Variant = json.Value(kJSONKeySudokuLockedCellIndexes)
		            If (jsonLockedCellIndexes IsA JSONItem) And JsonItem(jsonLockedCellIndexes).IsArray Then
		              
		              For i As Integer = 0 To JsonItem(jsonLockedCellIndexes).LastRowIndex
		                Var lockIndex As Integer = JsonItem(jsonLockedCellIndexes).ValueAt(i).IntegerValue
		                If (lockIndex < 0) Or (lockIndex > Me.SudokuTextFields.LastIndex) Then Continue
		                Me.SudokuTextFields(lockIndex).Lock = True
		                sudokuPuzzle.SetGridCellLocked(lockIndex)
		              Next
		            End If
		          End If
		          
		          Me.SudokuPuzzle = sudokuPuzzle
		          Me.ShowSudoku
		          
		          Return True
		          
		        End If
		        
		      Catch err As InvalidArgumentException
		        ' Invalid String for Sudoku
		        Return False
		      End Try
		    End If
		    
		    
		  Catch err1 As IOException
		    ' Silently ignore
		    Return False
		    
		  Catch err2 As JSONException
		    ' Silently ignore
		    Return False
		    
		  End Try
		  
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CookieSet()
		  ' Store Session State
		  
		  Var json As New JSONItem
		  json.Value(kJSONKeyShowHints) = mShowHints
		  json.Value(kJSONKeyShowCandidates) = mShowCandidates
		  
		  json.Value(kJSONKeyExcludeLockedCandidates) = mExclusionParams.ExcludeLockedCandidates
		  json.Value(kJSONKeyExcludeNakedSubsets) = mExclusionParams.ExcludeNakedSubsets
		  json.Value(kJSONKeyExcludeHiddenSubsets) = mExclusionParams.ExcludeHiddenSubsets
		  json.Value(kJSONKeyExcludeXWing) = mExclusionParams.ExcludeXWing
		  
		  json.Value(kJSONKeyCluesFactor1000) = CType(Ceiling(mCluesFactor * 1000), Integer)
		  
		  If (Me.SudokuPuzzle <> Nil) Then
		    json.Value(kJSONKeySudoku) = Me.SudokuPuzzle.ToString
		    json.Value(kJSONKeySudokuLockedCellIndexes) = GetLockedCellIndexes
		  End If
		  
		  Var jsonOptions As New JSONOptions
		  jsonOptions.Compact = True
		  
		  Var cookieContent As String = EncodeBase64(json.ToString(jsonOptions), 0)
		  Session.Cookies.Set(kCookieKeySudokuState, cookieContent, Nil, "", "", False, False, WebCookieManager.SameSiteStrength.Lax)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetLockedCellIndexes() As Integer()
		  Var lockedCellIndexes() As Integer
		  
		  ' Are there any unlocked cells with digits?
		  For row As Integer = 0 To Me.SudokuPuzzle.GetGridSettings.N-1
		    For col As Integer = 0 To Me.SudokuPuzzle.GetGridSettings.N-1
		      Var index As Integer = row * Me.SudokuPuzzle.GetGridSettings.N + col
		      
		      If (Not Me.SudokuTextFields(index).IsLocked) Then Continue
		      If (Me.SudokuPuzzle.GetGridValue(row, col) < 1) Then Continue 'Is empty
		      
		      ' Found a non-empty, locked cell
		      lockedCellIndexes.Add(index)
		    Next
		  Next
		  
		  Return lockedCellIndexes
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HasUnlockedCells() As Boolean
		  ' Are there any unlocked cells with digits?
		  For row As Integer = 0 To Me.SudokuPuzzle.GetGridSettings.N-1
		    For col As Integer = 0 To Me.SudokuPuzzle.GetGridSettings.N-1
		      Var index As Integer = row * Me.SudokuPuzzle.GetGridSettings.N + col
		      
		      If Me.SudokuTextFields(index).IsLocked Then Continue
		      If (Me.SudokuPuzzle.GetGridValue(row, col) < 1) Then Continue 'Is empty
		      
		      ' Found a non-empty, unlocked cell
		      Return True
		    Next
		  Next
		  
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RefreshControls()
		  Var isEmpty As Boolean = Me.SudokuPuzzle.IsEmpty
		  Var isValid As Boolean = isEmpty Or Me.SudokuPuzzle.IsValid
		  Var isSolvable As Boolean = isEmpty Or (isValid And Me.SudokuPuzzle.IsSolvable)
		  Var isSolved As Boolean = (Not isEmpty) And Me.SudokuPuzzle.IsSolved
		  
		  If mShowHints And (Not isEmpty) And isValid And isSolvable And (Not isSolved) Then
		    Me.CellHints = Me.SudokuPuzzle.GetCellHints
		  Else
		    Redim CellHints(-1)
		  End If
		  
		  If mShowCandidates And (Not isEmpty) And isValid And isSolvable And (Not isSolved) Then
		    Me.CellCandidates = Me.SudokuPuzzle.GetCellCandidates(mExclusionParams)
		  Else
		    Redim CellCandidates(-1)
		  End If
		  
		  ' Controls
		  btnLock.Enabled = (Not isEmpty) And isValid And isSolvable And Me.HasUnlockedCells
		  btnSolve.Enabled = (Not isEmpty) And isValid And isSolvable And (Not isSolved) And Me.SudokuPuzzle.SolveEnabled
		  
		  labExclusion.Enabled = Me.mShowCandidates
		  chkExcludeLockedCandidates.Enabled = Me.mShowCandidates
		  chkExcludeNakedSubsets.Enabled = Me.mShowCandidates
		  chkExcludeHiddenSubsets.Enabled = Me.mShowCandidates
		  chkExcludeXWing.Enabled = Me.mShowCandidates
		  
		  ' Show
		  chkShowHints.EnsureValue = mShowHints
		  chkShowCandidates.EnsureValue = mShowCandidates
		  
		  chkExcludeLockedCandidates.EnsureValue = mExclusionParams.ExcludeLockedCandidates
		  chkExcludeNakedSubsets.EnsureValue = mExclusionParams.ExcludeNakedSubsets
		  chkExcludeHiddenSubsets.EnsureValue = mExclusionParams.ExcludeHiddenSubsets
		  chkExcludeXWing.EnsureValue = mExclusionParams.ExcludeXWing
		  
		  cnvSudoku.UpdateCandidates(CellHints, CellCandidates, mShowHints, mShowCandidates)
		  Me.CookieSet
		  
		  ' Status
		  If isEmpty Then
		    labStatus.Text = kSudokuStatusEmpty
		    labStatus.TextColor = Color.Gray
		    Return
		  End If
		  
		  If (Not isValid) Then
		    labStatus.Text = kSudokuStatusInvalid
		    labStatus.TextColor = colStatusInvalid
		    Return
		  End If
		  
		  If isSolved Then
		    labStatus.Text = kSudokuStatusSolved
		    labStatus.TextColor = colStatusSolved
		    Return
		  End If
		  
		  If isSolvable Then
		    labStatus.Text = kSudokuStatusValid
		  Else
		    labStatus.Text = kSudokuStatusValidNotSolvable
		  End If
		  labStatus.TextColor = colStatusValid
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowSudoku()
		  mIsShowingSudoku = True
		  
		  Var focusIndex As Integer = -1
		  
		  ' Put Values into SudokuTextFields
		  For row As Integer = 0 To Me.SudokuPuzzle.GetGridSettings.N-1
		    For col As Integer = 0 To Me.SudokuPuzzle.GetGridSettings.N-1
		      Var index As Integer = row * Me.SudokuPuzzle.GetGridSettings.N + col
		      
		      Me.SudokuTextFields(index).Lock = False
		      
		      Var value As Integer = Me.SudokuPuzzle.GetGridValue(row, col)
		      If value = 0 Then
		        Me.SudokuTextFields(index).Text = ""
		        If (focusIndex < 0) Then focusIndex = index
		      Else
		        Me.SudokuTextFields(index).Text = value.ToString
		        Me.SudokuTextFields(index).Lock = Me.SudokuPuzzle.IsGridCellLocked(row, col)
		      End If
		    Next
		  Next
		  
		  ' Focus into first empty field
		  If (focusIndex < 0) Then
		    Self.SetFocus 'move Focus out of TextFields
		  Else
		    Me.SudokuTextFields(focusIndex).SetFocus
		  End If
		  
		  Me.RefreshControls
		  
		  mIsShowingSudoku = False
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SudokuNumberFieldCommitValue(sender As SudokuNumberField)
		  ' Commit the current text value to the Sudoku grid
		  ' Note: Do NOT call SelectAll here - this method is called from FocusLost,
		  ' and calling SelectAll on a field that lost focus can cause focus to jump back
		  If sender.IsLocked Then Return
		  
		  Var N As Integer = Me.SudokuPuzzle.GetGridSettings.N
		  Var currentNumber As Integer = sender.Text.ToInteger
		  
		  ' Validate: must be 0 (empty) or 1..N
		  If currentNumber < 0 Or currentNumber > N Then
		    ' Invalid value: reset to grid value
		    Var gridVal As Integer = Me.SudokuPuzzle.GetGridValue(sender.RowIndex, sender.ColumnIndex)
		    If gridVal = 0 Then
		      sender.Text = ""
		    Else
		      sender.Text = gridVal.ToString
		    End If
		    Return
		  End If
		  
		  ' Update grid if value changed
		  If Me.SudokuPuzzle.GetGridValue(sender.RowIndex, sender.ColumnIndex) <> currentNumber Then
		    Me.SudokuPuzzle.SetGridValue(sender.RowIndex, sender.ColumnIndex) = currentNumber
		    
		    If currentNumber = 0 Then
		      sender.Text = ""
		    End If
		    
		    ' Update Status
		    Me.RefreshControls
		  End If
		  
		  If (currentNumber > 0) And (sender.Text <> currentNumber.ToString) Then
		    ' This can happen in a N > 9 Sudoku when entering: 05
		    sender.Text = currentNumber.ToString
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SudokuNumberFieldEnterKeyPressed(sender As SudokuNumberField, value As String)
		  #Pragma Unused value
		  
		  If mIsShowingSudoku Then Return
		  
		  Var N As Integer = Me.SudokuPuzzle.GetGridSettings.N
		  
		  ' For N>9: Commit value when Enter is pressed
		  If N > 9 Then
		    Me.SudokuNumberFieldCommitValue(sender)
		    
		    ' Select all so user can easily overwrite
		    sender.SelectAll
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SudokuNumberFieldFocusLost(sender As SudokuNumberField)
		  If mIsShowingSudoku Then Return
		  
		  Var N As Integer = Me.SudokuPuzzle.GetGridSettings.N
		  
		  ' For N>9: Commit value when focus is lost
		  If N > 9 Then
		    Me.SudokuNumberFieldCommitValue(sender)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SudokuNumberFieldsInit()
		  ' Close current Sudoku Number Fields
		  For Each c As SudokuNumberField In SudokuTextFields
		    rctSudoku.RemoveControl(c)
		    c.Close
		  Next
		  
		  Var N As Integer = Me.SudokuPuzzle.GetGridSettings.N
		  
		  Redim Me.SudokuTextFields(N*N-1)
		  
		  ' Create and add Sudoku Number Fields
		  For row As Integer = 0 To N-1
		    For col As Integer = 0 To N-1
		      Var index As Integer = row * N + col
		      
		      Dim t As New SudokuNumberField
		      
		      Me.SudokuTextFields(index) = t
		      
		      t.RowIndex = row
		      t.ColumnIndex = col
		      t.PositionIndex = index
		      
		      t.TextAlignment = TextAlignments.Center
		      ' FieldTypes.Number shows spinners (which we don't want)
		      ' FieldTypes.Telephone shows a number pad on mobile devices
		      t.FieldType = WebTextField.FieldTypes.Telephone
		      ' For N>9, allow 2 characters (e.g., "12", "16")
		      t.MaximumCharactersAllowed = If(N > 9, 2, 1)
		      t.Visible = True
		      t.Enabled = True
		      t.ReadOnly = False
		      t.Width = kTextFieldSize
		      t.Height = kTextFieldSize
		      t.Left = cnvSudoku.Left + kMarginWindow + col * kCellSize + ((kCellSize - t.Width) / 2)
		      t.Top = cnvSudoku.Top + kMarginWindow + row * kCellSize + ((kCellSize - t.Height) / 2)
		      t.Style.BackgroundColor = &cffffffff
		      t.TabIndex = 101 + index
		      ' Set in App.HTMLHeader with padding adjustment
		      t.CSSClasses.Add("sudoku-number-field")
		      
		      AddHandler t.TextChanged, AddressOf SudokuNumberFieldTextChanged
		      AddHandler t.FocusLost, AddressOf SudokuNumberFieldFocusLost
		      AddHandler t.EnterKeyPressed, AddressOf SudokuNumberFieldEnterKeyPressed
		      
		      rctSudoku.AddControl(t)
		    Next
		  Next
		  
		  Me.Controller.N = N
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SudokuNumberFieldTextChanged(sender As SudokuNumberField)
		  If mIsShowingSudoku Then Return
		  
		  Var N As Integer = Me.SudokuPuzzle.GetGridSettings.N
		  
		  If sender.IsLocked Then
		    ' Make sure original grid value is not being overwritten
		    ' we don't set .Readonly to get arrow navigation
		    Var gridVal As String = Me.SudokuPuzzle.GetGridValue(sender.RowIndex, sender.ColumnIndex).ToString
		    If (gridVal = "0") Then gridVal = ""
		    If (sender.Text <> gridVal) Then sender.Text = gridVal
		    Return
		  End If
		  
		  ' For N>9: Don't auto-commit on TextChanged (except for when cleared), wait for FocusLost
		  If N > 9 And (sender.Text <> "") Then
		    Return
		  End If
		  
		  ' For N<=9: Update Number if necessary (original behavior)
		  Var currentNumber As Integer = sender.Text.ToInteger
		  
		  If (currentNumber < 1) And (sender.Text <> "") Then
		    sender.Text = ""
		  End If
		  
		  ' SelectAll, so that a new number overwrites current one
		  If (Not sender.IsLocked) And (sender.Text.ToInteger > 0) Then sender.SelectAll
		  
		  If (Me.SudokuPuzzle.GetGridValue(sender.RowIndex, sender.ColumnIndex) = currentNumber) Then Return
		  
		  Me.SudokuPuzzle.SetGridValue(sender.RowIndex, sender.ColumnIndex) = currentNumber
		  
		  ' Update Status
		  Me.RefreshControls
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private CellCandidates() As Sudoku.CellCandidates
	#tag EndProperty

	#tag Property, Flags = &h21
		Private CellHints() As Sudoku.CellHint
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Download As WebFile
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCluesFactor As Double = 0.444
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mExclusionParams As Sudoku.ExclusionParams
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIsShowingSudoku As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mShowCandidates As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mShowHints As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSudokuPuzzle As Sudoku.Puzzle
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  Return mSudokuPuzzle
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mIsShowingSudoku = True
			  
			  mSudokuPuzzle = value
			  
			  ' Adjust Layout for current Sudoku Puzzle
			  Var N As Integer = mSudokuPuzzle.GetGridSettings.N
			  
			  Var cnvSudokuSize As Integer = 2*kMarginWindow + N*kCellSize
			  cnvSudoku.UpdateSudokuLayout(N, mSudokuPuzzle.GetGridSettings.BoxWidth, mSudokuPuzzle.GetGridSettings.BoxHeight, cnvSudokuSize)
			  
			  Var minLayoutHeight As Integer = chkExcludeXWing.Top + 215 ' Solve and Status are bottom-locked
			  
			  rctSudoku.Width = 2 * kMarginWindow + Max(N, 5) * kCellSize + 20 + btnSolve.Width + 20
			  rctSudoku.Height = Max(cnvSudoku.Top + cnvSudoku.Height, minLayoutHeight)
			  
			  Me.Height = rctSudoku.Height
			  Me.MinimumHeight = Me.Height
			  
			  Me.Width = rctSudoku.Width
			  me.MinimumWidth = me.Width
			  
			  
			  ' Init Sudoku Number Fields
			  Me.SudokuNumberFieldsInit
			  
			  ' Update Controller with new container dimensions for responsive scaling
			  Me.Controller.ContainerWidth = rctSudoku.Width
			  Me.Controller.ContainerHeight = rctSudoku.Height
			  
			  mIsShowingSudoku = False
			  
			End Set
		#tag EndSetter
		Private SudokuPuzzle As Sudoku.Puzzle
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private SudokuTextFields() As SudokuNumberField
	#tag EndProperty


	#tag Constant, Name = kCellSize, Type = Double, Dynamic = False, Default = \"60", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kCookieKeySudokuState, Type = String, Dynamic = False, Default = \"SudokuState", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kJSONKeyCluesFactor1000, Type = String, Dynamic = False, Default = \"cluesFactor", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kJSONKeyExcludeHiddenSubsets, Type = String, Dynamic = False, Default = \"excludeHiddenSubsets", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kJSONKeyExcludeLockedCandidates, Type = String, Dynamic = False, Default = \"excludeLockedCandidates", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kJSONKeyExcludeNakedSubsets, Type = String, Dynamic = False, Default = \"excludeNakedSubsets", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kJSONKeyExcludeXWing, Type = String, Dynamic = False, Default = \"excludeXWing", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kJSONKeyShowCandidates, Type = String, Dynamic = False, Default = \"showCandidates", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kJSONKeyShowHints, Type = String, Dynamic = False, Default = \"showHints", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kJSONKeySudoku, Type = String, Dynamic = False, Default = \"sudoku", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kJSONKeySudokuLockedCellIndexes, Type = String, Dynamic = False, Default = \"sudokuLockedCellIndexes", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kMarginWindow, Type = Double, Dynamic = False, Default = \"20", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kTextFieldSize, Type = Double, Dynamic = False, Default = \"40", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events btnSolve
	#tag Event
		Sub Pressed()
		  Self.ActionSolve
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkShowCandidates
	#tag Event
		Sub ValueChanged()
		  Print "Session '" + Session.Identifier + "': Show Candidates"
		  
		  Self.mShowCandidates = (Not Self.mShowCandidates)
		  Self.RefreshControls
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.EnsureValue = Self.mShowCandidates
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkShowHints
	#tag Event
		Sub ValueChanged()
		  Print "Session '" + Session.Identifier + "': Show Hints"
		  
		  Self.mShowHints = (Not Self.mShowHints)
		  Self.RefreshControls
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.EnsureValue = Self.mShowHints
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnLock
	#tag Event
		Sub Pressed()
		  Self.ActionLock
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnNew
	#tag Event
		Sub Pressed()
		  Self.ActionNew
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events labExport
	#tag Event
		Sub Pressed()
		  Self.ActionExport
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events imgPayPal
	#tag Event
		Sub Pressed(x As Integer, y As Integer)
		  #Pragma Unused x
		  #Pragma Unused y
		  
		  Session.GoToURL(Sudoku.kURL_Paypal)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events labContact
	#tag Event
		Sub Pressed()
		  Session.GoToURL("mailto:" + Sudoku.kEmail_Contact)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events labAppVersion
	#tag Event
		Sub Opening()
		  Me.Text = App.GetVersion
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events labAppName
	#tag Event
		Sub Pressed()
		  Session.GoToURL(Sudoku.kURL_Repository)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events imgAppIcon
	#tag Event
		Sub Pressed(x As Integer, y As Integer)
		  #Pragma Unused x
		  #Pragma Unused y
		  
		  Session.GoToURL(Sudoku.kURL_Repository)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkExcludeLockedCandidates
	#tag Event
		Sub ValueChanged()
		  Print "Session '" + Session.Identifier + "': Exclude Locked Candidates"
		  
		  Self.mExclusionParams.ExcludeLockedCandidates = (Not Self.mExclusionParams.ExcludeLockedCandidates)
		  Self.RefreshControls
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.EnsureValue = Self.mExclusionParams.ExcludeLockedCandidates
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkExcludeNakedSubsets
	#tag Event
		Sub ValueChanged()
		  Print "Session '" + Session.Identifier + "': Exclude Naked Subsets"
		  
		  Self.mExclusionParams.ExcludeNakedSubsets = (Not Self.mExclusionParams.ExcludeNakedSubsets)
		  Self.RefreshControls
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.EnsureValue = Self.mExclusionParams.ExcludeNakedSubsets
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkExcludeHiddenSubsets
	#tag Event
		Sub ValueChanged()
		  Print "Session '" + Session.Identifier + "': Exclude Hidden Subsets"
		  
		  Self.mExclusionParams.ExcludeHiddenSubsets = (Not Self.mExclusionParams.ExcludeHiddenSubsets)
		  Self.RefreshControls
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.EnsureValue = Self.mExclusionParams.ExcludeHiddenSubsets
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkExcludeXWing
	#tag Event
		Sub ValueChanged()
		  Print "Session '" + Session.Identifier + "': Exclude X-Wing"
		  
		  Self.mExclusionParams.ExcludeXWing = (Not Self.mExclusionParams.ExcludeXWing)
		  Self.RefreshControls
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.EnsureValue = Self.mExclusionParams.ExcludeXWing And Self.mExclusionParams.ExcludeXWing
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cnvSudoku
	#tag Event
		Sub Opening()
		  ' Initialize colors from ColorGroup values
		  Me.GridlineLight = &c42424200
		  Me.GridlineDark = &cC0C0C000
		  Me.GridlineHairLight = &cA9A9A900
		  Me.GridlineHairDark = &c5E5E5E00
		  Me.CellHintNakedSingleLight = &c4F8F00BF
		  Me.CellHintNakedSingleDark = &c4F8F00BF
		  Me.CellHintHiddenSingleLight = &c945200BF
		  Me.CellHintHiddenSingleDark = &cFFFB00E6
		  
		  ' Set layout parameters
		  Me.SetupLayout(kMarginWindow, kCellSize, kTextFieldSize, kTextFieldSize)
		  
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
		Name="ControlCount"
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
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
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
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Behavior"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutType"
		Visible=true
		Group="Behavior"
		InitialValue="LayoutTypes.Fixed"
		Type="LayoutTypes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Fixed"
			"1 - Flex"
		#tag EndEnumValues
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
		Name="MinimumHeight"
		Visible=true
		Group="Behavior"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Behavior"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Behavior"
		InitialValue="Untitled"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Behavior"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_ImplicitInstance"
		Visible=false
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
		Name="IsImplicitInstance"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabOrderWrap"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
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
		Name="LayoutDirection"
		Visible=true
		Group="WebView"
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
		Name="ScaleFactor"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Double"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior

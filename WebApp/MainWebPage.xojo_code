#tag WebPage
Begin WebPage MainWebPage
   AllowTabOrderWrap=   True
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   CSSClasses      =   ""
   Enabled         =   False
   Height          =   690
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
   MinimumHeight   =   690
   MinimumWidth    =   840
   PanelIndex      =   0
   ScaleFactor     =   0.0
   TabIndex        =   0
   Title           =   "Sudoku"
   Top             =   0
   Visible         =   True
   Width           =   840
   _ImplicitInstance=   False
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mName          =   ""
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
      Height          =   690
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
      Width           =   840
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
         Left            =   200
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
         TabIndex        =   8
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "..."
         TextAlignment   =   2
         TextColor       =   &c000000FF
         Tooltip         =   ""
         Top             =   52
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
         Left            =   620
         LockBottom      =   False
         LockedInPosition=   True
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         LockVertical    =   False
         Outlined        =   False
         PanelIndex      =   0
         Parent          =   "rctSudoku"
         Scope           =   2
         TabIndex        =   23
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   612
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
         Left            =   620
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
         TabIndex        =   17
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   390
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
         Left            =   620
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
         TabIndex        =   16
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   360
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
         Left            =   620
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
         TabIndex        =   15
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "#Translations.kLabelShow"
         TextAlignment   =   0
         TextColor       =   &c000000FF
         Tooltip         =   ""
         Top             =   330
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
         Left            =   620
         LockBottom      =   False
         LockedInPosition=   True
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   False
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
         Top             =   275
         Visible         =   True
         Width           =   180
         _mPanelIndex    =   -1
      End
      Begin WebButton btnRandom
         AllowAutoDisable=   False
         Cancel          =   False
         Caption         =   "#Translations.kSudokuRandom"
         ControlID       =   ""
         CSSClasses      =   ""
         Default         =   False
         Enabled         =   True
         Height          =   38
         Index           =   -2147483648
         Indicator       =   0
         InitialParent   =   "rctSudoku"
         Left            =   620
         LockBottom      =   False
         LockedInPosition=   True
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         LockVertical    =   False
         Outlined        =   False
         PanelIndex      =   0
         Parent          =   "rctSudoku"
         Scope           =   2
         TabIndex        =   13
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   216
         Visible         =   True
         Width           =   180
         _mPanelIndex    =   -1
      End
      Begin WebLabel labNumClues
         Bold            =   False
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         FontName        =   ""
         FontSize        =   0.0
         Height          =   38
         Index           =   -2147483648
         Indicator       =   0
         InitialParent   =   "rctSudoku"
         Italic          =   False
         Left            =   703
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
         TabIndex        =   12
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "#Translations.kLabelNumClues"
         TextAlignment   =   0
         TextColor       =   &c000000FF
         Tooltip         =   ""
         Top             =   170
         Underline       =   False
         Visible         =   True
         Width           =   97
         _mPanelIndex    =   -1
      End
      Begin SudokuPopupMenu lstNumClues
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         Height          =   38
         Index           =   -2147483648
         Indicator       =   0
         InitialParent   =   "rctSudoku"
         InitialValue    =   ""
         LastAddedRowIndex=   0
         LastRowIndex    =   0
         Left            =   620
         LockBottom      =   False
         LockedInPosition=   True
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         LockVertical    =   False
         PanelIndex      =   0
         Parent          =   "rctSudoku"
         RowCount        =   0
         Scope           =   2
         SelectedRowIndex=   0
         SelectedRowText =   ""
         TabIndex        =   11
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   170
         Visible         =   True
         Width           =   75
         _mPanelIndex    =   -1
      End
      Begin WebButton btnEmpty
         AllowAutoDisable=   False
         Cancel          =   False
         Caption         =   "#Translations.kSudokuEmpty"
         ControlID       =   ""
         CSSClasses      =   ""
         Default         =   False
         Enabled         =   True
         Height          =   38
         Index           =   -2147483648
         Indicator       =   0
         InitialParent   =   "rctSudoku"
         Left            =   620
         LockBottom      =   False
         LockedInPosition=   True
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   False
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
      Begin WebCanvas cnvSudoku
         ControlID       =   ""
         CSSClasses      =   ""
         DiffEngineDisabled=   False
         Enabled         =   True
         Height          =   580
         Index           =   -2147483648
         Indicator       =   0
         InitialParent   =   "rctSudoku"
         Left            =   20
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
         TabIndex        =   9
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   90
         Visible         =   True
         Width           =   580
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
         Left            =   500
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
         Left            =   700
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
         Left            =   635
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
         Left            =   610
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
         Left            =   105
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
         Left            =   105
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
         Left            =   30
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
         Left            =   620
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
         TabIndex        =   18
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "#Translations.kLabelExclusion"
         TextAlignment   =   0
         TextColor       =   &c000000FF
         Tooltip         =   ""
         Top             =   430
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
         Left            =   620
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
         TabIndex        =   19
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   460
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
         Left            =   620
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
         TabIndex        =   20
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   490
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
         Left            =   250
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
         Text            =   "#kLabelSudokuStatus"
         TextAlignment   =   2
         TextColor       =   &c000000FF
         Tooltip         =   ""
         Top             =   24
         Underline       =   False
         Visible         =   True
         Width           =   120
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
         Left            =   620
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
         TabIndex        =   21
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   520
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
         Left            =   620
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
         TabIndex        =   22
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   550
         Value           =   False
         Visible         =   True
         Width           =   180
         _mPanelIndex    =   -1
      End
   End
   Begin SudokuController Controller
      ControlID       =   ""
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   True
      PanelIndex      =   0
      Scope           =   2
      Size            =   9
      _mPanelIndex    =   -1
   End
End
#tag EndWebPage

#tag WindowCode
	#tag Event
		Sub Opening()
		  // TODO: This is still hardcoded for a 3x3 Sudoku
		  // Needs to be changed to use Me.SudokuPuzzle.GetGridSettings.N (N, BoxWidth, BoxHeight)
		  Var N As Integer = 9
		  
		  Me.SudokuPuzzle = New Sudoku.Puzzle(N)
		  Self.SudokuNumberFieldsInit
		  
		  If (Not Self.CookieGet) Then
		    Self.ActionRandom
		  End If
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Shown()
		  ' Workaround: Re-Set first Focus
		  lstNumClues.SetFocus
		  
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
		Private Sub ActionRandom()
		  Var numClues As Integer = lstNumClues.SelectedRowText.ToInteger
		  
		  Print "Session '" + Session.Identifier + "': Action Random (" + numClues.ToString + ")"
		  
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
		    If json.HasKey(kJSONKeyRandomNumClues) Then
		      Var randomNumClues As Integer = lstNumClues.SelectedRowText.ToInteger
		      randomNumClues = json.Lookup(kJSONKeyRandomNumClues, randomNumClues).IntegerValue
		      If (lstNumClues.SelectedRowText <> randomNumClues.ToString) Then
		        Try
		          lstNumClues.EnsureSelectRowWithText = randomNumClues.ToString
		        Catch err As InvalidArgumentException
		          ' Silently ignore
		        End Try
		      End If
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
		        End If
		        
		      Catch err As InvalidArgumentException
		        ' Invalid String for Sudoku
		        Return False
		      End Try
		    End If
		    
		    Return True
		    
		    
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
		  
		  Var randomNumClues As Integer = lstNumClues.SelectedRowText.ToInteger
		  If (randomNumClues > 0) Then
		    json.Value(kJSONKeyRandomNumClues) = randomNumClues
		  End If
		  
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
		  btnEmpty.Enabled = (Not isEmpty)
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
		  
		  cnvSudoku.Refresh
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
		Private Sub SudokuNumberFieldsInit()
		  Redim Me.SudokuTextFields(Me.SudokuPuzzle.GetGridSettings.N*Me.SudokuPuzzle.GetGridSettings.N-1)
		  
		  ' Create and add Sudoku Number Fields
		  For row As Integer = 0 To Me.SudokuPuzzle.GetGridSettings.N-1
		    For col As Integer = 0 To Me.SudokuPuzzle.GetGridSettings.N-1
		      Var index As Integer = row * Me.SudokuPuzzle.GetGridSettings.N + col
		      
		      Dim t As New SudokuNumberField
		      
		      Me.SudokuTextFields(index) = t
		      
		      t.RowIndex = row
		      t.ColumnIndex = col
		      t.PositionIndex = index
		      
		      t.TextAlignment = TextAlignments.Center
		      ' FieldTypes.Number shows spinners (which we don't want)
		      ' FieldTypes.Telephone shows a number pad on mobile devices
		      t.FieldType = WebTextField.FieldTypes.Telephone
		      t.MaximumCharactersAllowed = 1
		      t.Visible = True
		      t.Enabled = True
		      t.ReadOnly = False
		      t.Width = 40
		      t.Height = 40
		      t.Left = cnvSudoku.Left + kMarginWindow + col * kCellSize + ((kCellSize - t.Width) / 2)
		      t.Top = cnvSudoku.Top + kMarginWindow + row * kCellSize + ((kCellSize - t.Height) / 2)
		      t.Style.BackgroundColor = &cffffffff
		      t.TabIndex = 101 + index
		      
		      AddHandler t.TextChanged, AddressOf SudokuNumberFieldTextChanged
		      
		      rctSudoku.AddControl(t)
		    Next
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SudokuNumberFieldTextChanged(sender As SudokuNumberField)
		  If mIsShowingSudoku Then Return
		  
		  If sender.IsLocked Then
		    ' Make sure original grid value is not being overwritten
		    ' we don't set .Readonly to get arrow navigation
		    Var gridVal As String = Me.SudokuPuzzle.GetGridValue(sender.RowIndex, sender.ColumnIndex).ToString
		    If (gridVal = "0") Then gridVal = ""
		    If (sender.Text <> gridVal) Then sender.Text = gridVal
		    Return
		  End If
		  
		  ' Update Number if necessary
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
		Private SudokuPuzzle As Sudoku.Puzzle
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SudokuTextFields() As SudokuNumberField
	#tag EndProperty


	#tag Constant, Name = kCellSize, Type = Double, Dynamic = False, Default = \"60", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kCookieKeySudokuState, Type = String, Dynamic = False, Default = \"SudokuState", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kJavaScriptWrapper, Type = String, Dynamic = False, Default = \"(function() {\n  var rectID \x3D \'[CONTROLID]\';\n  \n  function wrapAndScale() {\n    var el \x3D document.getElementById(rectID);\n    if (!el) return;\n\n    if (!el.parentElement.classList.contains(\'wrapper\')) {\n      var wrapper \x3D document.createElement(\'div\');\n      wrapper.className \x3D \'wrapper\';\n      el.parentNode.insertBefore(wrapper\x2C el);\n      wrapper.appendChild(el);\n    }\n\n    var baseWidth \x3D 840;\n    var windowWidth \x3D Math.min(window.innerWidth\x2C baseWidth);\n    var scale \x3D windowWidth / baseWidth;\n    el.style.transform \x3D \'scale(\' + scale + \')\';\n  }\n\n  function waitForElement() {\n    var el \x3D document.getElementById(rectID);\n    if (el) {\n      wrapAndScale();\n      window.addEventListener(\'resize\'\x2C wrapAndScale);\n    } else {\n      setTimeout(waitForElement\x2C 50);\n    }\n  }\n\n  waitForElement();\n})();\n", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kJSONKeyExcludeHiddenSubsets, Type = String, Dynamic = False, Default = \"excludeHiddenSubsets", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kJSONKeyExcludeLockedCandidates, Type = String, Dynamic = False, Default = \"excludeLockedCandidates", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kJSONKeyExcludeNakedSubsets, Type = String, Dynamic = False, Default = \"excludeNakedSubsets", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kJSONKeyExcludeXWing, Type = String, Dynamic = False, Default = \"excludeXWing", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kJSONKeyRandomNumClues, Type = String, Dynamic = False, Default = \"randomNumClues", Scope = Private
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


#tag EndWindowCode

#tag Events rctSudoku
	#tag Event
		Sub Opening()
		  Me.ExecuteJavaScript(kJavaScriptWrapper.Replace("[CONTROLID]", Me.ControlID))
		  
		End Sub
	#tag EndEvent
#tag EndEvents
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
#tag Events btnRandom
	#tag Event
		Sub Pressed()
		  Self.ActionRandom
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstNumClues
	#tag Event
		Sub Opening()
		  Me.RemoveAllRows
		  
		  Me.AddRow("24")
		  Me.AddRow("28")
		  Me.AddRow("32")
		  Me.AddRow("40")
		  Me.AddRow("48")
		  Me.AddRow("56")
		  Me.AddRow("64")
		  
		  Me.EnsureSelectedRowIndex = 3
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(item As WebMenuItem)
		  #Pragma unused item
		  
		  Self.RefreshControls
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnEmpty
	#tag Event
		Sub Pressed()
		  Self.ActionEmpty
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cnvSudoku
	#tag Event
		Sub Paint(g As WebGraphics)
		  If (Self.SudokuPuzzle = Nil) Then Return
		  
		  Var N As Integer = Self.SudokuPuzzle.GetGridSettings.N
		  Var boxWidth As Integer = Self.SudokuPuzzle.GetGridSettings.BoxWidth
		  Var boxHeight As Integer = Self.SudokuPuzzle.GetGridSettings.BoxHeight
		  
		  If Self.mShowHints And (Self.CellHints.LastIndex >= 0) Then
		    ' Draw next solvable cells
		    g.PenSize = 4
		    For Each h As Sudoku.CellHint In Self.CellHints
		      Select Case h.SolveHint
		      Case Sudoku.SolveHint.NakedSingle
		        g.DrawingColor = colSolveHintNakedSingle
		        g.FillRectangle(kMarginWindow + h.Col * kCellSize, kMarginWindow + h.Row * kCellSize, kCellSize, kCellSize)
		      Case Sudoku.SolveHint.HiddenSingle
		        g.DrawingColor = colSolveHintHiddenSingle
		        g.FillRectangle(kMarginWindow + h.Col * kCellSize, kMarginWindow + h.Row * kCellSize, kCellSize, kCellSize)
		      End Select
		    Next
		  End If
		  
		  ' Draw all thin "hair" lines first (gray)
		  g.DrawingColor = colGridlineHair
		  g.PenSize = 1
		  For i As Integer = 1 To N-1 ' skip outer border (0 and N)
		    ' Horizontal
		    g.DrawLine(kMarginWindow, kMarginWindow + i * kCellSize, kMarginWindow + N * kCellSize, kMarginWindow + i * kCellSize)
		    ' Vertical
		    g.DrawLine(kMarginWindow + i * kCellSize, kMarginWindow, kMarginWindow + i * kCellSize, kMarginWindow + N * kCellSize)
		  Next
		  
		  ' Draw thicker red block lines on top
		  g.DrawingColor = colGridline
		  g.PenSize = 2
		  For rowBlock As Integer = 0 To N Step boxHeight
		    ' Horizontal
		    g.DrawLine(kMarginWindow - g.PenSize/2, kMarginWindow + rowBlock * kCellSize - g.PenSize/2, kMarginWindow + N * kCellSize - g.PenSize/2, kMarginWindow + rowBlock * kCellSize - g.PenSize/2)
		  Next
		  For colBlock As Integer = 0 To N Step boxWidth
		    ' Vertical
		    g.DrawLine(kMarginWindow + colBlock * kCellSize - g.PenSize/2, kMarginWindow - g.PenSize/2, kMarginWindow + colBlock * kCellSize - g.PenSize/2, kMarginWindow + N * kCellSize - g.PenSize/2)
		  Next
		  
		  If Self.mShowCandidates And (Self.CellCandidates.LastIndex >= 0) Then
		    ' Draw Cell Candidates in the margin area outside the TextField
		    ' TextField is centered in cell; candidates go in the outer margin areas
		    
		    ' SudokuNumberField dimensions
		    Var textFieldWidth As Double = Self.SudokuTextFields(0).Width
		    Var textFieldHeight As Double = Self.SudokuTextFields(0).Height
		    
		    ' Calculate margin areas (space between cell border and TextField)
		    Var marginH As Double = (kCellSize - textFieldWidth) / 2   ' left/right margin
		    Var marginV As Double = (kCellSize - textFieldHeight) / 2  ' top/bottom margin
		    
		    ' Candidate slot layout based on N
		    ' Order: top row → left side → right side → bottom row
		    ' Determine layout parameters based on N
		    Var slotsTop As Integer
		    Var slotsLeft As Integer
		    Var slotsRight As Integer
		    Var slotsBottom As Integer
		    
		    ' Layout patterns:
		    '   N=4:  1,2 top; 3,4 bottom
		    '   N=6:  1,2 top; 3 left; 4 right; 5,6 bottom
		    '   N=8:  1,2,3 top; 4 left; 5 right; 6,7,8 bottom
		    '   N=9:  1,2,3,4 top; 5 left; 6 right; 7,8,9 bottom
		    '   N=12: 1,2,3,4 top; 5,6 left; 7,8 right; 9,10,11,12 bottom
		    '   N=16: 1,2,3,4,5 top; 6,7,8 left; 9,10,11 right; 12,13,14,15,16 bottom
		    
		    Select Case N
		    Case 4
		      slotsTop = 2
		      slotsLeft = 0
		      slotsRight = 0
		      slotsBottom = 2
		    Case 6
		      slotsTop = 2
		      slotsLeft = 1
		      slotsRight = 1
		      slotsBottom = 2
		    Case 8
		      slotsTop = 3
		      slotsLeft = 1
		      slotsRight = 1
		      slotsBottom = 3
		    Case 9
		      slotsTop = 4
		      slotsLeft = 1
		      slotsRight = 1
		      slotsBottom = 3
		    Case 12
		      slotsTop = 4
		      slotsLeft = 2
		      slotsRight = 2
		      slotsBottom = 4
		    Case 16
		      slotsTop = 5
		      slotsLeft = 3
		      slotsRight = 3
		      slotsBottom = 5
		    Else
		      ' Fallback for any other N: distribute evenly
		      slotsTop = (N + 3) \ 4
		      slotsBottom = (N + 3) \ 4
		      Var remaining As Integer = N - slotsTop - slotsBottom
		      slotsLeft = (remaining + 1) \ 2
		      slotsRight = remaining - slotsLeft
		    End Select
		    
		    g.FontSize = 8
		    g.PenSize = 1
		    
		    For Each h As Sudoku.CellCandidates In Self.CellCandidates
		      Var cellLeft As Double = kMarginWindow + h.Col * kCellSize
		      Var cellTop As Double = kMarginWindow + h.Row * kCellSize
		      
		      For Each candidate As Sudoku.Candidate In h.Candidates
		        If (candidate.Value < 1) Or (candidate.Value > N) Then Continue
		        If (candidate.Hint = Sudoku.CandidateHint.NoCandidate) Then Continue
		        
		        g.DrawingColor = If(Color.IsDarkMode, Color.LightGray, Color.DarkGray)
		        
		        Var idx As Integer = candidate.Value - 1
		        Var centerX As Double
		        Var centerY As Double
		        
		        ' Determine position based on slot assignment
		        ' Order: top row → left side → right side → bottom row
		        If idx < slotsTop Then
		          ' Top row (candidates 1..slotsTop)
		          Var slotWidth As Double = kCellSize / slotsTop
		          centerX = cellLeft + idx * slotWidth + slotWidth / 2
		          centerY = cellTop + marginV / 2
		        ElseIf idx < slotsTop + slotsLeft Then
		          ' Left side (candidates slotsTop+1..slotsTop+slotsLeft)
		          Var leftIdx As Integer = idx - slotsTop
		          Var slotHeight As Double = textFieldHeight / Max(slotsLeft, 1)
		          centerX = cellLeft + marginH / 2
		          centerY = cellTop + marginV + leftIdx * slotHeight + slotHeight / 2
		        ElseIf idx < slotsTop + slotsLeft + slotsRight Then
		          ' Right side (candidates slotsTop+slotsLeft+1..slotsTop+slotsLeft+slotsRight)
		          Var rightIdx As Integer = idx - slotsTop - slotsLeft
		          Var slotHeight As Double = textFieldHeight / Max(slotsRight, 1)
		          centerX = cellLeft + kCellSize - marginH / 2
		          centerY = cellTop + marginV + rightIdx * slotHeight + slotHeight / 2
		        Else
		          ' Bottom row (remaining candidates)
		          Var bottomIdx As Integer = idx - slotsTop - slotsLeft - slotsRight
		          Var slotWidth As Double = kCellSize / slotsBottom
		          centerX = cellLeft + bottomIdx * slotWidth + slotWidth / 2
		          centerY = cellTop + kCellSize - marginV / 2
		        End If
		        
		        ' WebGraphics.DrawText with TextAlignment.Center uses x as center point
		        ' and y as the vertical center (not baseline like Desktop),
		        ' However, WebGraphics seems to vertically center text differently,
		        ' that's why we adjust it here manually with "+2" just for drawing text,
		        ' but keep the variable for further placement caluclations
		        g.TextAlignment = TextAlignments.Center
		        g.DrawText(candidate.Value.ToString, centerX, centerY+2)
		        
		        ' Mark excluded candidates with a strike-through line
		        Var crossSize As Double = 8
		        
		        Select Case candidate.Hint
		        Case Sudoku.CandidateHint.NoCandidate
		          Continue ' not a candidate
		        Case Sudoku.CandidateHint.Candidate
		          Continue ' just display candidate
		        Case Sudoku.CandidateHint.ExcludedAsLockedCandidate
		          g.DrawingColor = Color.Red
		        Case Sudoku.CandidateHint.ExcludedAsNakedSubset
		          g.DrawingColor = Color.Orange
		        Case Sudoku.CandidateHint.ExcludedAsHiddenSubset
		          g.DrawingColor = Color.Orange
		        Case Sudoku.CandidateHint.ExcludedAsXWing
		          g.DrawingColor = Color.Yellow
		        Else
		          Continue
		        End Select
		        
		        Var crossCenterY As Double = centerY
		        g.PenSize = 1.0
		        g.DrawLine(centerX - crossSize*0.25, crossCenterY + crossSize*0.25, centerX + crossSize*0.25, crossCenterY - crossSize*0.25)
		      Next
		    Next
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Shown()
		  Var N As Integer = Self.SudokuPuzzle.GetGridSettings.N
		  Me.Width = 2 * kMarginWindow + N * kCellSize
		  Me.Height = 2 * kMarginWindow + N * kCellSize
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
#tag Events Controller
	#tag Event
		Sub Opening()
		  // TODO: This method is still hardcoded for a 3x3 Sudoku
		  // Needs to be changed to use Self.SudokuPuzzle.GetGridSettings (N, BoxWidth, BoxHeight)
		  // Note: Also needs to be updated when changing Sudoku Puzzle with different N
		  Var N As Integer = 9
		  If (Self.SudokuPuzzle <> Nil) Then N = Self.SudokuPuzzle.GetGridSettings.N
		  
		  Me.Size = N
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

#tag WebPage
Begin WebPage MainWebPage
   AllowTabOrderWrap=   True
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   CSSClasses      =   ""
   Enabled         =   False
   Height          =   710
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
   MinimumHeight   =   710
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
      Height          =   710
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
      TabIndex        =   19
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
         Height          =   38
         Index           =   -2147483648
         Indicator       =   0
         InitialParent   =   "rctSudoku"
         Italic          =   False
         Left            =   605
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
         Text            =   "..."
         TextAlignment   =   2
         TextColor       =   &c000000FF
         Tooltip         =   ""
         Top             =   612
         Underline       =   False
         Visible         =   True
         Width           =   210
         _mPanelIndex    =   -1
      End
      Begin WebLabel labStatusTitle
         Bold            =   False
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         FontName        =   ""
         FontSize        =   12.0
         Height          =   20
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
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "#kLabelSudokuStatus"
         TextAlignment   =   2
         TextColor       =   &c000000FF
         Tooltip         =   ""
         Top             =   584
         Underline       =   False
         Visible         =   True
         Width           =   180
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
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   516
         Visible         =   True
         Width           =   180
         _mPanelIndex    =   -1
      End
      Begin SudokuCheckbox chkShowCandidates
         Caption         =   "#kSudokuShowCandidates"
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         Height          =   34
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
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   435
         Value           =   False
         Visible         =   True
         Width           =   180
         _mPanelIndex    =   -1
      End
      Begin SudokuCheckbox chkShowHints
         Caption         =   "#kSudokuShowHints"
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         Height          =   34
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
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   400
         Value           =   False
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
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "#kLabelShow"
         TextAlignment   =   0
         TextColor       =   &c000000FF
         Tooltip         =   ""
         Top             =   370
         Underline       =   False
         Visible         =   True
         Width           =   180
         _mPanelIndex    =   -1
      End
      Begin WebButton btnLock
         AllowAutoDisable=   False
         Cancel          =   False
         Caption         =   "#kSudokuLock"
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
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   308
         Visible         =   True
         Width           =   180
         _mPanelIndex    =   -1
      End
      Begin WebButton btnRandom
         AllowAutoDisable=   False
         Cancel          =   False
         Caption         =   "#kSudokuRandom"
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
         TabIndex        =   7
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   230
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
         TabIndex        =   8
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "#kLabelNumClues"
         TextAlignment   =   0
         TextColor       =   &c000000FF
         Tooltip         =   ""
         Top             =   184
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
         TabIndex        =   9
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   184
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
         TabIndex        =   11
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
         TabIndex        =   12
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "#kLabelExport"
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
         TabIndex        =   13
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   "#SudokuTool.kURL_Paypal"
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
         TabIndex        =   14
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "#Translations.kLabelContact"
         TextAlignment   =   1
         TextColor       =   colAppLabel
         Tooltip         =   "#SudokuTool.kEmail_Contact"
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
         TabIndex        =   15
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
         TabIndex        =   16
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "AppVersion"
         TextAlignment   =   0
         TextColor       =   &c000000FF
         Tooltip         =   ""
         Top             =   52
         Underline       =   False
         Visible         =   True
         Width           =   100
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
         TabIndex        =   17
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Sudoku"
         TextAlignment   =   0
         TextColor       =   colAppLabel
         Tooltip         =   "#SudokuTool.kURL_Repository"
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
         TabIndex        =   18
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   "#SudokuTool.kURL_Repository"
         Top             =   20
         URL             =   ""
         Visible         =   True
         Width           =   64
         _mPanelIndex    =   -1
         _ProtectImage   =   False
      End
   End
   Begin SudokuCallback cbSudokuTextFields
      ControlID       =   ""
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      PanelIndex      =   0
      Scope           =   2
      _mPanelIndex    =   -1
   End
End
#tag EndWebPage

#tag WindowCode
	#tag Event
		Sub Opening()
		  Me.Sudoku = New SudokuTool
		  Self.SudokuNumberFieldsInit
		  
		  If (Not Self.CookieGet) Then
		    Self.ActionRandom
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
		  Me.Sudoku.ClearGrid
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
		  ' Dismiss Popover
		  If (obj <> Nil) Then obj.Close
		  
		  ' Export Json
		  Var jsonApplication As New JSONItem
		  jsonApplication.Value(kJSONKeyApplicationName) = "Sudoku"
		  jsonApplication.Value(kJSONKeyApplicationVersion) = labAppVersion.Text.Trim
		  jsonApplication.Value(kJSONKeyApplicationUrl) = SudokuTool.kURL_Repository
		  
		  Var json As JSONItem = Me.Sudoku.ToJson(jsonApplication)
		  
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
		  ' Dismiss Popover
		  If (obj <> Nil) Then obj.Close
		  
		  ' Setup PDF
		  Var pdf As New PDFDocument(PDFDocument.PageSizes.A4)
		  Var g As Graphics = pdf.Graphics
		  
		  ' PDF MetaData
		  pdf.Title = "Sudoku"
		  pdf.Subject = "Sudoku"
		  pdf.Author = SudokuTool.kURL_Repository
		  pdf.Creator = "Sudoku " + labAppVersion.Text + " (Xojo " + XojoVersionString + ")"
		  pdf.Keywords = "Sudoku"
		  
		  ' Draw Sudoku
		  Me.Sudoku.DrawInto(g)
		  
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
		  ' Dismiss Popover
		  If (obj <> Nil) Then obj.Close
		  
		  ' Export Txt
		  Var txt As String = Me.Sudoku.ToString
		  
		  ' Save Json and Download
		  Var prepareDownload As New WebFile
		  prepareDownload.MimeType = "application/json"
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
		  ' Lock current state
		  For row As Integer = 0 To SudokuTool.N-1
		    For col As Integer = 0 To SudokuTool.N-1
		      Var index As Integer = row * SudokuTool.N + col
		      Var value As Integer = Me.Sudoku.GetGridCell(row, col)
		      
		      If (value > 0) Then
		        SudokuTextFields(index).Lock = (value > 0)
		        Me.Sudoku.SetGridCellLocked(row, col)
		      End If
		    Next
		  Next
		  
		  Me.RefreshControls
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ActionRandom()
		  Var numClues As Integer = lstNumClues.SelectedRowText.ToInteger
		  Call Me.Sudoku.GenerateRandomPuzzle(numClues)
		  Me.ShowSudoku
		  Me.ActionLock
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ActionSolve()
		  ' Sanity Check
		  If (Not Me.Sudoku.IsSolvable) Then Return
		  
		  ' Solve and Show
		  Call Me.Sudoku.Solve
		  Me.ShowSudoku
		  Me.ActionLock
		  
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
		        Var sudoku As New SudokuTool(sudokuString)
		        If (sudoku <> Nil) Then
		          
		          If json.HasKey(kJSONKeySudokuLockedCellIndexes) Then
		            Var jsonLockedCellIndexes As Variant = json.Value(kJSONKeySudokuLockedCellIndexes)
		            If (jsonLockedCellIndexes IsA JSONItem) And JsonItem(jsonLockedCellIndexes).IsArray Then
		              
		              For i As Integer = 0 To JsonItem(jsonLockedCellIndexes).LastRowIndex
		                Var lockIndex As Integer = JsonItem(jsonLockedCellIndexes).ValueAt(i).IntegerValue
		                If (lockIndex < 0) Or (lockIndex > Me.SudokuTextFields.LastIndex) Then Continue
		                Me.SudokuTextFields(lockIndex).Lock = True
		                sudoku.SetGridCellLocked(lockIndex)
		              Next
		            End If
		          End If
		          
		          Me.Sudoku = sudoku
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
		  
		  Var randomNumClues As Integer = lstNumClues.SelectedRowText.ToInteger
		  If (randomNumClues > 0) Then
		    json.Value(kJSONKeyRandomNumClues) = randomNumClues
		  End If
		  
		  If (Me.Sudoku <> Nil) Then
		    json.Value(kJSONKeySudoku) = Me.Sudoku.ToString
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
		  For row As Integer = 0 To SudokuTool.N-1
		    For col As Integer = 0 To SudokuTool.N-1
		      Var index As Integer = row * SudokuTool.N + col
		      
		      If (Not SudokuTextFields(index).IsLocked) Then Continue
		      If (Me.Sudoku.GetGridCell(row, col) < 1) Then Continue 'Is empty
		      
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
		  For row As Integer = 0 To SudokuTool.N-1
		    For col As Integer = 0 To SudokuTool.N-1
		      Var index As Integer = row * SudokuTool.N + col
		      
		      If SudokuTextFields(index).IsLocked Then Continue
		      If (Me.Sudoku.GetGridCell(row, col) < 1) Then Continue 'Is empty
		      
		      ' Found a non-empty, unlocked cell
		      Return True
		    Next
		  Next
		  
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RefreshControls()
		  Var isEmpty As Boolean = Me.Sudoku.IsEmpty
		  Var isValid As Boolean = isEmpty Or Me.Sudoku.IsValid(SudokuTool.ValidCheck.BasicSudokuRules)
		  Var isSolvable As Boolean = isEmpty Or (isValid And Me.Sudoku.IsSolvable)
		  Var isSolved As Boolean = (Not isEmpty) And Me.Sudoku.IsSolved
		  
		  If mShowHints And (Not isEmpty) And isValid And isSolvable And (Not isSolved) Then
		    Me.SolveCellHints = Me.Sudoku.GetSolveCellHints
		  Else
		    Redim SolveCellHints(-1)
		  End If
		  
		  If mShowCandidates And (Not isEmpty) And isValid And isSolvable And (Not isSolved) Then
		    Me.SolveCellCandidates = Me.Sudoku.GetSolveCellCandidates
		  Else
		    Redim SolveCellCandidates(-1)
		  End If
		  
		  ' Controls
		  btnLock.Enabled = (Not isEmpty) And isValid And isSolvable And Me.HasUnlockedCells
		  btnEmpty.Enabled = (Not isEmpty)
		  btnSolve.Enabled = (Not isEmpty) And isValid And isSolvable And (Not isSolved) And Me.Sudoku.SolveEnabled
		  
		  ' Show
		  chkShowHints.EnsureValue = mShowHints
		  chkShowCandidates.EnsureValue = mShowCandidates
		  
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
		  For row As Integer = 0 To SudokuTool.N-1
		    For col As Integer = 0 To SudokuTool.N-1
		      Var index As Integer = row * SudokuTool.N + col
		      
		      SudokuTextFields(index).Lock = False
		      
		      Var value As Integer = Me.Sudoku.GetGridCell(row, col)
		      If value = 0 Then
		        SudokuTextFields(index).Text = ""
		        If (focusIndex < 0) Then focusIndex = index
		      Else
		        SudokuTextFields(index).Text = value.ToString
		        SudokuTextFields(index).Lock = Me.Sudoku.IsGridCellLocked(row, col)
		      End If
		    Next
		  Next
		  
		  ' Focus into first empty field
		  If (focusIndex < 0) Then
		    self.SetFocus 'move Focus out of TextFields
		  Else
		    SudokuTextFields(focusIndex).SetFocus
		  End If
		  
		  Me.RefreshControls
		  
		  mIsShowingSudoku = False
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SudokuNumberFieldsInit()
		  Redim SudokuTextFields(SudokuTool.N*SudokuTool.N-1)
		  
		  For row As Integer = 0 To SudokuTool.N-1
		    For col As Integer = 0 To SudokuTool.N-1
		      Var index As Integer = row * SudokuTool.N + col
		      
		      Dim t As New SudokuNumberField
		      
		      SudokuTextFields(index) = t
		      
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
		      
		      AddHandler t.TextChanged, AddressOf SudokuNumberFieldTextChanged
		      
		      rctSudoku.AddControl(t)
		    Next
		  Next
		  
		  
		  ' Hookup Callback for Arrow Keys
		  Var js As String = _
		  "var fields = [];" + EndOfLine
		  
		  For i As Integer = 0 To Self.SudokuTextFields.LastIndex
		    js = js + _
		    "fields[" + i.ToString + "] = '" + SudokuTextFields(i).ControlID + "';" + EndOfLine
		  Next i
		  
		  js = js + _
		  "for (let i = 0; i < fields.length; i++) {" + EndOfLine + _
		  "  let tf = document.getElementById(fields[i]);" + EndOfLine + _
		  "  if (!tf) continue;" + EndOfLine + _
		  "  tf.addEventListener('keydown', function(e) {" + EndOfLine + _
		  "    XojoWeb.getNamedControl('" + Self.cbSudokuTextFields.ControlID + "').arrowKeyPressed(i,e.key);"  + EndOfLine + _
		  "  });" + EndOfLine + _
		  "}"
		  
		  ExecuteJavaScript(js)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SudokuNumberFieldTextChanged(sender As SudokuNumberField)
		  If mIsShowingSudoku Then Return
		  
		  If sender.IsLocked Then
		    ' Make sure original grid value is not being overwritten
		    ' we don't set .Readonly to get arrow navigation
		    Var gridVal As String = Me.Sudoku.GetGridCell(sender.RowIndex, sender.ColumnIndex).ToString
		    If (gridVal = "0") Then gridVal = ""
		    If (sender.Text <> gridVal) Then sender.Text = gridVal
		    Return
		  End If
		  
		  ' Update Number if necessary
		  Var currentNumber As Integer = sender.Text.ToInteger
		  
		  If (currentNumber < 1) And (sender.Text <> "") Then
		    sender.Text = ""
		  End If
		  
		  If (Me.Sudoku.GetGridCell(sender.RowIndex, sender.ColumnIndex) = currentNumber) Then Return
		  
		  Me.Sudoku.SetGridCell(sender.RowIndex, sender.ColumnIndex) = currentNumber
		  
		  ' Update Status
		  Me.RefreshControls
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Download As WebFile
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
		Private SolveCellCandidates() As SudokuTool.SolveCellCandidate
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SolveCellHints() As SudokuTool.SolveCellHint
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Sudoku As SudokuTool
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

	#tag Constant, Name = kJSONKeyApplicationName, Type = String, Dynamic = False, Default = \"name", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kJSONKeyApplicationUrl, Type = String, Dynamic = False, Default = \"url", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kJSONKeyApplicationVersion, Type = String, Dynamic = False, Default = \"version", Scope = Private
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
		  If Self.mShowHints And (Self.SolveCellHints.LastIndex >= 0) Then
		    ' Draw next solvable cells
		    g.PenSize = 4
		    For Each h As SudokuTool.SolveCellHint In Self.SolveCellHints
		      Select Case h.SolveHint
		      Case SudokuTool.SolveHint.NakedSingle
		        g.DrawingColor = colSolveHintNakedSingle
		        g.FillRectangle(kMarginWindow + h.Col * kCellSize, kMarginWindow + h.Row * kCellSize, kCellSize, kCellSize)
		      Case SudokuTool.SolveHint.HiddenSingle
		        g.DrawingColor = colSolveHintHiddenSingle
		        g.FillRectangle(kMarginWindow + h.Col * kCellSize, kMarginWindow + h.Row * kCellSize, kCellSize, kCellSize)
		      End Select
		    Next
		  End If
		  
		  ' Draw all thin "hair" lines first (gray)
		  g.DrawingColor = colGridlineHair
		  g.PenSize = 1
		  For i As Integer = 1 To SudokuTool.N-1 ' skip outer border (0 and N)
		    ' Horizontal
		    g.DrawLine(kMarginWindow, kMarginWindow + i * kCellSize, kMarginWindow + SudokuTool.N * kCellSize, kMarginWindow + i * kCellSize)
		    ' Vertical
		    g.DrawLine(kMarginWindow + i * kCellSize, kMarginWindow, kMarginWindow + i * kCellSize, kMarginWindow + SudokuTool.N * kCellSize)
		  Next
		  
		  ' Draw thicker red 3x3 block lines on top
		  g.DrawingColor = colGridline
		  g.PenSize = 2
		  For i As Integer = 0 To SudokuTool.N Step 3
		    ' Horizontal
		    g.DrawLine(kMarginWindow - g.PenSize/2, kMarginWindow + i * kCellSize - g.PenSize/2, kMarginWindow + SudokuTool.N * kCellSize - g.PenSize/2, kMarginWindow + i * kCellSize - g.PenSize/2)
		    ' Vertical
		    g.DrawLine(kMarginWindow + i * kCellSize - g.PenSize/2, kMarginWindow - g.PenSize/2, kMarginWindow + i * kCellSize - g.PenSize/2, kMarginWindow + SudokuTool.N * kCellSize - g.PenSize/2)
		  Next
		  
		  g.DrawingColor = If(Color.IsDarkMode, Color.LightGray, Color.DarkGray)
		  g.FontSize = 8
		  
		  If Self.mShowCandidates And (Self.SolveCellCandidates.LastIndex >= 0) Then
		    ' Draw Cell Candidates
		    g.TextAlignment = TextAlignments.Center
		    Var hintRowSize As Double = (kCellSize - Self.SudokuTextFields(0).Height) / 2
		    Var adjustY As Double = (hintRowSize/2) + 3
		    
		    For Each h As SudokuTool.SolveCellCandidate In Self.SolveCellCandidates
		      For Each candidate As Int8 In h.Candidates
		        If (candidate < 1) Or (candidate > SudokuTool.N) Then Continue
		        
		        Select Case candidate
		        Case Is <= 4
		          Var adjustX As Double = (kCellSize/4) /2
		          g.DrawText(candidate.ToString, kMarginWindow + h.Col * kCellSize + ((candidate-1) * (kCellSize/4)) + adjustX, kMarginWindow + h.Row * kCellSize + adjustY)
		        Case 5
		          Var adjustX As Double = hintRowSize /2
		          g.DrawText(candidate.ToString, kMarginWindow + h.Col * kCellSize + adjustX, kMarginWindow + h.Row * kCellSize + (kCellSize/2 - hintRowSize/2) + adjustY)
		        Case 6
		          Var adjustX As Double = hintRowSize /2
		          g.DrawText(candidate.ToString, kMarginWindow + h.Col * kCellSize + (kCellSize - hintRowSize) + adjustX, kMarginWindow + h.Row * kCellSize + (kCellSize/2 - hintRowSize/2) + adjustY)
		        Case Is >= 7
		          Var adjustX As Double = (kCellSize/3) /2
		          g.DrawText(candidate.ToString, kMarginWindow + h.Col * kCellSize + ((candidate-7) * (kCellSize/3)) + adjustX, kMarginWindow + h.Row * kCellSize + (kCellSize - hintRowSize) + adjustY - 1)
		        End Select
		      Next
		    Next
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Shown()
		  Me.Width = 2 * kMarginWindow + 9 * kCellSize
		  me.Height = 2 * kMarginWindow + 9 * kCellSize
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
		  
		  Session.GoToURL(SudokuTool.kURL_Paypal)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events labContact
	#tag Event
		Sub Pressed()
		  Session.GoToURL("mailto:" + SudokuTool.kEmail_Contact)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events labAppVersion
	#tag Event
		Sub Opening()
		  If (App.Version <> "") Then
		    Me.Text = App.Version
		    Return
		  End If
		  
		  Me.Text = App.MajorVersion.ToString + "." + App.MinorVersion.ToString + "." + App.BugVersion.ToString
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events labAppName
	#tag Event
		Sub Pressed()
		  Session.GoToURL(SudokuTool.kURL_Repository)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events imgAppIcon
	#tag Event
		Sub Pressed(x As Integer, y As Integer)
		  #Pragma Unused x
		  #Pragma Unused y
		  
		  Session.GoToURL(SudokuTool.kURL_Repository)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cbSudokuTextFields
	#tag Event
		Sub ArrowKeyPressed(index As Integer, arrowKey As String)
		  Select Case arrowKey
		    
		  Case "ArrowLeft"
		    index = index - 1
		    If (index < 0) Then Return
		    SudokuTextFields(index).SetFocus
		    Return
		    
		  Case "ArrowRight"
		    index = index + 1
		    If (index > SudokuTool.N*SudokuTool.N - 1) Then Return
		    SudokuTextFields(index).SetFocus
		    Return
		    
		  Case "ArrowUp"
		    index = index - SudokuTool.N
		    If (index < 0) Then Return
		    SudokuTextFields(index).SetFocus
		    Return
		    
		  Case "ArrowDown"
		    index = index + SudokuTool.N
		    If (index > SudokuTool.N*SudokuTool.N - 1) Then Return
		    SudokuTextFields(index).SetFocus
		    Return
		    
		  End Select
		  
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

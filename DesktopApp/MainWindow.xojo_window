#tag DesktopWindow
Begin DesktopWindow MainWindow
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composite       =   False
   DefaultLocation =   2
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   False
   HasMinimizeButton=   True
   HasTitleBar     =   True
   Height          =   555
   ImplicitInstance=   False
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   1342697471
   MenuBarVisible  =   False
   MinimumHeight   =   555
   MinimumWidth    =   400
   Resizeable      =   False
   Title           =   "Sudoku"
   Type            =   0
   Visible         =   True
   Width           =   600
   Begin SudokuButton btnSolve
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "#App.kSudokuSolve"
      Default         =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   420
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   2
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   445
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   160
   End
   Begin DesktopLabel labStatusTitle
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   420
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#Translations.kLabelSudokuStatus"
      TextAlignment   =   2
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   483
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   160
   End
   Begin DesktopLabel labStatus
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   420
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "..."
      TextAlignment   =   2
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   515
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   160
   End
   Begin SudokuButton btnLock
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "#App.kSudokuLock"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   420
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   2
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   180
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   160
   End
   Begin DesktopCanvas cnvAppIcon
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   64
      Index           =   -2147483648
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "#Sudoku.kURL_Repository"
      Top             =   20
      Transparent     =   False
      Visible         =   True
      Width           =   64
   End
   Begin DesktopLabel labAppName
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   30
      Index           =   -2147483648
      Italic          =   False
      Left            =   108
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Sudoku"
      TextAlignment   =   0
      TextColor       =   &c0072D800
      Tooltip         =   "#Sudoku.kURL_Repository"
      Top             =   20
      Transparent     =   False
      Underline       =   True
      Visible         =   True
      Width           =   180
   End
   Begin DesktopLabel labThanks
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   30
      Index           =   -2147483648
      Italic          =   False
      Left            =   350
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#Translations.kLabelThanks"
      TextAlignment   =   3
      TextColor       =   &c66666600
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   230
   End
   Begin DesktopLabel labAppVersion
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   30
      Index           =   -2147483648
      Italic          =   False
      Left            =   108
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "AppVersion"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   54
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   180
   End
   Begin DesktopLabel labContact
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   30
      Index           =   -2147483648
      Italic          =   False
      Left            =   395
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#Translations.kLabelContact"
      TextAlignment   =   1
      TextColor       =   &c0072CE00
      Tooltip         =   "#Sudoku.kEmail_Contact"
      Top             =   54
      Transparent     =   False
      Underline       =   True
      Visible         =   True
      Width           =   70
   End
   Begin DesktopCanvas cnvPayPal
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   30
      Index           =   -2147483648
      Left            =   474
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "#Sudoku.kURL_PayPal"
      Top             =   54
      Transparent     =   False
      Visible         =   True
      Width           =   106
   End
   Begin DesktopSeparator sepTop
      Active          =   False
      AllowAutoDeactivate=   True
      AllowTabStop    =   True
      Enabled         =   True
      Height          =   3
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   6
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   100
      Transparent     =   False
      Visible         =   True
      Width           =   600
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin SudokuCheckbox chkShowHints
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "#App.kSudokuShowHints"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   420
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   250
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   1
      Width           =   120
   End
   Begin SudokuCheckbox chkShowCandidates
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "#App.kSudokuShowCandidates"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   420
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   275
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   1
      Width           =   120
   End
   Begin SudokuLabel labShow
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   420
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#Translations.kLabelShow"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   225
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
   End
   Begin SudokuLabel labExclusion
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   420
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#Translations.kLabelExclusion"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   305
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
   End
   Begin SudokuCheckbox chkExcludeLockedCandidates
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Locked Candidates"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   420
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   330
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   170
   End
   Begin SudokuCheckbox chkExcludeNakedSubsets
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Naked Subsets"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   420
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   355
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   170
   End
   Begin SudokuCheckbox chkExcludeXWing
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "X-Wing"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   420
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   405
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   170
   End
   Begin SudokuCheckbox chkExcludeHiddenSubsets
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Hidden Subsets"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   420
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   380
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   170
   End
   Begin SudokuButton btnNew
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "#App.kSudokuNew"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   420
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   2
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   120
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   160
   End
   Begin SudokuCanvas cnvSudoku
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowFocusRing  =   False
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   380
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   120
      Transparent     =   False
      Visible         =   True
      Width           =   380
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Closing()
		  Me.DocumentClose
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DropObject(obj As DragItem, action As DragItem.Types)
		  #Pragma unused action
		  
		  If (obj <> Nil) And (obj.FolderItem <> Nil) And (Not obj.FolderItem.IsFolder) And obj.FolderItem.Exists Then
		    Me.ActionOpen(obj.FolderItem)
		  End If
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  Me.AcceptFileDrop(SudokuFileTypeGroup.Sudoku)
		  
		  Me.DocumentInit
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileExportPDF() As Boolean Handles FileExportPDF.Action
		  Self.ActionExportPDF
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileOpen() As Boolean Handles FileOpen.Action
		  Self.ActionOpen(Nil)
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FilePrint() As Boolean Handles FilePrint.Action
		  Self.ActionPrint
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileSaveAs() As Boolean Handles FileSaveAs.Action
		  Self.ActionSave
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SudokuExclusionHiddenSubsets() As Boolean Handles SudokuExclusionHiddenSubsets.Action
		  Self.mExclusionParams.ExcludeHiddenSubsets = (Not Self.mExclusionParams.ExcludeHiddenSubsets)
		  Self.RefreshControls
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SudokuExclusionLockedCandidates() As Boolean Handles SudokuExclusionLockedCandidates.Action
		  Self.mExclusionParams.ExcludeLockedCandidates = (Not Self.mExclusionParams.ExcludeLockedCandidates)
		  Self.RefreshControls
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SudokuExclusionNakedSubsets() As Boolean Handles SudokuExclusionNakedSubsets.Action
		  Self.mExclusionParams.ExcludeNakedSubsets = (Not Self.mExclusionParams.ExcludeNakedSubsets)
		  Self.RefreshControls
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SudokuExclusionXWing() As Boolean Handles SudokuExclusionXWing.Action
		  Self.mExclusionParams.ExcludeXWing = (Not Self.mExclusionParams.ExcludeXWing)
		  Self.RefreshControls
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SudokuLock() As Boolean Handles SudokuLock.Action
		  Self.ActionLock
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SudokuNew() As Boolean Handles SudokuNew.Action
		  Self.ActionNew
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SudokuShowCandidates() As Boolean Handles SudokuShowCandidates.Action
		  Self.mShowCandidates = (Not Self.mShowCandidates)
		  Self.RefreshControls
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SudokuShowHints() As Boolean Handles SudokuShowHints.Action
		  Self.mShowHints = (Not Self.mShowHints)
		  Self.RefreshControls
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SudokuSolve() As Boolean Handles SudokuSolve.Action
		  Self.ActionSolve
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h21
		Private Sub ActionEmpty()
		  Me.SudokuPuzzle.ClearGrid
		  Me.ShowSudoku
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ActionExportPDF()
		  ' Show Save File Dialog
		  Var filterPDF As New FileType
		  filterPDF.Name = "PDF"
		  filterPDF.Extensions = ".pdf"
		  
		  Var dlg As New SaveFileDialog
		  dlg.ActionButtonCaption = kSaveDialogExport
		  dlg.CancelButtonCaption = kSaveDialogCancel
		  dlg.SuggestedFileName = "Sudoku.pdf"
		  dlg.Title = "Sudoku"
		  dlg.PromptText = kSaveDialogPrompt
		  dlg.Filter = filterPDF
		  dlg.InitialFolder = SpecialFolder.Desktop
		  
		  Var f As FolderItem = dlg.ShowModal(Self)
		  If (f = Nil) Then Return
		  
		  ' Try to detect Paper Format (from default PrinterSetup)
		  Var pdfPaperSize As PDFDocument.PageSizes = PDFDocument.PageSizes.A4
		  
		  Try
		    Var ps As New PrinterSetup
		    
		    Var detectPdfPaperSizes() As PDFDocument.PageSizes
		    detectPdfPaperSizes.Add(PDFDocument.PageSizes.A4)
		    detectPdfPaperSizes.Add(PDFDocument.PageSizes.Letter)
		    detectPdfPaperSizes.Add(PDFDocument.PageSizes.Legal)
		    
		    For Each testPaperSize As PDFDocument.PageSizes In detectPdfPaperSizes
		      Var testPdf As New PDFDocument(testPaperSize)
		      If (testPdf.PageHeight = ps.PageHeight) And (testPdf.PageWidth = ps.PageWidth) Then
		        pdfPaperSize = testPaperSize
		        Exit 'Loop
		      End If
		    Next
		  Catch err As RuntimeException
		    'ignore
		  End Try
		  
		  ' Setup PDF
		  Var pdf As New PDFDocument(pdfPaperSize)
		  Var g As Graphics = pdf.Graphics
		  
		  ' PDF MetaData
		  pdf.Title = "Sudoku"
		  pdf.Subject = "Sudoku"
		  pdf.Author = Sudoku.kURL_Repository
		  pdf.Creator = "Sudoku " + labAppVersion.Text + " (Xojo " + XojoVersionString + ")"
		  pdf.Keywords = "Sudoku"
		  
		  ' Draw Sudoku
		  Me.SudokuPuzzle.DrawInto(g, True)
		  
		  ' Save PDF
		  pdf.Save(f)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ActionLock()
		  ' Lock current state
		  Var N As Integer = Me.SudokuPuzzle.GetGridSettings.N
		  For row As Integer = 0 To N-1
		    For col As Integer = 0 To N-1
		      Var value As Integer = Me.SudokuPuzzle.GetGridValue(row, col)
		      
		      If (value > 0) Then
		        Me.SudokuPuzzle.SetGridCellLocked(row, col)
		      End If
		    Next
		  Next
		  
		  cnvSudoku.Refresh(False)
		  Me.RefreshControls
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ActionNew()
		  Var w As New SudokuNew(Me.SudokuPuzzle.GetGridSettings.N, mCluesFactor)
		  
		  AddHandler w.ActionNew, AddressOf ActionNewExecute
		  AddHandler w.ActionCancel, AddressOf ActionNewCancel
		  
		  w.ShowModal(Self)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ActionNewCancel(sender As SudokuNew)
		  ' Close Dialog
		  RemoveHandler sender.ActionNew, AddressOf ActionNewExecute
		  RemoveHandler sender.ActionCancel, AddressOf ActionNewCancel
		  sender.Close
		  
		  cnvSudoku.SetFocus
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ActionNewExecute(sender As SudokuNew, newN As Integer, newCluesFactor As Double, newSudokuPuzzle As Sudoku.Puzzle)
		  #Pragma unused newN
		  
		  ' Close Dialog
		  RemoveHandler sender.ActionNew, WeakAddressOf ActionNewExecute
		  sender.Close
		  
		  ' Load new Sudoku Puzzle
		  If (newSudokuPuzzle = Nil) Then Return
		  
		  mCluesFactor = newCluesFactor
		  me.SudokuPuzzle = newSudokuPuzzle
		  Me.ShowSudoku
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ActionOpen(f As FolderItem)
		  Try
		    If (f = Nil) Then
		      f = FolderItem.ShowOpenFileDialog(SudokuFileTypeGroup.Sudoku)
		    End If
		    
		    If (f = Nil) Then Return
		    
		    Var newSudokuPuzzle As Sudoku.Puzzle = Sudoku.LoadFrom(f)
		    
		    If (newSudokuPuzzle <> Nil) Then
		      Me.SudokuPuzzle = newSudokuPuzzle
		      Me.ShowSudoku
		    Else
		      Me.SudokuPuzzle.ClearGrid
		      Me.ShowSudoku
		    End If
		    
		  Catch e As IOException
		    MessageBox e.Message + " (" + e.ErrorNumber.ToString + ")"
		    
		  End Try
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ActionPrint()
		  ' Setup Printing
		  Var ps As New PrinterSetup
		  ps.Landscape = False
		  Var g As Graphics = ps.ShowPrinterDialog(Self)
		  If (g = Nil) Then Return
		  
		  ' Draw Sudoku
		  Me.SudokuPuzzle.DrawInto(g, True)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ActionRandom(n As Integer, numClues As Integer)
		  Me.SudokuPuzzle = New Sudoku.Puzzle(n)
		  Call Me.SudokuPuzzle.GenerateRandomPuzzle(numClues)
		  Me.ShowSudoku
		  Me.ActionLock
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ActionSave()
		  Try
		    Var suggestedFilename As String = "Sudoku " + DateTime.now.SQLDateTime.ReplaceAll(":", "-") + ".sudoku"
		    Var f As FolderItem = FolderItem.ShowSaveFileDialog(SudokuFileTypeGroup.Sudoku, suggestedFilename)
		    If (f = Nil) Then Return
		    
		    Call Me.SudokuPuzzle.SaveTo(f, App.GetJsonApplication)
		    
		  Catch e As IOException
		    MessageBox e.Message + " (" + e.ErrorNumber.ToString + ")"
		    
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ActionSolve()
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
		Private Sub DocumentClose()
		  Try
		    Var f As FolderItem = GetUsersCurrentSudokuStateFile(True)
		    If (f <> Nil) Then
		      Call Me.SudokuPuzzle.SaveTo(f, App.GetJsonApplication)
		    End If
		    
		  Catch err As IOException
		    'Silently ignore
		    
		  End Try
		  
		  Try
		    Var f As FolderItem = GetUsersCurrentSettingsFile(True)
		    If (f <> Nil) Then
		      Var json As New JSONItem
		      json.Value(Sudoku.kJSONKeyApplication) = App.GetJsonApplication
		      json.Value(kJSONKeyShowHints) = mShowHints
		      json.Value(kJSONKeyShowCandidates) = mShowCandidates
		      json.Value(kJSONKeyExcludeLockedCandidates) = mExclusionParams.ExcludeLockedCandidates
		      json.Value(kJSONKeyExcludeNakedSubsets) = mExclusionParams.ExcludeNakedSubsets
		      json.Value(kJSONKeyExcludeHiddenSubsets) = mExclusionParams.ExcludeHiddenSubsets
		      json.Value(kJSONKeyExcludeXWing) = mExclusionParams.ExcludeXWing
		      
		      json.Value(kJSONKeyCluesFactor1000) = CType(Ceiling(mCluesFactor * 1000), Integer)
		      
		      Var jsonOptions As New JSONOptions
		      jsonOptions.Compact = False
		      
		      Var t As TextOutputStream = TextOutputStream.Create(f)
		      t.Encoding = Encodings.UTF8
		      t.Delimiter = EndOfLine.UNIX
		      t.Write(json.ToString(jsonOptions))
		      t.Close
		    End If
		    
		  Catch err As IOException
		    'Silently ignore
		    
		  End Try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DocumentInit()
		  #Pragma BreakOnExceptions Off
		  
		  Try
		    
		    Var f As folderitem = GetUsersCurrentSettingsFile(False)
		    If (f = Nil) Then
		      ' Silently ignore
		      Return
		    End If
		    
		    Var t As TextInputStream = TextInputStream.Open(f)
		    t.Encoding = Encodings.UTF8
		    Var fileContent As String = t.ReadAll
		    t.Close
		    
		    fileContent = fileContent.Trim
		    If (fileContent = "") Then
		      ' Silently ignore
		      Return
		    End If
		    
		    Var json As New JSONItem(fileContent)
		    
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
		    
		    
		  Catch err1 As IOException
		    ' Silently ignore
		    
		  Catch err2 As JSONException
		    ' Silently ignore
		    
		  End Try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DocumentOpen(f As FolderItem)
		  Try
		    If (f = Nil) Then
		      f = GetUsersCurrentSudokuStateFile(False)
		    End If
		    
		    
		    If (f <> Nil) Then
		      Var newSudokuPuzzle As Sudoku.Puzzle = Sudoku.LoadFrom(f)
		      
		      If (newSudokuPuzzle <> Nil) Then
		        Me.SudokuPuzzle = newSudokuPuzzle
		        Me.ShowSudoku
		        Return
		      end if
		    End If
		    
		  Catch err As IOException
		    ' Silently ignore
		    
		  Finally
		    ' Start with a Random Sudoku
		    Me.ActionRandom(9, 36)
		    
		  End Try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetUsersCurrentFile(filename As String, tryCreate As Boolean) As FolderItem
		  Try
		    Var f As FolderItem = SpecialFolder.ApplicationData
		    If (f = Nil) Or (Not f.IsFolder) Or (Not f.Exists) Then Return Nil
		    
		    #If TargetLinux Then
		      f = f.Child("." + App.kBundleIdentifier)
		    #Else
		      f = f.Child(App.kBundleIdentifier)
		    #EndIf
		    
		    
		    If (f = Nil) Then Return Nil
		    
		    If (Not f.Exists) Then
		      If (Not tryCreate) Then Return Nil
		      f.CreateFolder
		    End If
		    
		    
		    f = f.Child(filename)
		    If (f = Nil) Then Return Nil
		    
		    If f.IsFolder Or (Not f.Exists) Then
		      if (not tryCreate) then Return Nil
		    End If
		    
		    Return f
		    
		  Catch err As RuntimeException
		    'ignore
		    
		  End Try
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetUsersCurrentSettingsFile(tryCreate As Boolean) As FolderItem
		  Return GetUsersCurrentFile("sudoku-settings.json", tryCreate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetUsersCurrentSudokuStateFile(tryCreate As Boolean) As FolderItem
		  Return GetUsersCurrentFile("currentstate.sudoku", tryCreate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HasUnlockedCells() As Boolean
		  ' Are there any unlocked cells with digits?
		  Var N As Integer = Me.SudokuPuzzle.GetGridSettings.N
		  For row As Integer = 0 To N-1
		    For col As Integer = 0 To N-1
		      If Me.SudokuPuzzle.IsGridCellLocked(row, col) Then Continue
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
		  
		  ' Assign CellHints and CellCandidates to show in SudokuCanvas
		  If mShowHints And (Not isEmpty) And isValid And isSolvable And (Not isSolved) Then
		    cnvSudoku.CellHints = Me.SudokuPuzzle.GetCellHints
		  Else
		    Var emptyHints() As Sudoku.CellHint
		    cnvSudoku.CellHints = emptyHints
		  End If
		  
		  If mShowCandidates And (Not isEmpty) And isValid And isSolvable And (Not isSolved) Then
		    cnvSudoku.CellCandidates = Me.SudokuPuzzle.GetCellCandidates(mExclusionParams)
		  Else
		    Var emptyCandidates() As Sudoku.CellCandidates
		    cnvSudoku.CellCandidates = emptyCandidates
		  End If
		  
		  ' Controls
		  btnLock.Enabled = (Not isEmpty) And isValid And isSolvable And Me.HasUnlockedCells
		  btnSolve.Enabled = (Not isEmpty) And isValid And isSolvable And (Not isSolved) And Me.SudokuPuzzle.SolveEnabled
		  
		  labExclusion.Enabled = me.mShowCandidates
		  chkExcludeLockedCandidates.Enabled = me.mShowCandidates
		  chkExcludeNakedSubsets.Enabled = Me.mShowCandidates
		  chkExcludeHiddenSubsets.Enabled = Me.mShowCandidates
		  chkExcludeXWing.Enabled = me.mShowCandidates
		  
		  ' Menu
		  SudokuLock.Enabled = btnLock.Enabled
		  SudokuSolve.Enabled = btnSolve.Enabled
		  
		  chkShowHints.EnsureValue = mShowHints
		  chkShowCandidates.EnsureValue = mShowCandidates
		  chkExcludeLockedCandidates.EnsureValue = mExclusionParams.ExcludeLockedCandidates
		  chkExcludeNakedSubsets.EnsureValue = mExclusionParams.ExcludeNakedSubsets
		  chkExcludeHiddenSubsets.EnsureValue = mExclusionParams.ExcludeHiddenSubsets
		  chkExcludeXWing.EnsureValue = mExclusionParams.ExcludeXWing
		  
		  SudokuShowHints.HasCheckMark = mShowHints
		  SudokuShowCandidates.HasCheckMark = mShowCandidates
		  SudokuExclusionLockedCandidates.HasCheckMark = mExclusionParams.ExcludeLockedCandidates
		  SudokuExclusionNakedSubsets.HasCheckMark = mExclusionParams.ExcludeNakedSubsets
		  SudokuExclusionHiddenSubsets.HasCheckMark = mExclusionParams.ExcludeHiddenSubsets
		  SudokuExclusionXWing.HasCheckMark = mExclusionParams.ExcludeXWing
		  
		  ' Status
		  If isEmpty Then
		    labStatus.Text = Translations.kSudokuStatusEmpty
		    labStatus.TextColor = Color.TextColor
		    Return
		  End If
		  
		  If (Not isValid) Then
		    labStatus.Text = Translations.kSudokuStatusInvalid
		    labStatus.TextColor = colStatusInvalid
		    Return
		  End If
		  
		  If isSolved Then
		    labStatus.Text = Translations.kSudokuStatusSolved
		    labStatus.TextColor = colStatusSolved
		    Return
		  End If
		  
		  If isSolvable Then
		    labStatus.Text = Translations.kSudokuStatusValid
		  Else
		    labStatus.Text = Translations.kSudokuStatusValidNotSolvable
		  End If
		  labStatus.TextColor = colStatusValid
		  
		  cnvSudoku.SetFocus
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowSudoku()
		  ' Refresh the canvas display
		  cnvSudoku.ShowSudoku
		  
		  Me.RefreshControls
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mCluesFactor As Double = 0.444
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mExclusionParams As Sudoku.ExclusionParams
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
			  mSudokuPuzzle = value
			  cnvSudoku.SudokuPuzzle = value
			  
			  ' Adjust Layout for current Sudoku Puzzle
			  ' Get required size from SudokuCanvas
			  Var canvasSize As Integer = cnvSudoku.GetRequiredSize
			  cnvSudoku.Width = canvasSize
			  cnvSudoku.Height = canvasSize
			  
			  ' Calculate window size: canvas left + canvas width + gap + button width + margin
			  Var windowWidth As Integer = cnvSudoku.Left + canvasSize + 20 + btnSolve.Width + 20
			  
			  Var minLayoutHeight As Integer = chkExcludeXWing.Top + 150 ' Solve and Status are bottom-locked
			  Var windowHeight As Integer = Max(cnvSudoku.Top + canvasSize + 20, minLayoutHeight)
			  
			  #If TargetLinux Then
			    ' Linux seems to best respect Window Size changes by setting new Bounds
			    Var newWindowBounds As Rect = New Rect(Me.Bounds.Left, Me.Bounds.Top, windowWidth, windowHeight)
			    Me.Bounds = newWindowBounds
			  #Else
			    Me.Width = windowWidth
			    Me.Height = windowHeight
			  #EndIf
			  
			End Set
		#tag EndSetter
		Private SudokuPuzzle As Sudoku.Puzzle
	#tag EndComputedProperty


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

	#tag Constant, Name = kJSONKeyShowHints, Type = String, Dynamic = False, Default = \"howHints", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSaveDialogCancel, Type = String, Dynamic = True, Default = \"Cancel", Scope = Private
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Abbrechen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Annuler"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Cancelar"
	#tag EndConstant

	#tag Constant, Name = kSaveDialogExport, Type = String, Dynamic = True, Default = \"Export", Scope = Private
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Export"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Exportation"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Exportar"
	#tag EndConstant

	#tag Constant, Name = kSaveDialogPrompt, Type = String, Dynamic = True, Default = \"Export Sudoku as PDF", Scope = Private
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Sudoku als PDF exportieren"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Exporter le Sudoku au format PDF"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Exportar Sudoku como PDF"
	#tag EndConstant


#tag EndWindowCode

#tag Events btnSolve
	#tag Event
		Sub Pressed()
		  Self.ActionSolve
		  
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
#tag Events cnvAppIcon
	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  #Pragma unused areas
		  
		  g.DrawPicture(AppIcon_128, 0, 0, 64, 64, 0, 0, AppIcon_128.Width, AppIcon_128.Height)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  If (x >= 0) And (x < Me.Width) And (y > 0) And (y < Me.Height) Then
		    System.GotoURL(Sudoku.kURL_Repository)
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  #Pragma unused x
		  #Pragma unused y
		  
		  Return True
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Me.MouseCursor = Nil
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  Me.MouseCursor = System.Cursors.FingerPointer
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events labAppName
	#tag Event
		Sub Opening()
		  Me.FontSize = 18
		  Me.Bold = True
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  If (x >= 0) And (x < Me.Width) And (y > 0) And (y < Me.Height) Then
		    System.GotoURL(Sudoku.kURL_Repository)
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  #Pragma unused x
		  #Pragma unused y
		  
		  Return True
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Me.MouseCursor = Nil
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  Me.MouseCursor = System.Cursors.FingerPointer
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events labThanks
	#tag Event
		Sub Opening()
		  #If TargetLinux Then
		    Me.FontSize = 12
		  #EndIf
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
#tag Events labContact
	#tag Event
		Sub MouseExit()
		  Me.MouseCursor = Nil
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  Me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  #Pragma unused x
		  #Pragma unused y
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  If (x >= 0) And (x < Me.Width) And (y > 0) And (y < Me.Height) Then
		    System.GotoURL("mailto:" + Sudoku.kEmail_Contact)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cnvPayPal
	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  #Pragma unused areas
		  
		  g.DrawingColor = &cFFFFFF
		  If Color.IsDarkMode Then g.DrawingColor = &cD0D0D0
		  g.FillRectangle(0, 0, g.Width, g.Height)
		  g.DrawingColor = &c909090
		  g.DrawRectangle(0, 0, g.Width, g.Height)
		  g.DrawPicture(PayPal, 3, 2, 100, 26, 0, 0, PayPal.Width, PayPal.Height)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Me.MouseCursor = Nil
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  Me.MouseCursor = System.Cursors.FingerPointer
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  If (x >= 0) And (x < Me.Width) And (y > 0) And (y < Me.Height) Then
		    System.GotoURL(Sudoku.kURL_PayPal)
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  #Pragma unused x
		  #Pragma unused y
		  
		  Return True
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events chkShowHints
	#tag Event
		Sub Opening()
		  Me.EnsureValue = Self.mShowHints
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub ValueChanged()
		  Self.mShowHints = (Not Self.mShowHints)
		  Self.RefreshControls
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkShowCandidates
	#tag Event
		Sub Opening()
		  Me.EnsureValue = Self.mShowCandidates
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub ValueChanged()
		  Self.mShowCandidates = (Not Self.mShowCandidates)
		  Self.RefreshControls
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkExcludeLockedCandidates
	#tag Event
		Sub Opening()
		  Me.EnsureValue = Self.mExclusionParams.ExcludeLockedCandidates
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub ValueChanged()
		  Self.mExclusionParams.ExcludeLockedCandidates = (Not Self.mExclusionParams.ExcludeLockedCandidates)
		  Self.RefreshControls
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkExcludeNakedSubsets
	#tag Event
		Sub Opening()
		  Me.EnsureValue = Self.mExclusionParams.ExcludeNakedSubsets
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub ValueChanged()
		  Self.mExclusionParams.ExcludeNakedSubsets = (Not Self.mExclusionParams.ExcludeNakedSubsets)
		  Self.RefreshControls
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkExcludeXWing
	#tag Event
		Sub Opening()
		  Me.EnsureValue = Self.mExclusionParams.ExcludeXWing And Self.mExclusionParams.ExcludeXWing
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub ValueChanged()
		  Self.mExclusionParams.ExcludeXWing = (Not Self.mExclusionParams.ExcludeXWing)
		  Self.RefreshControls
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkExcludeHiddenSubsets
	#tag Event
		Sub Opening()
		  Me.EnsureValue = Self.mExclusionParams.ExcludeHiddenSubsets
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub ValueChanged()
		  Self.mExclusionParams.ExcludeHiddenSubsets = (Not Self.mExclusionParams.ExcludeHiddenSubsets)
		  Self.RefreshControls
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnNew
	#tag Event
		Sub Pressed()
		  Self.ActionNew
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base As DesktopMenuItem, x As Integer, y As Integer) As Boolean
		  #Pragma unused y
		  #Pragma unused x
		  
		  #If DebugBuild Then
		    For i As Integer = 1 To 10
		      Var debugExample1 As New DesktopMenuItem("Sudoku " + i.ToString)
		      debugExample1.Name = "sudoku" + i.ToString
		      base.AddMenu(debugExample1)
		    Next
		    Return True
		    
		  #EndIf
		  
		  Return False
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuItemSelected(selectedItem As DesktopMenuItem) As Boolean
		  #If DebugBuild Then
		    Var loadSudoku As String
		    Select Case selectedItem.Name
		    Case "sudoku1"
		      loadSudoku = "000014000030000200070000000000900030601000000000000080200000104000050600000708000"
		    Case "sudoku2"
		      loadSudoku = "100006080064000000000040007000090600070400500500070100050000320300008000400000000"
		    Case "sudoku3"
		      loadSudoku = "700000000086090000050640800008500043010070020540003100004087060000020710000000009"
		    Case "sudoku4"
		      loadSudoku = "400000805030000000000700000020000060000080400000010000000603070500200000104000000"
		    Case "sudoku5"
		      loadSudoku = "480300000000000071020000000705000060000200800000000000001076000300000400000050000"
		    Case "sudoku6"
		      loadSudoku = "005000987040050001007000000200048000090100000600200000300600200000009070000000500"
		    Case "sudoku7"
		      loadSudoku = "098010000200000060000000000000302050084000000000600000000040809300500000000000100"
		    Case "sudoku8"
		      loadSudoku = "000501000090000800060000000401000000000070090000000030800000105000200400000360000"
		    Case "sudoku9"
		      loadSudoku = "080004050000700300000000000010085000600000200000040000302600000000000041700000000"
		    Case "sudoku10"
		      loadSudoku = "000031900300900601419867352080302017053100026102000039000010203000043100031009700"
		    End Select
		    
		    If (loadSudoku <> "") Then
		      Var N As Integer = 9
		      Self.SudokuPuzzle = New Sudoku.Puzzle(N)
		      
		      For row As Integer = 0 To N-1
		        For col As Integer = 0 To N-1
		          Var index As Integer = row * N + col
		          Self.SudokuPuzzle.SetGridValue(row, col) = loadSudoku.Middle(index, 1).ToInteger
		        Next
		      Next
		      
		      Self.ShowSudoku
		    End If
		  #EndIf
		  
		  
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events cnvSudoku
	#tag Event
		Sub ValueChanged()
		  ' Called when user changes a cell value in the canvas
		  Self.RefreshControls
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="HasTitleBar"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
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

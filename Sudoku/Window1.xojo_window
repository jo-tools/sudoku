#tag DesktopWindow
Begin DesktopWindow Window1
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
   Height          =   500
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   1342697471
   MenuBarVisible  =   False
   MinimumHeight   =   500
   MinimumWidth    =   560
   Resizeable      =   False
   Title           =   "Sudoku"
   Type            =   0
   Visible         =   True
   Width           =   560
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
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   370
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
   End
   Begin SudokuButton btnEmpty
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "#App.kSudokuEmpty"
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
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   120
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
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
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kLabelSudokuStatus"
      TextAlignment   =   2
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   428
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
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
      Left            =   405
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "..."
      TextAlignment   =   2
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   460
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
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
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   310
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
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
      Tooltip         =   "#kURL_Repository"
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
      Tooltip         =   "#kURL_Repository"
      Top             =   20
      Transparent     =   False
      Underline       =   True
      Visible         =   True
      Width           =   140
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
      Left            =   310
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
      Text            =   "#kLabelThanks"
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
      Width           =   140
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
      Left            =   355
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
      Text            =   "#kLabelContact"
      TextAlignment   =   1
      TextColor       =   &c0072CE00
      Tooltip         =   "#kEmail_Contact"
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
      Left            =   434
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "#kURL_PayPal"
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
      Width           =   560
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin SudokuPopupMenu lstNumClues
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
      Left            =   420
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      SelectedRowIndex=   -1
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   185
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   55
   End
   Begin SudokuLabel labNumClues
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   480
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kLabelNumClues"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   185
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   75
   End
   Begin SudokuButton btnRandom
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "#App.kSudokuRandom"
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
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   220
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
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
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   275
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   120
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  ' Layout
		  Me.Height = sepTop.Top + 2 * kMarginWindow + SudokuTool.N * kCellSize
		  Me.MinimumHeight = Me.Height
		  
		  Me.Width = 2 * kMarginWindow + SudokuTool.N * kCellSize + 20 + btnSolve.Width
		  Me.MaximumWidth = Me.Width
		  
		  ' Init Sudoku
		  Me.Sudoku = New SudokuTool
		  Me.SudokuNumberFieldsInit
		  
		  ' Start with a Random Sudoku
		  Me.ActionRandom
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  #Pragma unused areas
		  
		  #If TargetWindows Then
		    If (Not Color.IsDarkMode) Then
		      g.DrawingColor = Color.White
		      g.FillRectangle(kMarginWindow, sepTop.Top + kMarginWindow, SudokuTool.N * kCellSize, SudokuTool.N * kCellSize)
		    End If
		  #EndIf
		  
		  If Me.mShowHints And (Me.SolveCellHints.LastIndex >= 0) Then
		    ' Draw next solvable cells
		    g.PenSize = 4
		    For Each h As SudokuTool.SolveCellHint In Me.SolveCellHints
		      Select Case h.SolveHint
		      Case SudokuTool.SolveHint.NakedSingle
		        g.DrawingColor = colSolveHintNakedSingle
		        g.FillRectangle(kMarginWindow + h.Col * kCellSize, sepTop.Top + kMarginWindow + h.Row * kCellSize, kCellSize, kCellSize)
		      Case SudokuTool.SolveHint.HiddenSingle
		        g.DrawingColor = colSolveHintHiddenSingle
		        g.FillRectangle(kMarginWindow + h.Col * kCellSize, sepTop.Top + kMarginWindow + h.Row * kCellSize, kCellSize, kCellSize)
		      End Select
		    Next
		  End If
		  
		  ' Draw all thin "hair" lines first (gray)
		  g.DrawingColor = colGridlineHair
		  g.PenSize = 1
		  For i As Integer = 1 To SudokuTool.N-1 ' skip outer border (0 and N)
		    ' Horizontal
		    g.DrawLine(kMarginWindow, sepTop.Top + kMarginWindow + i * kCellSize, kMarginWindow + SudokuTool.N * kCellSize, sepTop.Top + kMarginWindow + i * kCellSize)
		    ' Vertical
		    g.DrawLine(kMarginWindow + i * kCellSize, sepTop.Top + kMarginWindow, kMarginWindow + i * kCellSize, sepTop.Top + kMarginWindow + SudokuTool.N * kCellSize)
		  Next
		  
		  ' Draw thicker red 3x3 block lines on top
		  g.DrawingColor = colGridline
		  g.PenSize = 2
		  For i As Integer = 0 To SudokuTool.N Step 3
		    ' Horizontal
		    g.DrawLine(kMarginWindow - g.PenSize/2, sepTop.Top + kMarginWindow + i * kCellSize - g.PenSize/2, kMarginWindow + SudokuTool.N * kCellSize - g.PenSize/2, sepTop.Top + kMarginWindow + i * kCellSize - g.PenSize/2)
		    ' Vertical
		    g.DrawLine(kMarginWindow + i * kCellSize - g.PenSize/2, sepTop.Top + kMarginWindow - g.PenSize/2, kMarginWindow + i * kCellSize - g.PenSize/2, sepTop.Top + kMarginWindow + SudokuTool.N * kCellSize - g.PenSize/2)
		  Next
		  
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
		  Self.ActionOpen
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FilePrint() As Boolean Handles FilePrint.Action
		  Self.Print
		  
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
		Function SudokuEmpty() As Boolean Handles SudokuEmpty.Action
		  Self.ActionEmpty
		  
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
		Function SudokuRandom() As Boolean Handles SudokuRandom.Action
		  Self.ActionRandom
		  
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
		  Me.Sudoku.ClearGrid
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
		  pdf.Author = kURL_Repository
		  pdf.Creator = "Sudoku " + labAppVersion.Text + " (Xojo " + XojoVersionString + ")"
		  pdf.Keywords = "Sudoku"
		  
		  ' Draw Sudoku
		  Me.Sudoku.DrawInto(g)
		  
		  ' Save PDF
		  pdf.Save(f)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ActionLock()
		  ' Lock current state
		  For row As Integer = 0 To SudokuTool.N-1
		    For col As Integer = 0 To SudokuTool.N-1
		      Var index As Integer = row * SudokuTool.N + col
		      Var val As Integer = Me.Sudoku.GetGridCell(row, col)
		      
		      SudokuTextFields(index).Lock = (val > 0)
		    Next
		  Next
		  
		  Me.RefreshControls
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ActionOpen()
		  Var fileContent As String
		  
		  Try
		    Var t As TextInputStream
		    Var f As FolderItem = FolderItem.ShowOpenFileDialog(SudokuFileTypeGroup.Sudoku)
		    If f = Nil Then Return
		    
		    t = TextInputStream.Open(f)
		    t.Encoding = Encodings.UTF8
		    fileContent = t.ReadAll
		    t.Close
		    
		    If Me.Sudoku.FromString(fileContent) Then
		      Me.ShowSudoku
		    End If
		    
		  Catch e As IOException
		    MessageBox e.Message + " (" + e.ErrorNumber.ToString + ")"
		    
		  End Try
		  
		  
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
		Private Sub ActionSave()
		  Try
		    Var suggestedFilename As String = "Sudoku " + DateTime.now.SQLDateTime.ReplaceAll(":", "-") + ".sudoku"
		    Var f As FolderItem = FolderItem.ShowSaveFileDialog(SudokuFileTypeGroup.Sudoku, suggestedFilename)
		    If (f = Nil) Then Return
		    
		    Var fileContent As String = Me.Sudoku.ToString
		    
		    Var t As TextOutputStream = TextOutputStream.Create(f)
		    t.Encoding = Encodings.UTF8
		    t.Delimiter = EndOfLine.UNIX
		    t.WriteLine(kURL_Repository)
		    t.WriteLine("")
		    t.Write(fileContent)
		    t.Close
		    
		  Catch e As IOException
		    MessageBox e.Message + " (" + e.ErrorNumber.ToString + ")"
		    
		  End Try
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
		Private Sub Print()
		  ' Setup Printing
		  Var ps As New PrinterSetup
		  ps.Landscape = False
		  Var g As Graphics = ps.ShowPrinterDialog(Self)
		  If (g = Nil) Then Return
		  
		  ' Draw Sudoku
		  Me.Sudoku.DrawInto(g)
		  
		  
		End Sub
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
		  
		  Self.Refresh(False)
		  
		  ' Controls
		  btnLock.Enabled = (Not isEmpty) And isValid And isSolvable And Me.HasUnlockedCells
		  btnEmpty.Enabled = (Not isEmpty)
		  btnSolve.Enabled = (Not isEmpty) And isValid And isSolvable And (Not isSolved) And Me.Sudoku.SolveEnabled
		  
		  ' Menu
		  SudokuEmpty.Enabled = btnEmpty.Enabled
		  SudokuRandom.Enabled = btnRandom.Enabled
		  SudokuLock.Enabled = btnLock.Enabled
		  SudokuSolve.Enabled = btnSolve.Enabled
		  chkShowHints.EnsureValue = mShowHints
		  SudokuShowHints.HasCheckMark = mShowHints
		  
		  ' Status
		  If isEmpty Then
		    labStatus.Text = kSudokuStatusEmpty
		    labStatus.TextColor = Color.TextColor
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
		      
		      Var val As Integer = Me.Sudoku.GetGridCell(row, col)
		      If val = 0 Then
		        SudokuTextFields(index).Text = ""
		        If (focusIndex < 0) Then focusIndex = index
		      Else
		        SudokuTextFields(index).Text = val.ToString
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
		Private Function SudokuNumberFieldKeyDown(sender As SudokuNumberField, key As String) As Boolean
		  If mIsShowingSudoku Then
		    'let default behavior happen
		    Return False
		  End If
		  
		  Select Case key
		    ' Handle arrow keys
		  Case Chr(28) ' Left arrow
		    Var leftIndex As Integer = sender.PositionIndex - 1
		    if (leftIndex >= 0) then SudokuTextFields(leftIndex).SetFocus
		    Return True
		    
		  Case Chr(29) ' Right arrow
		    Var rightIndex As Integer = sender.PositionIndex + 1
		    if (rightIndex < SudokuTool.N*SudokuTool.N) then SudokuTextFields(rightIndex).SetFocus
		    Return True
		    
		  Case Chr(30) ' Up arrow
		    Var upIndex As Integer = sender.PositionIndex - SudokuTool.N
		    ' Move focus to previous (unlocked) cell
		    if (upIndex >= 0) then SudokuTextFields(upIndex).SetFocus
		    Return True
		    
		  Case Chr(31) ' Down arrow
		    Var downIndex As Integer = sender.PositionIndex + SudokuTool.N
		    if (downIndex < SudokuTool.N*SudokuTool.N) then SudokuTextFields(downIndex).SetFocus
		    Return True
		    
		    ' Other special keys
		  Case Chr(8), Chr(127) ' Backspace, Delete
		    ' will be filled empty later
		    key = "0"
		    
		  Case Chr(9) 'Tab
		    'let default behavior happen
		    Return False
		    
		  End Select
		  
		  ' Locked Sudoku cell
		  If sender.IsLocked Then
		    ' Make sure original grid value is not being overwritten
		    ' we don't set .Readonly to get arrow navigation
		    Return True
		  End If
		  
		  ' Allow entering Digits 0-N
		  If key >= "0" And key <= SudokuTool.N.ToString Then
		    ' Update Number
		    Me.Sudoku.SetGridCell(sender.RowIndex, sender.ColumnIndex) = key.ToInteger
		    
		    If (key = "0") Then
		      sender.Text = ""
		    Else
		      sender.Text = key
		    End If
		    
		    ' Update Status
		    Me.RefreshControls
		    
		    Return True
		  End If
		  
		  ' Block everything else
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SudokuNumberFieldsInit()
		  Redim SudokuTextFields(SudokuTool.N*SudokuTool.N-1)
		  
		  For row As Integer = 0 To SudokuTool.N-1
		    For col As Integer = 0 To SudokuTool.N-1
		      Var index As Integer = row * SudokuTool.N + col
		      
		      ' Create Sudoku Number TextField
		      SudokuTextFields(index) = New SudokuNumberField
		      SudokuTextFields(index).Parent = Me
		      SudokuTextFields(index).Visible = True
		      SudokuTextFields(index).Left = kMarginWindow + col * kCellSize + ((kCellSize - SudokuTextFields(index).Width) / 2)
		      SudokuTextFields(index).Top = sepTop.Top + kMarginWindow + row * kCellSize + ((kCellSize - SudokuTextFields(index).Height) / 2)
		      
		      SudokuTextFields(index).RowIndex = row
		      SudokuTextFields(index).ColumnIndex = col
		      SudokuTextFields(index).PositionIndex = index
		      
		      ' Add custom KeyDown event handler, then add Control to Window
		      AddHandler SudokuTextFields(index).KeyDown, AddressOf SudokuNumberFieldKeyDown
		      AddHandler SudokuTextFields(index).TextChanged, AddressOf SudokuNumberFieldTextChanged
		      Self.AddControl(SudokuTextFields(index))
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
		    Var gridVal As String = Me.Sudoku.GetGridCell(sender.RowIndex, sender.ColumnIndex).ToString
		    If (gridVal = "0") Then gridVal = ""
		    If (sender.Text <> gridVal) Then sender.Text = gridVal
		    Return
		  End If
		  
		  ' Update Number if necessary
		  Var currentNumber As Integer = sender.Text.ToInteger
		  If (Me.Sudoku.GetGridCell(sender.RowIndex, sender.ColumnIndex) = currentNumber) Then Return
		  
		  Me.Sudoku.SetGridCell(sender.RowIndex, sender.ColumnIndex) = currentNumber
		  
		  If (currentNumber < 1) And (sender.Text <> "") Then
		    sender.Text = ""
		  End If
		  
		  ' Update Status
		  Me.RefreshControls
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mIsShowingSudoku As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mShowHints As Boolean = True
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


	#tag Constant, Name = kCellSize, Type = Double, Dynamic = False, Default = \"44", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kEmail_Contact, Type = String, Dynamic = False, Default = \"xojo@jo-tools.ch", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kLabelContact, Type = String, Dynamic = True, Default = \"Contact", Scope = Private
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Kontakt"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Contact"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Contacto"
	#tag EndConstant

	#tag Constant, Name = kLabelNumClues, Type = String, Dynamic = True, Default = \"Clues", Scope = Private
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Vorgaben"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Indices"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Pistas"
	#tag EndConstant

	#tag Constant, Name = kLabelSudokuStatus, Type = String, Dynamic = True, Default = \"Sudoku Status", Scope = Private
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Sudoku Status"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Sudoku Statut"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Sudoku Estado"
	#tag EndConstant

	#tag Constant, Name = kLabelThanks, Type = String, Dynamic = True, Default = \"Would you like to say \'Thank you\'\?", Scope = Private
		#Tag Instance, Platform = Any, Language = de, Definition  = \"M\xC3\xB6chten Sie \'Danke\' sagen\?"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Vous souhaitez dire \'merci\'\?"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"\xC2\xBFQuiere dar las gracias\?"
	#tag EndConstant

	#tag Constant, Name = kMarginWindow, Type = Double, Dynamic = False, Default = \"20", Scope = Private
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

	#tag Constant, Name = kSudokuStatusEmpty, Type = String, Dynamic = True, Default = \"Empty", Scope = Private
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Leer"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Vide"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Vac\xC3\xADo"
	#tag EndConstant

	#tag Constant, Name = kSudokuStatusInvalid, Type = String, Dynamic = True, Default = \"Invalid", Scope = Private
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Ung\xC3\xBCltig"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Non valide"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"No v\xC3\xA1lido"
	#tag EndConstant

	#tag Constant, Name = kSudokuStatusSolved, Type = String, Dynamic = True, Default = \"Solved", Scope = Private
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Gel\xC3\xB6st"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"R\xC3\xA9solu"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Resuelto"
	#tag EndConstant

	#tag Constant, Name = kSudokuStatusValid, Type = String, Dynamic = True, Default = \"Valid", Scope = Private
		#Tag Instance, Platform = Any, Language = de, Definition  = \"G\xC3\xBCltig"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Valide"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"V\xC3\xA1lido"
	#tag EndConstant

	#tag Constant, Name = kSudokuStatusValidNotSolvable, Type = String, Dynamic = True, Default = \"Valid (not solvable)", Scope = Private
		#Tag Instance, Platform = Any, Language = de, Definition  = \"G\xC3\xBCltig (nicht l\xC3\xB6sbar)"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Valide (non soluble)"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"V\xC3\xA1lido (sin soluci\xC3\xB3n)"
	#tag EndConstant

	#tag Constant, Name = kURL_PayPal, Type = String, Dynamic = False, Default = \"https://paypal.me/jotools", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kURL_Repository, Type = String, Dynamic = False, Default = \"https://github.com/jo-tools/sudoku", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events btnSolve
	#tag Event
		Sub Pressed()
		  Self.ActionSolve
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnEmpty
	#tag Event
		Sub Pressed()
		  Self.ActionEmpty
		  
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
		      Self.Sudoku.ClearGrid
		      
		      For row As Integer = 0 To SudokuTool.N-1
		        For col As Integer = 0 To SudokuTool.N-1
		          Var index As Integer = row * SudokuTool.N + col
		          Self.Sudoku.SetGridCell(row, col) = loadSudoku.Middle(index, 1).ToInteger
		        Next
		      Next
		      
		      Self.ShowSudoku
		    End If
		  #EndIf
		  
		  
		  
		End Function
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
		    System.GotoURL(kURL_Repository)
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
		    System.GotoURL(kURL_Repository)
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
		  If (App.Version <> "") Then
		    Me.Text = App.Version
		    Return
		  End If
		  
		  Me.Text = App.MajorVersion.ToString + "." + App.MinorVersion.ToString + "." + App.BugVersion.ToString
		  
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
		    System.GotoURL("mailto:" + kEmail_Contact)
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
		    System.GotoURL(kURL_PayPal)
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
		  
		  Me.SelectedRowIndex = 3
		  
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

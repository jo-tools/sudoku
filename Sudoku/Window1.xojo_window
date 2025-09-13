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
      Caption         =   "#kButtonSolve"
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
      Caption         =   "#kButtonEmpty"
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
   Begin SudokuButton btnRandom32
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "#kButtonRandom32"
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
      Top             =   190
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
   End
   Begin SudokuButton btnRandom48
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "#kButtonRandom48"
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
      Top             =   225
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
   Begin SudokuButton btnRandom64
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "#kButtonRandom64"
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
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   260
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
   End
   Begin SudokuButton btnLock
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "#kButtonLock"
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
      Top             =   315
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
   End
   Begin SudokuButton btnRandom24
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "#kButtonRandom24"
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
      Top             =   155
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
		  Self.Sudoku.GenerateRandomPuzzle(48)
		  Me.ShowSudoku
		  Me.LockSudoku
		  
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
		  #endif
		  
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
		  g.PenSize = 3
		  For i As Integer = 0 To SudokuTool.N Step 3
		    ' Horizontal
		    g.DrawLine(kMarginWindow, sepTop.Top + kMarginWindow + i * kCellSize, kMarginWindow + SudokuTool.N * kCellSize, sepTop.Top + kMarginWindow + i * kCellSize)
		    ' Vertical
		    g.DrawLine(kMarginWindow + i * kCellSize, sepTop.Top + kMarginWindow, kMarginWindow + i * kCellSize, sepTop.Top + kMarginWindow + SudokuTool.N * kCellSize)
		  Next
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub LockSudoku()
		  ' Lock current state
		  For r As Integer = 0 To SudokuTool.N-1
		    For c As Integer = 0 To SudokuTool.N-1
		      Var index As Integer = r * SudokuTool.N + c
		      Var v As Integer = Me.Sudoku.GetGridCell(r, c)
		      
		      SudokuTextFields(index).Lock = (v > 0)
		    Next
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RefreshControls()
		  Var isEmpty As Boolean = Me.Sudoku.IsEmpty
		  Var isValid As Boolean = Me.Sudoku.IsValid
		  Var isSolvable As Boolean = Me.Sudoku.IsSolvable
		  Var isSolved As Boolean = Me.Sudoku.IsSolved
		  
		  ' Controls
		  btnLock.Enabled = (Not isEmpty) And isValid And isSolvable And (Not isSolved)
		  btnEmpty.Enabled = (Not isEmpty)
		  btnSolve.Enabled = (Not isEmpty) And isValid And isSolvable And (Not isSolved)
		  
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
		  For r As Integer = 0 To SudokuTool.N-1
		    For c As Integer = 0 To SudokuTool.N-1
		      Var index As Integer = r * SudokuTool.N + c
		      
		      SudokuTextFields(index).Lock = False
		      
		      Var v As Integer = Me.Sudoku.GetGridCell(r, c)
		      If v = 0 Then
		        SudokuTextFields(index).Text = ""
		        If (focusIndex < 0) Then focusIndex = index
		      Else
		        SudokuTextFields(index).Text = Str(v)
		      End If
		    Next
		  Next
		  
		  ' Focus into first empty field
		  If (focusIndex < 0) Then
		    ClearFocus
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
		Private Sudoku As SudokuTool
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SudokuTextFields() As SudokuNumberField
	#tag EndProperty


	#tag Constant, Name = kButtonEmpty, Type = String, Dynamic = True, Default = \"Empty", Scope = Private
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Leer"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Vide"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Vac\xC3\xADo"
	#tag EndConstant

	#tag Constant, Name = kButtonLock, Type = String, Dynamic = True, Default = \"Lock", Scope = Private
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Sperren"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Verrou"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Bloqueo"
	#tag EndConstant

	#tag Constant, Name = kButtonRandom24, Type = String, Dynamic = True, Default = \"Random (24)", Scope = Private
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Zufall (24)"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Al\xC3\xA9atoire (24)"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Aleatorio (24)"
	#tag EndConstant

	#tag Constant, Name = kButtonRandom32, Type = String, Dynamic = True, Default = \"Random (32)", Scope = Private
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Zufall (32)"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Al\xC3\xA9atoire (32)"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Aleatorio (32)"
	#tag EndConstant

	#tag Constant, Name = kButtonRandom48, Type = String, Dynamic = True, Default = \"Random (48)", Scope = Private
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Zufall (48)"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Al\xC3\xA9atoire (48)"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Aleatorio (48)"
	#tag EndConstant

	#tag Constant, Name = kButtonRandom64, Type = String, Dynamic = True, Default = \"Random (64)", Scope = Private
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Zufall (64)"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Al\xC3\xA9atoire (64)"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Aleatorio (64)"
	#tag EndConstant

	#tag Constant, Name = kButtonSolve, Type = String, Dynamic = True, Default = \"Solve", Scope = Private
		#Tag Instance, Platform = Any, Language = de, Definition  = \"L\xC3\xB6sen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"R\xC3\xA9soudre"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Resolver"
	#tag EndConstant

	#tag Constant, Name = kCellSize, Type = Double, Dynamic = False, Default = \"44", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kEmail_Contact, Type = String, Dynamic = False, Default = \"xojo@jo-tools.ch", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kLabelContact, Type = String, Dynamic = True, Default = \"Contact", Scope = Private
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Kontakt"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Contact"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Contacto"
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
		  ' Sanity Check
		  If (Not Self.Sudoku.IsSolvable) Then Return
		  
		  ' Solve and Show
		  Call Self.Sudoku.Solve
		  Self.ShowSudoku
		  Self.LockSudoku
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnEmpty
	#tag Event
		Sub Pressed()
		  Self.Sudoku.ClearGrid
		  Self.ShowSudoku
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnRandom32
	#tag Event
		Sub Pressed()
		  Self.Sudoku.GenerateRandomPuzzle(32)
		  Self.ShowSudoku
		  Self.LockSudoku
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnRandom48
	#tag Event
		Sub Pressed()
		  Self.Sudoku.GenerateRandomPuzzle(48)
		  Self.ShowSudoku
		  Self.LockSudoku
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnRandom64
	#tag Event
		Sub Pressed()
		  Self.Sudoku.GenerateRandomPuzzle(64)
		  Self.ShowSudoku
		  Self.LockSudoku
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnLock
	#tag Event
		Sub Pressed()
		  Self.LockSudoku
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnRandom24
	#tag Event
		Sub Pressed()
		  Self.Sudoku.GenerateRandomPuzzle(24)
		  Self.ShowSudoku
		  Self.LockSudoku
		  
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
		  
		  Me.Text = Str(App.MajorVersion) + "." + Str(App.MinorVersion) + "." + Str(App.BugVersion)
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

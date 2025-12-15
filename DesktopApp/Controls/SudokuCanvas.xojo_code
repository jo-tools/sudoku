#tag Class
Protected Class SudokuCanvas
Inherits DesktopCanvas
	#tag Event
		Sub FocusLost()
		  ' Commit pending input when focus leaves the canvas
		  Me.CommitPendingInput
		  
		  ' Track focus state (keep active cell remembered)
		  mHasFocus = False
		  Me.Refresh(False)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub FocusReceived()
		  ' Track focus state
		  mHasFocus = True
		  
		  Me.ShowSudoku
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(key As String) As Boolean
		  If (mSudokuPuzzle = Nil) Then Return False
		  If (mActiveRow < 0) Or (mActiveCol < 0) Then Return False
		  
		  Var N As Integer = mSudokuPuzzle.GetGridSettings.N
		  
		  ' 1. Handle Special Keys
		  Select Case key
		    ' Handle arrow keys for navigation
		  Case Chr(28) ' Left arrow
		    Me.CommitPendingInput
		    Var newCol As Integer = mActiveCol - 1
		    If (newCol >= 0) Then
		      mActiveCol = newCol
		    ElseIf (mActiveRow > 0) Then
		      mActiveRow = mActiveRow - 1
		      mActiveCol = N - 1
		    End If
		    Me.Refresh(False)
		    Return True
		    
		  Case Chr(29) ' Right arrow
		    Me.CommitPendingInput
		    Var newCol As Integer = mActiveCol + 1
		    If (newCol < N) Then
		      mActiveCol = newCol
		    ElseIf (mActiveRow < N - 1) Then
		      mActiveRow = mActiveRow + 1
		      mActiveCol = 0
		    End If
		    Me.Refresh(False)
		    Return True
		    
		  Case Chr(30) ' Up arrow
		    Me.CommitPendingInput
		    Var newRow As Integer = mActiveRow - 1
		    If (newRow >= 0) Then
		      mActiveRow = newRow
		    End If
		    Me.Refresh(False)
		    Return True
		    
		  Case Chr(31) ' Down arrow
		    Me.CommitPendingInput
		    Var newRow As Integer = mActiveRow + 1
		    If (newRow < N) Then
		      mActiveRow = newRow
		    End If
		    Me.Refresh(False)
		    Return True
		    
		  Case Chr(13), Chr(3) ' Return, Enter
		    ' Commit value for N>9
		    If N > 9 Then
		      Me.CommitPendingInput
		    End If
		    Return True
		    
		  Case Chr(9) ' Tab
		    ' Let default behavior happen (set focus to next control)
		    Me.CommitPendingInput
		    Return False
		    
		  Case Chr(8), Chr(127) ' Backspace, Delete
		    If mSudokuPuzzle.IsGridCellLocked(mActiveRow, mActiveCol) Then
		      ' Ignore for locked cells
		      Return True
		    End If
		    
		    If N <= 9 Then
		      ' For N<=9: immediate clear
		      mSudokuPuzzle.SetGridValue(mActiveRow, mActiveCol) = 0
		      mPendingInput = ""
		      RaiseEvent ValueChanged
		    Else
		      ' For N>9: remove last character from pending input
		      If mPendingInput.Length > 0 Then
		        mPendingInput = mPendingInput.Left(mPendingInput.Length - 1)
		      Else
		        ' Clear the cell
		        mSudokuPuzzle.SetGridValue(mActiveRow, mActiveCol) = 0
		        RaiseEvent ValueChanged
		      End If
		    End If
		    
		    Me.Refresh(False)
		    Return True
		    
		  End Select
		  
		  ' 2. Handle Number Input
		  If key < "0" Or key > "9" Then
		    ' not a digit, so don't handle this key
		    Return False
		  End If
		  
		  ' Locked cell - ignore input
		  If mSudokuPuzzle.IsGridCellLocked(mActiveRow, mActiveCol) Then
		    ' Ignore for locked cells
		    Return True
		  End If
		  
		  ' For N<=9: Allow entering digits 0-N with immediate update
		  If N <= 9 Then
		    If key >= "0" And key <= N.ToString Then
		      Var newValue As Integer = key.ToInteger
		      mSudokuPuzzle.SetGridValue(mActiveRow, mActiveCol) = newValue
		      mPendingInput = ""
		      Me.Refresh(False)
		      RaiseEvent ValueChanged
		      Return True
		    End If
		    
		    ' Block non-digit keys and digits > N
		    Return True
		  End If
		  
		  ' For N>9: Allow entering digits 0-9 (multi-digit input)
		  If key >= "0" And key <= "9" Then
		    If (mPendingInput.Length >= 2) Then
		      ' 3 Letters are too much, so ignore
		      Return True
		    End If
		    
		    mPendingInput = mPendingInput + key
		    Me.Refresh(False)
		    Return True
		  End If
		  
		  ' Nothing else to handle regarding Number Input
		  Return True
		  
		End Function
	#tag EndEvent

	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  ' Track the cell where mouse was pressed
		  If (mSudokuPuzzle = Nil) Then
		    mMouseDownRow = -1
		    mMouseDownCol = -1
		    Return True
		  End If
		  
		  Var cellInfo As Pair = Me.GetCellAtPoint(x, y)
		  mMouseDownRow = cellInfo.Left
		  mMouseDownCol = cellInfo.Right
		  
		  ' Return true to indicate we handle mouse events
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  ' Clear hover state
		  If (mHoverRow >= 0) Or (mHoverCol >= 0) Then
		    mHoverRow = -1
		    mHoverCol = -1
		    Me.Refresh(False)
		  End If
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(x As Integer, y As Integer)
		  ' Track hover cell for visual feedback
		  If (mSudokuPuzzle = Nil) Then Return
		  
		  Var cellInfo As Pair = Me.GetCellAtPoint(x, y)
		  Var newHoverRow As Integer = cellInfo.Left
		  Var newHoverCol As Integer = cellInfo.Right
		  
		  If (newHoverRow <> mHoverRow) Or (newHoverCol <> mHoverCol) Then
		    mHoverRow = newHoverRow
		    mHoverCol = newHoverCol
		    Me.Refresh(False)
		  End If
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  ' Only select a cell if mouse is released in the same cell where it was pressed
		  ' This allows the user to "cancel" a selection by dragging outside the cell
		  If (mSudokuPuzzle = Nil) Then Return
		  
		  Var cellInfo As Pair = Me.GetCellAtPoint(x, y)
		  Var clickedRow As Integer = cellInfo.Left
		  Var clickedCol As Integer = cellInfo.Right
		  
		  ' Only select if released in the same cell as mouse down
		  If (clickedRow >= 0) And (clickedCol >= 0) Then
		    If (clickedRow = mMouseDownRow) And (clickedCol = mMouseDownCol) Then
		      ' Commit any pending input before changing cell
		      Me.CommitPendingInput
		      
		      mActiveRow = clickedRow
		      mActiveCol = clickedCol
		      Me.Refresh(False)
		    End If
		  End If
		  
		  ' Reset mouse down tracking
		  mMouseDownRow = -1
		  mMouseDownCol = -1
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  #Pragma unused areas
		  
		  If (mSudokuPuzzle = Nil) Then Return
		  
		  Var N As Integer = mSudokuPuzzle.GetGridSettings.N
		  Var boxWidth As Integer = mSudokuPuzzle.GetGridSettings.BoxWidth
		  Var boxHeight As Integer = mSudokuPuzzle.GetGridSettings.BoxHeight
		  
		  ' Calculate cell size based on canvas size
		  Var cellSize As Double = Min(g.Width, g.Height) / N
		  
		  ' Background fill for Windows in light mode
		  #If TargetWindows Then
		    If (Not Color.IsDarkMode) Then
		      g.DrawingColor = Color.White
		      g.FillRectangle(0, 0, N * cellSize, N * cellSize)
		    End If
		  #EndIf
		  
		  ' Draw cell hints (solvable cells highlighting)
		  Me.DrawCellHints(g, cellSize)
		  
		  ' Draw grid lines
		  Me.DrawGrid(g, cellSize, N, boxWidth, boxHeight)
		  
		  ' Draw cell candidates
		  If (mCellCandidates.LastIndex >= 0) Then
		    Me.DrawCellCandidates(g, cellSize, N)
		  End If
		  
		  ' Draw numbers in cells
		  Me.DrawCellNumbers(g, cellSize, N)
		  
		  ' Draw hover indicator (half opacity)
		  If (mHoverRow >= 0) And (mHoverCol >= 0) Then
		    If (mHoverRow <> mActiveRow) Or (mHoverCol <> mActiveCol) Then
		      Me.DrawFocusIndicator(g, mHoverRow, mHoverCol, cellSize, 0.5)
		    End If
		  End If
		  
		  ' Draw active cell focus indicator (only when canvas has focus)
		  If mHasFocus And (mActiveRow >= 0) And (mActiveCol >= 0) Then
		    Me.DrawFocusIndicator(g, mActiveRow, mActiveCol, cellSize, 1.0)
		  End If
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub ScaleFactorChanged()
		  Me.Refresh(False)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CellCandidates(Assigns cellCandidates() As Sudoku.CellCandidates)
		  mCellCandidates = cellCandidates
		  
		  ' Schedule a ReDraw
		  Me.Refresh(False)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CellHints(Assigns cellHints() As Sudoku.CellHint)
		  mCellHints = cellHints
		  
		  ' Schedule a ReDraw
		  Me.Refresh(False)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CommitPendingInput()
		  ' Commit any pending multi-digit input to the grid
		  If (mSudokuPuzzle = Nil) Then Return
		  If (mActiveRow < 0) Or (mActiveCol < 0) Then Return
		  If mSudokuPuzzle.IsGridCellLocked(mActiveRow, mActiveCol) Then
		    mPendingInput = ""
		    Return
		  End If
		  
		  If mPendingInput = "" Then Return
		  
		  Var N As Integer = mSudokuPuzzle.GetGridSettings.N
		  Var newValue As Integer = mPendingInput.ToInteger
		  
		  ' Validate: must be 0 (empty) or 1..N
		  If (newValue >= 0) And (newValue <= N) Then
		    If mSudokuPuzzle.GetGridValue(mActiveRow, mActiveCol) <> newValue Then
		      mSudokuPuzzle.SetGridValue(mActiveRow, mActiveCol) = newValue
		      RaiseEvent ValueChanged
		    End If
		  End If
		  
		  mPendingInput = ""
		  Me.Refresh(False)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawCellCandidates(g As Graphics, cellSize As Double, N As Integer)
		  ' Draw Cell Candidates inside the cell in a grid layout
		  ' Candidates are arranged in rows based on N:
		  '   N=4:  2x2 grid (1,2 / 3,4)
		  '   N=6:  2x3 grid (1,2,3 / 4,5,6)
		  '   N=8:  3x3 grid with last row having 2 (1,2,3 / 4,5,6 / 7,8)
		  '   N=9:  3x3 grid (1,2,3 / 4,5,6 / 7,8,9)
		  '   N=12: 3x4 grid (1,2,3,4 / 5,6,7,8 / 9,10,11,12)
		  '   N=16: 4x4 grid (1,2,3,4 / 5,6,7,8 / 9,10,11,12 / 13,14,15,16)
		  
		  ' Determine grid layout (rows x cols) for candidates
		  Var gridRows As Integer
		  Var gridCols As Integer
		  
		  Select Case N
		  Case 4
		    gridRows = 2
		    gridCols = 2
		  Case 6
		    gridRows = 2
		    gridCols = 3
		  Case 8
		    gridRows = 3
		    gridCols = 3
		  Case 9
		    gridRows = 3
		    gridCols = 3
		  Case 12
		    gridRows = 3
		    gridCols = 4
		  Case 16
		    gridRows = 4
		    gridCols = 4
		  Else
		    ' Fallback: try to make a roughly square grid
		    gridCols = Ceiling(Sqrt(N))
		    gridRows = Ceiling(N / gridCols)
		  End Select
		  
		  ' Calculate candidate font size and slot dimensions
		  ' Leave some padding inside the cell
		  Var padding As Double = 2
		  Var slotWidth As Double = (cellSize - 2 * padding) / gridCols
		  Var slotHeight As Double = (cellSize - 2 * padding) / gridRows
		  
		  g.FontSize = Min(slotHeight * 0.7, slotWidth * 0.7)
		  g.PenSize = 1
		  
		  For Each h As Sudoku.CellCandidates In mCellCandidates
		    Var cellLeft As Double = h.Col * cellSize + padding
		    Var cellTop As Double = h.Row * cellSize + padding
		    
		    For Each candidate As Sudoku.Candidate In h.Candidates
		      If (candidate.Value < 1) Or (candidate.Value > N) Then Continue
		      If (candidate.Hint = Sudoku.CandidateHint.NoCandidate) Then Continue
		      
		      ' Calculate grid position for this candidate value
		      Var idx As Integer = candidate.Value - 1
		      Var gridRow As Integer = idx \ gridCols
		      Var gridCol As Integer = idx Mod gridCols
		      
		      ' Calculate center position of this slot
		      Var centerX As Double = cellLeft + gridCol * slotWidth + slotWidth / 2
		      Var centerY As Double = cellTop + gridRow * slotHeight + slotHeight / 2
		      
		      ' Set candidate color
		      g.DrawingColor = colCandidate
		      g.Bold = False
		      
		      Var s As String = candidate.Value.ToString
		      Var textW As Double = g.TextWidth(s)
		      Var textH As Double = g.TextHeight(s, cellSize)
		      Var ascent As Double = g.FontAscent
		      Var xText As Double = centerX - textW / 2
		      Var yBase As Double = centerY + ascent - textH / 2
		      
		      g.DrawText(s, xText, yBase)
		      
		      ' Mark excluded candidates with a strike-through line
		      Var crossSize As Double = Min(slotWidth, slotHeight) * 0.6
		      
		      Select Case candidate.Hint
		      Case Sudoku.CandidateHint.NoCandidate
		        Continue
		      Case Sudoku.CandidateHint.Candidate
		        Continue
		      Case Sudoku.CandidateHint.ExcludedAsLockedCandidate
		        g.DrawingColor = colExcludeLockedCandidates
		      Case Sudoku.CandidateHint.ExcludedAsNakedSubset
		        g.DrawingColor = colExcludeNakedSubsets
		      Case Sudoku.CandidateHint.ExcludedAsHiddenSubset
		        g.DrawingColor = colExcludeHiddenSubsets
		      Case Sudoku.CandidateHint.ExcludedAsXWing
		        g.DrawingColor = colExcludeXWing
		      Else
		        Continue
		      End Select
		      
		      g.PenSize = 1.0
		      g.DrawLine(centerX - crossSize*0.4, centerY + crossSize*0.4, centerX + crossSize*0.4, centerY - crossSize*0.4)
		    Next
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawCellHints(g As Graphics, cellSize As Double)
		  ' Draw cell hints (solvable cells highlighting)
		  If (mCellHints.LastIndex < 0) Then Return
		  
		  For Each h As Sudoku.CellHint In mCellHints
		    Select Case h.SolveHint
		    Case Sudoku.SolveHint.NakedSingle
		      g.DrawingColor = colSolveHintNakedSingle
		      g.FillRectangle(h.Col * cellSize, h.Row * cellSize, cellSize, cellSize)
		    Case Sudoku.SolveHint.HiddenSingle
		      g.DrawingColor = colSolveHintHiddenSingle
		      g.FillRectangle(h.Col * cellSize, h.Row * cellSize, cellSize, cellSize)
		    End Select
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawCellNumbers(g As Graphics, cellSize As Double, N As Integer)
		  ' Draw the numbers in each cell
		  ' Locked cells = bold, unlocked cells = normal weight
		  
		  ' Calculate font size based on cell size
		  Var fontSize As Double = cellSize * 0.5
		  g.FontSize = fontSize
		  g.DrawingColor = Color.TextColor
		  
		  For row As Integer = 0 To N - 1
		    For col As Integer = 0 To N - 1
		      Var value As Integer = mSudokuPuzzle.GetGridValue(row, col)
		      Var isLocked As Boolean = mSudokuPuzzle.IsGridCellLocked(row, col)
		      Var isActiveCell As Boolean = (row = mActiveRow) And (col = mActiveCol)
		      
		      ' Determine what to display
		      Var displayText As String
		      If isActiveCell And (mPendingInput <> "") Then
		        ' Show pending input for active cell
		        displayText = mPendingInput
		      ElseIf value > 0 Then
		        displayText = value.ToString
		      Else
		        displayText = ""
		      End If
		      
		      If displayText = "" Then Continue
		      
		      ' Set bold based on locked state
		      g.Bold = isLocked
		      
		      ' Calculate text position (centered in cell)
		      Var cellCenterX As Double = col * cellSize + cellSize / 2
		      Var cellCenterY As Double = row * cellSize + cellSize / 2
		      
		      Var textW As Double = g.TextWidth(displayText)
		      Var textH As Double = g.TextHeight(displayText, cellSize)
		      Var ascent As Double = g.FontAscent
		      
		      Var xText As Double = cellCenterX - textW / 2
		      Var yBase As Double = cellCenterY + ascent - textH / 2
		      
		      g.DrawText(displayText, xText, yBase)
		    Next
		  Next
		  
		  g.Bold = False
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawFocusIndicator(g As Graphics, row As Integer, col As Integer, cellSize As Double, opacity As Double)
		  ' Draw a rounded rectangle focus indicator inside the cell
		  ' Grid lines: hair=1px at cell boundary, thick=2px offset by -1 from boundary
		  ' Focus indicator must be drawn after the grid lines (inside the cell area)
		  
		  If (mSudokuPuzzle = Nil) Then Return
		  
		  Var N As Integer = mSudokuPuzzle.GetGridSettings.N
		  Var boxWidth As Integer = mSudokuPuzzle.GetGridSettings.BoxWidth
		  Var boxHeight As Integer = mSudokuPuzzle.GetGridSettings.BoxHeight
		  
		  ' Calculate the drawable area inside the cell (after grid lines)
		  ' Left edge: thick line if col=0 or at box boundary, else hair line
		  ' Thick lines are drawn at cellBoundary - 1 (offset), so they occupy cellBoundary-1 to cellBoundary+1
		  ' Hair lines are drawn at cellBoundary, so they occupy cellBoundary-0.5 to cellBoundary+0.5
		  
		  Var leftEdge As Double = col * cellSize
		  Var topEdge As Double = row * cellSize
		  Var rightEdge As Double = (col + 1) * cellSize
		  Var bottomEdge As Double = (row + 1) * cellSize
		  
		  ' Left border adjustment
		  ' Outer border: rectangle drawn at PenSize/2 with width 2, occupies ~1-2
		  ' Inner thick lines: drawn at boundary - 1, occupies boundary-1 to boundary+1
		  ' Hair lines: drawn at boundary, occupies boundary-0.5 to boundary+0.5
		  If col = 0 Then
		    leftEdge = leftEdge + 2 ' After outer border rectangle
		  ElseIf (col Mod boxWidth) = 0 Then
		    leftEdge = leftEdge + 1 ' After inner thick line
		  Else
		    leftEdge = leftEdge + 1 ' After hair line
		  End If
		  
		  ' Top border adjustment
		  If row = 0 Then
		    topEdge = topEdge + 2 ' After outer border rectangle
		  ElseIf (row Mod boxHeight) = 0 Then
		    topEdge = topEdge + 1 ' After inner thick line
		  Else
		    topEdge = topEdge + 1 ' After hair line
		  End If
		  
		  ' Right border adjustment
		  If col = N - 1 Then
		    rightEdge = rightEdge - 2 ' Before outer border rectangle
		  ElseIf ((col + 1) Mod boxWidth) = 0 Then
		    rightEdge = rightEdge - 1 ' Before inner thick line
		  Else
		    rightEdge = rightEdge ' Hair line is at boundary, indicator can go up to it
		  End If
		  
		  ' Bottom border adjustment
		  If row = N - 1 Then
		    bottomEdge = bottomEdge - 2 ' Before outer border rectangle
		  ElseIf ((row + 1) Mod boxHeight) = 0 Then
		    bottomEdge = bottomEdge - 1 ' Before inner thick line
		  Else
		    bottomEdge = bottomEdge ' Hair line is at boundary, indicator can go up to it
		  End If
		  
		  Var cornerRadius As Double = 8
		  
		  Var x As Double = leftEdge
		  Var y As Double = topEdge
		  Var w As Double = rightEdge - leftEdge
		  Var h As Double = bottomEdge - topEdge
		  
		  ' Use highlight color with opacity
		  Var highlightColor As Color = Color.HighlightColor
		  g.PenSize = 2
		  
		  ' Make active cell more distinct with an opaque background color
		  If (opacity = 1.0) Then
		    g.DrawingColor = Color.RGB(HighlightColor.Red, HighlightColor.Green, HighlightColor.Blue, 224)
		    g.FillRectangle(x, y, w, h)
		  End If
		  
		  g.DrawingColor = Color.RGB(highlightColor.Red, highlightColor.Green, highlightColor.Blue, CType(255 * (1 - opacity), Integer))
		  
		  ' Rectangle in grid cell, rounded corners inside
		  g.DrawRectangle(x, y, w, h)
		  g.DrawRoundRectangle(x, y, w, h, cornerRadius, cornerRadius)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawGrid(g As Graphics, cellSize As Double, N As Integer, boxWidth As Integer, boxHeight As Integer)
		  ' Draw the Sudoku grid lines
		  ' Hair lines at exact cell boundaries, thick lines offset by -PenSize/2
		  
		  ' Draw all thin "hair" lines first (gray) - skip outer border (0 and N)
		  g.DrawingColor = colGridlineHair
		  g.PenSize = 1
		  For i As Integer = 1 To N-1
		    ' Horizontal
		    g.DrawLine(0, i * cellSize, N * cellSize, i * cellSize)
		    ' Vertical
		    g.DrawLine(i * cellSize, 0, i * cellSize, N * cellSize)
		  Next
		  
		  ' Draw thicker block lines on top (inner box boundaries only, not outer)
		  g.DrawingColor = colGridline
		  g.PenSize = 2
		  For rowBlock As Integer = boxHeight To N - 1 Step boxHeight
		    ' Horizontal - offset by -PenSize/2
		    g.DrawLine(-g.PenSize/2, rowBlock * cellSize - g.PenSize/2, N * cellSize - g.PenSize/2, rowBlock * cellSize - g.PenSize/2)
		  Next
		  For colBlock As Integer = boxWidth To N - 1 Step boxWidth
		    ' Vertical - offset by -PenSize/2
		    g.DrawLine(colBlock * cellSize - g.PenSize/2, -g.PenSize/2, colBlock * cellSize - g.PenSize/2, N * cellSize - g.PenSize/2)
		  Next
		  
		  ' Draw thick outer border as a rectangle
		  g.DrawingColor = colGridline
		  g.PenSize = 2
		  Var gridSize As Double = N * cellSize
		  #If TargetLinux Then
		    g.DrawRectangle(0 - g.PenSize/2, 0 - g.PenSize/2, gridSize + g.PenSize, gridSize + g.PenSize)
		  #Else
		    g.DrawRectangle(0, 0, gridSize, gridSize)
		  #EndIf
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetCellAtPoint(x As Integer, y As Integer) As Pair
		  ' Returns a Pair of (row, col) for the cell at the given point
		  ' Returns (-1, -1) if outside the grid
		  
		  If (mSudokuPuzzle = Nil) Then Return New Pair(-1, -1)
		  
		  Var N As Integer = mSudokuPuzzle.GetGridSettings.N
		  Var cellSize As Double = Min(Me.Width, Me.Height) / N
		  
		  Var col As Integer = Floor(x / cellSize)
		  Var row As Integer = Floor(y / cellSize)
		  
		  If (row >= 0) And (row < N) And (col >= 0) And (col < N) Then
		    Return New Pair(row, col)
		  End If
		  
		  Return New Pair(-1, -1)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRequiredSize() As Integer
		  ' Returns the required size (width=height) for the canvas based on current puzzle
		  If (mSudokuPuzzle = Nil) Then Return kDefaultCellSize * 9
		  
		  Var N As Integer = mSudokuPuzzle.GetGridSettings.N
		  Return N * kDefaultCellSize
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetFirstEmptyCellAsActive()
		  ' Find and focus the first empty cell
		  If (mSudokuPuzzle = Nil) Then Return
		  
		  Var N As Integer = mSudokuPuzzle.GetGridSettings.N
		  
		  For row As Integer = 0 To N - 1
		    For col As Integer = 0 To N - 1
		      If mSudokuPuzzle.GetGridValue(row, col) = 0 Then
		        mActiveRow = row
		        mActiveCol = col
		        mPendingInput = ""
		        Return
		      End If
		    Next
		  Next
		  
		  ' No empty cell found, focus first cell
		  mActiveRow = 0
		  mActiveCol = 0
		  mPendingInput = ""
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowSudoku()
		  ' Re-activate focus to active cell, or first empty cell if none
		  If (mSudokuPuzzle = Nil) Then Return
		  
		  If (mActiveRow < 0) Or (mActiveCol < 0) Then
		    ' Find first empty cell
		    Me.SetFirstEmptyCellAsActive
		  End If
		  
		  Me.Refresh(False)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SudokuPuzzle(Assigns sudokuPuzzle As Sudoku.Puzzle)
		  ' Clear
		  Redim mCellCandidates(-1)
		  ReDim mCellHints(-1)
		  mPendingInput = ""
		  mActiveRow = -1
		  mActiveCol = -1
		  mHoverRow = -1
		  mHoverCol = -1
		  
		  ' New Sudoku Puzzle
		  mSudokuPuzzle = sudokuPuzzle
		  
		  ' ReDraw with new Sudoku Puzzle
		  Me.Refresh(False)
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ValueChanged()
	#tag EndHook


	#tag Note, Name = SudokuCanvas
		' ============================================================================
		' SudokuCanvas
		' ============================================================================
		'
		' Custom canvas control for displaying and interacting with Sudoku.Puzzle
		' Provides:
		' - Visual rendering of the Sudoku grid with cells, numbers, and candidates
		' - Mouse interaction for cell selection (click-to-select)
		' - Keyboard input for entering values and navigation (arrow keys)
		' - Visual hints for solvable cells and candidate exclusions
		' - Focus and hover state management
		'
		' ============================================================================
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private mActiveCol As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mActiveRow As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCellCandidates() As Sudoku.CellCandidates
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCellHints() As Sudoku.CellHint
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHasFocus As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHoverCol As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHoverRow As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMouseDownCol As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMouseDownRow As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPendingInput As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSudokuPuzzle As Sudoku.Puzzle
	#tag EndProperty


	#tag Constant, Name = kDefaultCellSize, Type = Double, Dynamic = False, Default = \"48", Scope = Private
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
			InitialValue=""
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
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocus"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

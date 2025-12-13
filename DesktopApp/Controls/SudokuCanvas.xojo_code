#tag Class
Protected Class SudokuCanvas
Inherits DesktopCanvas
	#tag Event
		Sub FocusLost()
		  ' Commit pending input when focus leaves the canvas
		  Me.CommitPendingInput
		  
		  ' Clear active cell indicator
		  mActiveRow = -1
		  mActiveCol = -1
		  Me.Refresh(False)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub FocusReceived()
		  ' Re-activate focus to active cell, or first empty cell if none
		  If (mSudokuPuzzle = Nil) Then Return
		  
		  If (mActiveRow < 0) Or (mActiveCol < 0) Then
		    ' Find first empty cell
		    Me.SetFocusToFirstEmptyCell
		  End If
		  
		  Me.Refresh(False)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(key As String) As Boolean
		  If (mSudokuPuzzle = Nil) Then Return False
		  If (mActiveRow < 0) Or (mActiveCol < 0) Then Return False
		  
		  Var N As Integer = mSudokuPuzzle.GetGridSettings.N
		  
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
		    ' Let default behavior happen (move to next control)
		    Me.CommitPendingInput
		    Return False
		    
		  Case Chr(8), Chr(127) ' Backspace, Delete
		    If mSudokuPuzzle.IsGridCellLocked(mActiveRow, mActiveCol) Then
		      Return True ' Ignore for locked cells
		    End If
		    
		    If N <= 9 Then
		      ' For N<=9: immediate clear
		      mSudokuPuzzle.SetGridValue(mActiveRow, mActiveCol) = 0
		      mPendingInput = ""
		      Me.Refresh(False)
		      RaiseEvent ValueChanged
		    Else
		      ' For N>9: remove last character from pending input
		      If mPendingInput.Length > 0 Then
		        mPendingInput = mPendingInput.Left(mPendingInput.Length - 1)
		        Me.Refresh(False)
		      Else
		        ' Clear the cell
		        mSudokuPuzzle.SetGridValue(mActiveRow, mActiveCol) = 0
		        Me.Refresh(False)
		        RaiseEvent ValueChanged
		      End If
		    End If
		    Return True
		    
		  End Select
		  
		  ' Locked cell - ignore input
		  If mSudokuPuzzle.IsGridCellLocked(mActiveRow, mActiveCol) Then
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
		    ' Block non-digit keys
		    Return True
		  End If
		  
		  ' For N>9: Allow entering digits 0-9 (multi-digit input)
		  If key >= "0" And key <= "9" Then
		    mPendingInput = mPendingInput + key
		    Me.Refresh(False)
		    Return True
		  End If
		  
		  ' Block everything else
		  Return True
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub KeyUp(key As String)
		  #Pragma unused key
		  ' Not needed for our implementation
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  #Pragma unused x
		  #Pragma unused y
		  
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
		  ' Clicking in a cell moves focus to it
		  If (mSudokuPuzzle = Nil) Then Return
		  
		  Var cellInfo As Pair = Me.GetCellAtPoint(x, y)
		  Var clickedRow As Integer = cellInfo.Left
		  Var clickedCol As Integer = cellInfo.Right
		  
		  If (clickedRow >= 0) And (clickedCol >= 0) Then
		    ' Commit any pending input before changing cell
		    Me.CommitPendingInput
		    
		    mActiveRow = clickedRow
		    mActiveCol = clickedCol
		    Me.Refresh(False)
		  End If
		  
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
		  If (mCellHints.LastIndex >= 0) Then
		    g.PenSize = 4
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
		  End If
		  
		  ' Draw thin "hair" grid lines (gray)
		  g.DrawingColor = colGridlineHair
		  g.PenSize = 1
		  For i As Integer = 1 To N-1
		    ' Horizontal
		    g.DrawLine(0, i * cellSize, N * cellSize, i * cellSize)
		    ' Vertical
		    g.DrawLine(i * cellSize, 0, i * cellSize, N * cellSize)
		  Next
		  
		  ' Draw thicker block lines on top
		  g.DrawingColor = colGridline
		  g.PenSize = 2
		  For rowBlock As Integer = 0 To N Step boxHeight
		    ' Horizontal
		    g.DrawLine(-g.PenSize/2, rowBlock * cellSize - g.PenSize/2, N * cellSize - g.PenSize/2, rowBlock * cellSize - g.PenSize/2)
		  Next
		  For colBlock As Integer = 0 To N Step boxWidth
		    ' Vertical
		    g.DrawLine(colBlock * cellSize - g.PenSize/2, -g.PenSize/2, colBlock * cellSize - g.PenSize/2, N * cellSize - g.PenSize/2)
		  Next
		  
		  ' Draw cell candidates
		  If (mCellCandidates.LastIndex >= 0) Then
		    Me.DrawCellCandidates(g, cellSize, N)
		  End If
		  
		  ' Draw numbers in cells
		  Me.DrawCellNumbers(g, cellSize, N)
		  
		  ' Draw hover indicator (half opacity)
		  If (mHoverRow >= 0) And (mHoverCol >= 0) Then
		    If (mHoverRow <> mActiveRow) Or (mHoverCol <> mActiveCol) Then
		      Me.DrawFocusIndicator(g, mHoverRow, mHoverCol, cellSize, 0.3)
		    End If
		  End If
		  
		  ' Draw active cell focus indicator
		  If (mActiveRow >= 0) And (mActiveCol >= 0) Then
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
		  ' Draw Cell Candidates around the cell number area
		  
		  ' Calculate the "text field" area (where the number goes) - roughly 60% of cell
		  Var textFieldRatio As Double = 0.6
		  Var textFieldSize As Double = cellSize * textFieldRatio
		  
		  ' Calculate margin areas (space between cell border and text area)
		  Var marginH As Double = (cellSize - textFieldSize) / 2
		  Var marginV As Double = (cellSize - textFieldSize) / 2
		  
		  ' Candidate slot layout based on N
		  Var slotsTop As Integer
		  Var slotsLeft As Integer
		  Var slotsRight As Integer
		  Var slotsBottom As Integer
		  
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
		    ' Fallback for any other N
		    slotsTop = (N + 3) \ 4
		    slotsBottom = (N + 3) \ 4
		    Var remaining As Integer = N - slotsTop - slotsBottom
		    slotsLeft = (remaining + 1) \ 2
		    slotsRight = remaining - slotsLeft
		  End Select
		  
		  g.FontSize = 8
		  g.PenSize = 1
		  
		  For Each h As Sudoku.CellCandidates In mCellCandidates
		    Var cellLeft As Double = h.Col * cellSize
		    Var cellTop As Double = h.Row * cellSize
		    
		    For Each candidate As Sudoku.Candidate In h.Candidates
		      If (candidate.Value < 1) Or (candidate.Value > N) Then Continue
		      If (candidate.Hint = Sudoku.CandidateHint.NoCandidate) Then Continue
		      
		      g.DrawingColor = If(Color.IsDarkMode, Color.LightGray, Color.DarkGray)
		      
		      Var idx As Integer = candidate.Value - 1
		      Var centerX As Double
		      Var centerY As Double
		      
		      ' Define the left and right X positions
		      Var leftX As Double = marginH / 2
		      Var rightX As Double = cellSize - marginH / 2
		      
		      If idx < slotsTop Then
		        ' Top row
		        If slotsTop = 1 Then
		          centerX = cellLeft + cellSize / 2
		        Else
		          Var fraction As Double = idx / (slotsTop - 1)
		          centerX = cellLeft + leftX + fraction * (rightX - leftX)
		        End If
		        centerY = cellTop + marginV / 2
		      ElseIf idx < slotsTop + slotsLeft + slotsRight Then
		        ' Middle section: interleave left and right
		        Var middleIdx As Integer = idx - slotsTop
		        Var slotHeight As Double = textFieldSize / Max(slotsLeft, 1)
		        If (middleIdx Mod 2) = 0 Then
		          ' Left side
		          Var leftIdx As Integer = middleIdx \ 2
		          centerX = cellLeft + leftX
		          centerY = cellTop + marginV + leftIdx * slotHeight + slotHeight / 2
		        Else
		          ' Right side
		          Var rightIdx As Integer = middleIdx \ 2
		          centerX = cellLeft + rightX
		          centerY = cellTop + marginV + rightIdx * slotHeight + slotHeight / 2
		        End If
		      Else
		        ' Bottom row
		        Var bottomIdx As Integer = idx - slotsTop - slotsLeft - slotsRight
		        If slotsBottom = 1 Then
		          centerX = cellLeft + cellSize / 2
		        Else
		          Var fraction As Double = bottomIdx / (slotsBottom - 1)
		          centerX = cellLeft + leftX + fraction * (rightX - leftX)
		        End If
		        centerY = cellTop + cellSize - marginV / 2
		      End If
		      
		      Var s As String = candidate.Value.ToString
		      Var textW As Double = g.TextWidth(s)
		      Var textH As Double = g.TextHeight(s, cellSize)
		      Var ascent As Double = g.FontAscent
		      Var xText As Double = centerX - textW / 2
		      Var yBase As Double = centerY + ascent - textH / 2
		      
		      g.DrawText(s, xText, yBase)
		      
		      ' Mark excluded candidates with a strike-through line
		      Var crossSize As Double = 8
		      
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
		      g.DrawLine(centerX - crossSize*0.25, centerY + crossSize*0.25, centerX + crossSize*0.25, centerY - crossSize*0.25)
		    Next
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawCellNumbers(g As Graphics, cellSize As Double, N As Integer)
		  ' Draw the numbers in each cell
		  
		  ' Calculate font size based on cell size
		  Var fontSize As Double = cellSize * 0.5
		  g.FontSize = fontSize
		  g.Bold = True
		  
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
		      
		      ' Set color based on locked state
		      If isLocked Then
		        g.DrawingColor = Color.TextColor
		      Else
		        g.DrawingColor = Color.HighlightColor
		      End If
		      
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
		  ' Draw a rounded rectangle focus indicator around the cell
		  
		  Var inset As Double = 3
		  Var cornerRadius As Double = 6
		  
		  Var x As Double = col * cellSize + inset
		  Var y As Double = row * cellSize + inset
		  Var w As Double = cellSize - 2 * inset
		  Var h As Double = cellSize - 2 * inset
		  
		  ' Use highlight color with opacity
		  Var highlightColor As Color = Color.HighlightColor
		  g.DrawingColor = Color.RGB(highlightColor.Red, highlightColor.Green, highlightColor.Blue, CType(255 * (1 - opacity), Integer))
		  
		  g.PenSize = 2
		  g.DrawRoundRectangle(x, y, w, h, cornerRadius, cornerRadius)
		  
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

	#tag Method, Flags = &h0
		Sub SetActiveCell(row As Integer, col As Integer)
		  ' Set the active cell programmatically
		  mActiveRow = row
		  mActiveCol = col
		  mPendingInput = ""
		  Me.Refresh(False)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFocusToFirstEmptyCell()
		  ' Find and focus the first empty cell
		  If (mSudokuPuzzle = Nil) Then Return
		  
		  Var N As Integer = mSudokuPuzzle.GetGridSettings.N
		  
		  For row As Integer = 0 To N - 1
		    For col As Integer = 0 To N - 1
		      If mSudokuPuzzle.GetGridValue(row, col) = 0 Then
		        mActiveRow = row
		        mActiveCol = col
		        mPendingInput = ""
		        Me.Refresh(False)
		        Return
		      End If
		    Next
		  Next
		  
		  ' No empty cell found, focus first cell
		  mActiveRow = 0
		  mActiveCol = 0
		  mPendingInput = ""
		  Me.Refresh(False)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowSudoku()
		  ' Refresh display and focus first empty cell
		  Me.Refresh(False)
		  Me.SetFocusToFirstEmptyCell
		  
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
		Private mHoverCol As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHoverRow As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPendingInput As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSudokuPuzzle As Sudoku.Puzzle
	#tag EndProperty


	#tag Constant, Name = kDefaultCellSize, Type = Double, Dynamic = False, Default = \"42", Scope = Private
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

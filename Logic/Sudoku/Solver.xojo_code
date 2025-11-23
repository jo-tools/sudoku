#tag Class
Private Class Solver
	#tag Method, Flags = &h0
		Sub Constructor(grid As Grid)
		  Me.grid = grid
		  Me.hintsSearcher = New HintsSearcher(grid)
		  Me.candidatesSearcher = New CandidatesSearcher(grid)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CountSolutions(limit As Integer = 2) As Integer
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  Var startStackCount As Integer = solveStack.Count
		  
		  ' Apply deterministic steps
		  While Me.SolveApplyDeterministicSteps
		    ' Once applied, maybe there are new ones,
		    ' so loop until nothing can be applied any longer
		  Wend
		  
		  ' Check if solved just with deterministic steps
		  Var row, col As Integer
		  If (Not Me.grid.FindEmpty(row, col)) Then
		    ' Count as one solution
		    Me.SolveUndoTo(startStackCount)
		    Return 1
		  End If
		  
		  ' Now we don't have any more cells to fill out with a certain value.
		  ' Let's start to guess the remaining empty cell's values...
		  
		  Var deterministicStepsStackCount As Integer = solveStack.Count
		  
		  ' Find to-be-solved cells with the least possible candidate values
		  Var bestRow As Integer = -1
		  Var bestCol As Integer = -1
		  Var bestCandidates() As Integer
		  
		  If (Not Me.SolveFindBestNextCell(bestRow, bestCol, bestCandidates)) Then
		    ' Invalid State - Rollback entirely and backtrack
		    Me.SolveUndoTo(startStackCount)
		    Return 0
		  End If
		  
		  If (bestRow < 0) Or (bestCol < 0) Then
		    ' Nothing more to solve
		    ' Count as one solution
		    Me.SolveUndoTo(startStackCount)
		    Return 1
		  End If
		  
		  ' Try the cell candidates (in the cell with the least possible candidates)
		  Var total As Integer = 0
		  For Each value As Integer In bestCandidates
		    ' Tentatively place value in the cell
		    Me.SolveApplyMove(Me.CreateSolveMove(bestRow, bestCol, Me.grid.Get(bestRow, bestCol), value))
		    
		    ' Recursively attempt to solve the rest of the grid
		    total = total + Me.CountSolutions(limit - total)
		    
		    ' Undo the move(s) before trying the next number in this cell
		    ' to see if they lead to another solution
		    ' The deterministic steps should be valid/unique, so keep them in the stack
		    Me.SolveUndoTo(deterministicStepsStackCount)
		    
		    If total >= limit Then
		      Exit
		    End If
		  Next
		  
		  ' None of the candidates resulted in a solved state, so rollback entirely and backtrack
		  Me.SolveUndoTo(startStackCount)
		  Return total
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CreateSolveMove(row As Integer, col As Integer, oldValue As Integer, newValue As Integer) As SolveMove
		  Var m As SolveMove
		  m.Row = row
		  m.Col = col
		  m.OldValue = oldValue
		  m.NewValue = newValue
		  
		  Return m
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetCountNonEmpty() As Integer
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  Var count As Integer = 0
		  
		  ' Count non empty cells
		  For row As Integer = 0 To N-1
		    For col As Integer = 0 To N-1
		      If Me.grid.Get(row, col) < 1 Then
		        Continue
		      End If
		      
		      count = count + 1
		    Next
		  Next
		  
		  Return count
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Invalidate()
		  cacheIsSolvable = IsSolvableState.Unknown
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsSolvable() As Boolean
		  Select Case cacheIsSolvable
		    
		  Case IsSolvableState.Solvable
		    Return True
		    
		  Case IsSolvableState.NotSolvable
		    Return False
		    
		  Else
		    
		    If (Not Me.IsValid(ValidCheck.AdvancedChecks)) Then
		      cacheIsSolvable = IsSolvableState.NotSolvable
		      Return False
		    End If
		    
		    If (Me.GetCountNonEmpty <= kTresholdAssumeIsSolvable) Then
		      ' Only check validity (above), skip heavy solving
		      ' Assume solvable for now (don’t trigger full backtracking)
		      ' Almost any sparse Sudoku with less than x numbers is solvable
		      cacheIsSolvable = IsSolvableState.Solvable
		      Return True
		      
		    Else
		      ' Try solve on a clone, so that this grid is not being modified
		      Var clone As New Solver(Me.grid.Clone)
		      If clone.Solve Then
		        cacheIsSolvable = IsSolvableState.Solvable
		        Return True
		      Else
		        cacheIsSolvable = IsSolvableState.NotSolvable
		        Return False
		      End If
		      
		    End If
		    
		  End Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsValid(checkType As ValidCheck) As Boolean
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  For row As Integer = 0 To N-1
		    For col As Integer = 0 To N-1
		      Var value As Integer = Me.grid.Get(row, col)
		      If value <> 0 Then
		        ' Temporarily remove the number
		        Me.grid.Set(row, col) = 0
		        
		        ' Check number in this cell
		        Var numIsValid As Boolean = Me.IsValueValid(row, col, value, checkType)
		        
		        ' Restore the number
		        Me.grid.Set(row, col) = value
		        
		        If (Not numIsValid) Then
		          Return False
		        End If
		      End If
		    Next
		  Next
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsValidBasicSudokuRules() As Boolean
		  ' Check Basic Sudoku Rules
		  Return IsValid(ValidCheck.BasicSudokuRules)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsValueValid(row As Integer, col As Integer, value As Integer, checkType As ValidCheck) As Boolean
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  ' Check Basic Sudoku Rules
		  If (Not Me.grid.IsValueValid(row, col, value)) Then Return False
		  
		  ' Advanced Checks: Naked Single, Hidden Single
		  If (checkType = ValidCheck.AdvancedChecks) Then
		    Var solveCellHint As CellHint = Me.hintsSearcher.Get(row, col)
		    Select Case solveCellHint.SolveHint
		    Case SolveHint.NakedSingle, SolveHint.HiddenSingle
		      If (solveCellHint.SolutionValue <> value) Then Return False
		    End Select
		  End If
		  
		  ' Passed all checks
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetStateIsSolvable()
		  cacheIsSolvable = IsSolvableState.Solvable
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Solve() As Boolean
		  Redim solveStack(-1)
		  
		  ' Ensure current filled-in digits are valid
		  If (Not Me.IsValid(ValidCheck.AdvancedChecks)) Then Return False
		  
		  Var solveResult As Boolean = Me.SolveInternal()
		  
		  If solveResult Then
		    cacheIsSolvable = IsSolvableState.Solvable
		  Else
		    cacheIsSolvable = IsSolvableState.NotSolvable
		  End If
		  
		  Redim solveStack(-1)
		  Return solveResult
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SolveApplyDeterministicSteps() As Boolean
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  ' Fill all deterministic cells (Naked singles and Hidden singles).
		  ' Returns True if we filled at least one cell (so caller can loop).
		  ' If an inconsistency is detected, return False.
		  
		  Var changed As Boolean = False
		  
		  Do
		    Var appliedThisPass As Boolean = False
		    Var cellHints() As CellHint = Me.hintsSearcher.GetCellHints()
		    
		    For Each h As CellHint In cellHints
		      ' Check that this move is still valid under current state
		      ' Note: No need to check with ValidCheck.AdvancedChecks since we got them from cellHints
		      If Me.IsValueValid(h.Row, h.Col, h.SolutionValue, ValidCheck.BasicSudokuRules) Then
		        ' Apply
		        Me.SolveApplyMove(Me.CreateSolveMove(h.Row, h.Col, Me.grid.Get(h.Row, h.Col), h.SolutionValue))
		        changed = True
		        appliedThisPass = True
		      Else
		        'Break
		      End If
		    Next
		    
		    ' If nothing could be applied in this pass, break out
		    If (Not appliedThisPass) Then Exit
		    
		    ' Since puzzle has changed: loop again and get fresh hint(s)
		  Loop
		  
		  Return changed
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SolveApplyMove(move As SolveMove)
		  ' Apply move to grid
		  ' And add move to solve stack (to make it un-doable)
		  Me.grid.Set(move.Row, move.Col) = move.NewValue
		  solveStack.Add(move)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SolveEnabled() As Boolean
		  ' Should the UI enable the Solve Button?
		  ' No valid Sudoku with unique solution can have fewer than 17 clues.
		  ' While even a blank Sudoku or one with just a couple of numbers
		  ' can be solved (without unique solution), that probably is not the
		  ' intent.
		  
		  Return Me.GetCountNonEmpty >= kTresholdSolveEnabled
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SolveFindBestNextCell(ByRef bestRow As Integer, ByRef bestCol As Integer, ByRef bestCandidates() As Integer) As Boolean
		  ' Find to-be-solved cells with the least possible candidate values
		  bestRow = -1
		  bestCol = -1
		  Redim bestCandidates(-1)
		  Var bestCount As Integer = 9999
		  
		  For row As Integer = 0 To N-1
		    For col As Integer = 0 To N-1
		      If (Me.grid.Get(row, col) > 0) Then Continue
		      
		      Var candidates() As Integer = Me.candidatesSearcher.GetAllCellCandidates(row, col)
		      If (candidates.Count < 1) Then
		        ' Invalid State
		        Return False
		      End If
		      
		      If (candidates.Count < bestCount) Then
		        bestCount = candidates.Count
		        bestRow = row
		        bestCol = col
		        bestCandidates = candidates
		        
		        If (bestCount = 1) Then Exit ' Already best cell with just one candidate
		      End If
		    Next
		    
		    If (bestCount = 1) Then Exit
		  Next
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SolveInternal() As Boolean
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  ' The Solver with Strategies is more performant with complex Sudoku puzzles
		  ' However, with e.g. nearly empty Sudoku's it takes much longer because of
		  ' the overhead of checking possible strategies.
		  
		  ' Let's just look at the current state of the Sudoku that needs to be solved.
		  ' If there are a certain amount of numbers placed and strategies are available,
		  ' then use the Solver with Strategies.
		  ' Otherwise use the plain Backtracking Solver (and hope it is faster ;-)
		  
		  Select Case Me.GetCountNonEmpty
		    
		  Case Is <= kTresholdSparse
		    ' Sparse: Use Backtracking
		    Return Me.SolveInternalWithBacktracking
		    
		  Case Is <= kTresholdMedium
		    ' Medium density: Try strategies if we find hints right away
		    Var hints() As CellHint = Me.hintsSearcher.GetCellHints
		    If hints.LastIndex >= 0 Then
		      Return Me.SolveInternalWithStrategies
		    Else
		      Return Me.SolveInternalWithBacktracking
		    End If
		    
		  Case Else
		    ' Dense: Strategies are almost always better
		    Return Me.SolveInternalWithStrategies
		    
		  End Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SolveInternalWithBacktracking() As Boolean
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  ' Remember stack position at entry
		  Var startStackCount As Integer = solveStack.Count
		  
		  Var row As Integer
		  Var col As Integer
		  
		  ' Find the next empty cell
		  ' If there are no empty cells left, the puzzle is solved
		  If Not Me.grid.FindEmpty(row, col) Then
		    Return True
		  End If
		  
		  ' Try all possible numbers (1-9) for this empty cell
		  Var tryNumberFrom As Integer = 1
		  Var tryNumberTo As Integer = N
		  
		  Var solveCellHint As CellHint = Me.hintsSearcher.Get(row, col)
		  Select Case solveCellHint.SolveHint
		  Case SolveHint.NakedSingle, SolveHint.HiddenSingle
		    ' No need to try all numbers, since we found a Naked/Hidden Single
		    tryNumberFrom = solveCellHint.SolutionValue
		    tryNumberTo = solveCellHint.SolutionValue
		  End Select
		  
		  For value As Integer = tryNumberFrom To tryNumberTo
		    ' Check if placing value here is allowed by Sudoku rules
		    ' Note: No need to check with ValidCheck.AdvancedChecks since we checked Naked/Hidden Singles in GetCellHint
		    If Me.IsValueValid(row, col, value, ValidCheck.BasicSudokuRules) Then
		      ' Tentatively place value in the cell
		      Me.SolveApplyMove(Me.CreateSolveMove(row, col, Me.grid.Get(row, col), value))
		      
		      ' Recursively attempt to solve the rest of the grid
		      If Me.SolveInternalWithBacktracking() Then
		        ' Success! If the recursive call returns True, the puzzle is solved
		        ' Propagate success back up the recursion chain
		        Return True
		      End If
		      
		      ' Backtracking
		      ' If recursion returned False, this value led to a dead end
		      ' Undo the move before trying the next number in this cell
		      Me.SolveUndoTo(startStackCount)
		    End If
		  Next
		  
		  ' All numbers failed in this cell (to fully solve with recursion)
		  ' Signal to the previous recursive call that it must backtrack
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SolveInternalWithStrategies() As Boolean
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  ' Remember stack position at entry
		  Var startStackCount As Integer = solveStack.Count
		  
		  ' Apply deterministic steps
		  While Me.SolveApplyDeterministicSteps
		    ' Once applied, maybe there are new ones,
		    ' so loop until nothing can be applied any longer
		  Wend
		  
		  ' Check if solved just with deterministic steps
		  Var row, col As Integer
		  If Not Me.grid.FindEmpty(row, col) Then
		    Return True
		  End If
		  
		  ' Now we don't have any more cells to fill out with a certain value.
		  ' Let's start to guess the remaining empty cell's values...
		  
		  Var deterministicStepsStackCount As Integer = solveStack.Count
		  
		  ' Find to-be-solved cells with the least possible candidate values
		  Var bestRow As Integer = -1
		  Var bestCol As Integer = -1
		  Var bestCandidates() As Integer
		  
		  If (Not Me.SolveFindBestNextCell(bestRow, bestCol, bestCandidates)) Then
		    ' Invalid State - Rollback entirely and backtrack
		    Me.SolveUndoTo(startStackCount)
		    Return False
		  End If
		  
		  If (bestRow < 0) Or (bestCol < 0) Then
		    ' Nothing more to solve
		    Return True
		  End If
		  
		  ' Try the cell candidates (in the cell with the least possible candidates)
		  For Each value As Integer In bestCandidates
		    ' Tentatively place value in the cell
		    Me.SolveApplyMove(Me.CreateSolveMove(bestRow, bestCol, Me.grid.Get(bestRow, bestCol), value))
		    
		    ' Recursively attempt to solve the rest of the grid
		    If Me.SolveInternalWithStrategies() Then
		      ' Success! If the recursive call returns True, the puzzle is solved
		      ' Propagate success back up the recursion chain
		      Return True
		    End If
		    
		    ' Backtracking
		    ' If recursion returned False, this value led to a dead end
		    ' Undo the move(s) before trying the next number in this cell
		    ' The deterministic steps should be valid, so keep them in the stack
		    Me.SolveUndoTo(deterministicStepsStackCount)
		  Next
		  
		  ' None of the candidates resulted in a solved state, so rollback entirely and backtrack
		  Me.SolveUndoTo(startStackCount)
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SolveUndoTo(stackSize As Integer)
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  ' Undo - re-apply old values
		  While solveStack.Count > stackSize
		    Var m As SolveMove = solveStack(solveStack.LastIndex)
		    Me.grid.Set(m.Row, m.Col) = m.OldValue
		    solveStack.RemoveAt(solveStack.LastIndex)
		  Wend
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private cacheIsSolvable As IsSolvableState = IsSolvableState.Unknown
	#tag EndProperty

	#tag Property, Flags = &h21
		Private candidatesSearcher As CandidatesSearcher
	#tag EndProperty

	#tag Property, Flags = &h21
		Private grid As Grid
	#tag EndProperty

	#tag Property, Flags = &h21
		Private hintsSearcher As HintsSearcher
	#tag EndProperty

	#tag Property, Flags = &h21
		Private solveStack() As SolveMove
	#tag EndProperty


	#tag Constant, Name = kTresholdAssumeIsSolvable, Type = Double, Dynamic = False, Default = \"14", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kTresholdMedium, Type = Double, Dynamic = False, Default = \"25", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kTresholdSolveEnabled, Type = Double, Dynamic = False, Default = \"17", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kTresholdSparse, Type = Double, Dynamic = False, Default = \"12", Scope = Private
	#tag EndConstant


	#tag Structure, Name = SolveMove, Flags = &h21
		Row As Integer
		  Col As Integer
		  OldValue As Integer
		NewValue As Integer
	#tag EndStructure


	#tag Enum, Name = IsSolvableState, Type = Integer, Flags = &h21
		Unknown = 0
		  NotSolvable = 1
		Solvable = 2
	#tag EndEnum

	#tag Enum, Name = ValidCheck, Type = Integer, Flags = &h21
		BasicSudokuRules = 1
		AdvancedChecks=2
	#tag EndEnum


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
			InitialValue="-2147483648"
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
	#tag EndViewBehavior
End Class
#tag EndClass

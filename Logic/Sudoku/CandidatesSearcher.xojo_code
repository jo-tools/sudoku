#tag Class
Private Class CandidatesSearcher
	#tag Method, Flags = &h21
		Private Sub ApplyFilters(exclusionParams As Sudoku.ExclusionParams)
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  Var foundExclusion As Boolean = True
		  
		  ' Applying Filters might reveal new Exclusions
		  ' So loop until we don't find anything new to be excluded
		  While foundExclusion = True
		    foundExclusion = False
		    
		    ' Apply all filters
		    If exclusionParams.ExcludeLockedCandidates And FilterLockedCandidates Then
		      foundExclusion = True
		      Continue
		    End If
		    
		    If exclusionParams.ExcludeNakedSubsets And FilterNakedSubsets Then
		      foundExclusion = True
		      Continue
		    End If
		    
		    If exclusionParams.ExcludeHiddenSubsets And FilterHiddenSubsets Then
		      foundExclusion = True
		      Continue
		    End If
		    
		    If exclusionParams.ExcludeXWing And FilterXWing Then
		      foundExclusion = True
		      Continue
		    End If
		  Wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(grid As Grid)
		  Me.grid = grid
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FilterHiddenSubsets() As Boolean
		  #Pragma DisableBackgroundTasks
		  
		  Var foundExclusion As Boolean
		  
		  ' Note: Currently Hardcoded for 9x9 Sudoku
		  For r As Integer = 0 To 8
		    If FilterHiddenSubsetsProcessUnit(GetRowIndices(r)) Then foundExclusion = True
		  Next
		  For c As Integer = 0 To 8
		    If FilterHiddenSubsetsProcessUnit(GetColIndices(c)) Then foundExclusion = True
		  Next
		  For br As Integer = 0 To 2
		    For bc As Integer = 0 To 2
		      If FilterHiddenSubsetsProcessUnit(GetBlockIndices(br, bc)) Then foundExclusion = True
		    Next
		  Next
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FilterHiddenSubsetsProcessUnit(unitPositions() As Integer) As Boolean
		  Var cells() As Integer
		  For Each p As Integer In unitPositions
		    If HasCandidates(cellCandidates(p)) Then cells.Add(p)
		  Next
		  If cells.Count < 2 Then Return False
		  
		  Var valueList() As Integer
		  Var valueCellsList() As Variant
		  For value As Integer = 1 To 9
		    Var occ() As Integer
		    For Each ci As Integer In cells
		      For k As Integer = 0 To 8
		        If cellCandidates(ci).Candidates(k).Hint = CandidateHint.Candidate And cellCandidates(ci).Candidates(k).Value = value Then
		          occ.Add(ci)
		          Exit
		        End If
		      Next
		    Next
		    If occ.Count > 0 Then
		      valueList.Add(value)
		      valueCellsList.Add(occ)
		    End If
		  Next
		  If valueList.Count < 2 Then Return False
		  
		  Var foundExclusion As Boolean
		  
		  Var maxSubset As Integer = Min(4, valueList.Count)
		  Var tmpIdx(3) As Integer
		  For subsetSize As Integer = 2 To maxSubset
		    If FilterHiddenSubsetsProcessUnitRecurse(cells, valueList, valueCellsList, subsetSize, 0, 0, tmpIdx) Then foundExclusion = True
		  Next
		  
		  Return foundExclusion
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FilterHiddenSubsetsProcessUnitRecurse(cells() As Integer, valueList() As Integer, valueCellsList() As Variant, subsetSize As Integer, start As Integer, level As Integer, currentIdx() As Integer) As Boolean
		  Var foundExclusion As Boolean
		  
		  Var n As Integer = valueList.Count
		  If level = subsetSize Then
		    Var unionCells() As Integer
		    For i As Integer = 0 To subsetSize - 1
		      Var vci() As Integer = valueCellsList(currentIdx(i))
		      For Each cidx As Integer In vci
		        If unionCells.IndexOf(cidx) = -1 Then unionCells.Add(cidx)
		      Next
		    Next
		    If unionCells.Count = subsetSize Then
		      Var allowedVals() As Integer
		      For i As Integer = 0 To subsetSize - 1
		        allowedVals.Add(valueList(currentIdx(i)))
		      Next
		      For Each ci as integer In unionCells
		        For k As Integer = 0 To 8
		          If cellCandidates(ci).Candidates(k).Hint = CandidateHint.Candidate Then
		            If allowedVals.IndexOf(cellCandidates(ci).Candidates(k).Value) = -1 Then
		              cellCandidates(ci).Candidates(k).Hint = CandidateHint.ExcludedAsHiddenSubset
		              foundExclusion = True
		            End If
		          End If
		        Next
		      Next
		    End If
		    
		    return foundExclusion
		  End If
		  
		  Var maxStart As Integer = n - (subsetSize - level)
		  For i As Integer = start To maxStart
		    currentIdx(level) = i
		    If FilterHiddenSubsetsProcessUnitRecurse(cells, valueList, valueCellsList, subsetSize, i + 1, level + 1, currentIdx) Then foundExclusion = True
		  Next
		  
		  Return foundExclusion
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FilterLockedCandidates() As Boolean
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  Var foundExclusion As Boolean
		  
		  ' Note: Currently Hardcoded for 9x9 Sudoku
		  For blockRow As Integer = 0 To 2
		    For blockCol As Integer = 0 To 2
		      Var blockR As Integer = blockRow * 3
		      Var blockC As Integer = blockCol * 3
		      
		      For value As Integer = 1 To 9
		        Var positions() As Integer
		        For rr As Integer = blockR To blockR + 2
		          For cc As Integer = blockC To blockC + 2
		            Var idx As Integer = rr * 9 + cc
		            If HasCandidates(cellCandidates(idx)) Then
		              For k As Integer = 0 To 8
		                Var cand As Candidate = cellCandidates(idx).Candidates(k)
		                If cand.Hint = CandidateHint.Candidate and cand.Value = value Then
		                  positions.Add(idx)
		                  Exit For
		                End If
		              Next
		            End If
		          Next
		        Next
		        
		        If positions.Count = 0 Then Continue
		        
		        Var sameRow As Boolean = True
		        Var sameCol As Boolean = True
		        Var firstR As Integer = positions(0) \ 9
		        Var firstC As Integer = positions(0) Mod 9
		        
		        For i As Integer = 1 To positions.LastIndex
		          If (positions(i) \ 9) <> firstR Then sameRow = False
		          If (positions(i) Mod 9) <> firstC Then sameCol = False
		        Next
		        
		        If (Not sameRow) And (Not sameCol) Then Continue
		        
		        ' Remove outside-block candidates
		        If sameRow Then
		          For cc As Integer = 0 To 8
		            If cc >= blockC And cc <= blockC + 2 Then Continue
		            Var idx2 As Integer = firstR * 9 + cc
		            If HasCandidates(cellCandidates(idx2)) Then
		              For k As Integer = 0 To 8
		                If cellCandidates(idx2).Candidates(k).Hint = CandidateHint.Candidate And cellCandidates(idx2).Candidates(k).Value = value Then
		                  cellCandidates(idx2).Candidates(k).Hint = CandidateHint.ExcludedAsLockedCandidate
		                  foundExclusion = True
		                End If
		              Next
		            End If
		          Next
		        End If
		        
		        If sameCol Then
		          For rr As Integer = 0 To 8
		            If rr >= blockR And rr <= blockR + 2 Then Continue For
		            Var idx2 As Integer = rr * 9 + firstC
		            If HasCandidates(cellCandidates(idx2)) Then
		              For k As Integer = 0 To 8
		                If cellCandidates(idx2).Candidates(k).Hint = CandidateHint.Candidate And cellCandidates(idx2).Candidates(k).Value = value Then
		                  cellCandidates(idx2).Candidates(k).Hint = CandidateHint.ExcludedAsLockedCandidate
		                  foundExclusion = True
		                End If
		              Next
		            End If
		          Next
		        End If
		        
		      Next
		    Next
		  Next
		  
		  Return foundExclusion
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FilterNakedSubsets() As Boolean
		  #Pragma DisableBackgroundTasks
		  
		  Var foundExclusion As Boolean
		  
		  ' Note: Currently Hardcoded for 9x9 Sudoku
		  For r As Integer = 0 To 8
		    If FilterNakedSubsetsProcessUnit(GetRowIndices(r)) Then foundExclusion = True
		  Next
		  For c As Integer = 0 To 8
		    If FilterNakedSubsetsProcessUnit(GetColIndices(c)) Then foundExclusion = True
		  Next
		  For br As Integer = 0 To 2
		    For bc As Integer = 0 To 2
		      If FilterNakedSubsetsProcessUnit(GetBlockIndices(br, bc)) Then foundExclusion = True
		    Next
		  Next
		  
		  Return foundExclusion
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FilterNakedSubsetsProcessUnit(unitPositions() As Integer) As Boolean
		  Var cells() As Integer
		  For Each p As Integer In unitPositions
		    If HasCandidates(cellCandidates(p)) Then cells.Add(p)
		  Next
		  If cells.Count < 2 Then Return False
		  
		  Var candList() As Variant
		  For Each ci As Integer In cells
		    Var list() As Integer
		    For k As Integer = 0 To 8
		      If cellCandidates(ci).Candidates(k).Hint = CandidateHint.Candidate Then
		        list.Add(cellCandidates(ci).Candidates(k).Value)
		      End If
		    Next
		    candList.Add(list)
		  Next
		  If candList.Count < 2 Then Return False
		  
		  Var foundExclusion As Boolean
		  
		  Var maxSubset As Integer = Min(4, candList.Count)
		  Var tmpIdx(3) As Integer
		  For subsetSize As Integer = 2 To maxSubset
		    If FilterNakedSubsetsProcessUnitRecurse(cells, candList, subsetSize, 0, 0, tmpIdx) Then foundExclusion = True
		  Next
		  
		  Return foundExclusion
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FilterNakedSubsetsProcessUnitRecurse(cells() As Integer, candList() As Variant, subsetSize As Integer, start As Integer, level As Integer, currentIdx() As Integer) As Boolean
		  Var foundExclusion As Boolean
		  
		  Var n As Integer = candList.Count
		  
		  If level = subsetSize Then
		    ' unionVals will hold all values in the selected subset
		    Var unionVals() As Integer
		    
		    For i As Integer = 0 To subsetSize - 1
		      Var candArr() As Integer = candList(currentIdx(i))  ' cast Variant → Integer()
		      For j As Integer = 0 To candArr.LastIndex
		        If unionVals.IndexOf(candArr(j)) = -1 Then unionVals.Add(candArr(j))
		      Next
		    Next
		    
		    ' Check if union size equals subset size
		    If unionVals.Count = subsetSize Then
		      For other As Integer = 0 To cells.LastIndex
		        ' Skip cells that are part of the subset
		        Var inSubset As Boolean = False
		        For i As Integer = 0 To subsetSize - 1
		          If currentIdx(i) = other Then
		            inSubset = True
		            Exit
		          End If
		          
		        Next
		        If inSubset Then Continue
		        
		        Var ciOther As Integer = cells(other)
		        For k As Integer = 0 To 8
		          If cellCandidates(ciOther).Candidates(k).Hint = CandidateHint.Candidate And _
		            unionVals.IndexOf(cellCandidates(ciOther).Candidates(k).Value) <> -1 Then
		            cellCandidates(ciOther).Candidates(k).Hint = CandidateHint.ExcludedAsNakedSubset
		            foundExclusion = True
		          End If
		        Next
		      Next
		    End If
		    
		    Return foundExclusion
		  End If
		  
		  ' Recursive combination
		  Var maxStart As Integer = n - (subsetSize - level)
		  For i As Integer = start To maxStart
		    currentIdx(level) = i
		    If FilterNakedSubsetsProcessUnitRecurse(cells, candList, subsetSize, i + 1, level + 1, currentIdx) Then foundExclusion = True
		  Next
		  
		  Return foundExclusion
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FilterXWing() As Boolean
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  Var foundExclusion As Boolean
		  
		  ' Note: Currently Hardcoded for 9x9 Sudoku
		  For v As Integer = 1 To 9
		    ' Row-based X-Wing
		    Var rowCols(8) As Variant
		    For r As Integer = 0 To 8
		      Var cols() As Integer
		      For c As Integer = 0 To 8
		        Var idx As Integer = r*9 + c
		        If cellCandidates(idx).Candidates(v-1).Hint = CandidateHint.Candidate Then
		          cols.Add(c)
		        End If
		      Next
		      rowCols(r) = cols
		    Next
		    If FilterXWingFindPairs(rowCols, v, True) Then foundExclusion = True
		    
		    ' Column-based X-Wing
		    Var colRows(8) As Variant
		    For c As Integer = 0 To 8
		      Var rows() As Integer
		      For r As Integer = 0 To 8
		        Var idx As Integer = r*9 + c
		        If cellCandidates(idx).Candidates(v-1).Hint = CandidateHint.Candidate Then
		          rows.Add(r)
		        End If
		      Next
		      colRows(c) = rows
		    Next
		    If FilterXWingFindPairs(colRows, v, False) Then foundExclusion = True
		  Next
		  
		  return foundExclusion
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FilterXWingFindPairs(lines() As Variant, v As Integer, isRow As Boolean) As Boolean
		  Var foundExclusion As Boolean
		  
		  ' Compare all pairs of lines (rows or columns)
		  For l1 As Integer = 0 To 7
		    Var indices1() As Integer = lines(l1)
		    If indices1.Count <> 2 Then Continue  ' X-Wing only
		    For l2 As Integer = l1 + 1 To 8
		      Var indices2() As Integer = lines(l2)
		      If indices2.Count <> 2 Then Continue
		      
		      ' Same candidate positions -> X-Wing found
		      If indices1(0) = indices2(0) And indices1(1) = indices2(1) Then
		        ' Exclude candidate from other lines
		        For line As Integer = 0 To 8
		          If line = l1 Or line = l2 Then Continue
		          For i As Integer = 0 To 1
		            Var idx As Integer
		            If isRow Then
		              idx = line*9 + indices1(i)
		            Else
		              idx = indices1(i)*9 + line
		            End If
		            Var hint As CandidateHint = cellCandidates(idx).Candidates(v-1).Hint
		            If hint = CandidateHint.Candidate Then
		              cellCandidates(idx).Candidates(v-1).Hint = CandidateHint.ExcludedAsXWing
		              foundExclusion = true
		            End If
		          Next
		        Next
		      End If
		    Next
		  Next
		  
		  Return foundExclusion
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Get(exclusionParams As Sudoku.ExclusionParams) As CellCandidates()
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  ' Reset Array for each Sudoku Cell
		  Redim cellCandidates(-1)
		  cellCandidates.ResizeTo(N*N-1)
		  
		  ' Fill Solve Cell Candidates
		  For row As Integer = 0 To N-1
		    For col As Integer = 0 To N-1
		      Var idx As Integer = row * N + col
		      
		      Var c As CellCandidates
		      c.Row = row
		      c.Col = col
		      
		      If Me.grid.Get(row, col) = 0 Then
		        ' Empty Cell - has Candidates
		        Var candidates() As Integer = GetAllCellCandidates(row, col)
		        For v As Integer = 1 To N
		          Var cand As Candidate
		          cand.Value = v
		          If candidates.IndexOf(v) >= 0 Then
		            cand.Hint = CandidateHint.Candidate
		          Else
		            cand.Hint = CandidateHint.NoCandidate
		          End If
		          c.Candidates(v - 1) = cand
		        Next
		      Else
		        ' Non-Empty Cell: No Candidates
		        For v As Integer = 1 To N
		          Var cand As Candidate
		          cand.Value = v
		          cand.Hint = CandidateHint.NoCandidate
		          c.Candidates(v - 1) = cand
		        Next
		      End If
		      
		      cellCandidates(idx) = c
		    Next
		  Next
		  
		  ApplyFilters(exclusionParams)
		  
		  Return cellCandidates
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAllCellCandidates(row As Integer, col As Integer) As Integer()
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  ' Return candidate values for cell according to Basic Sudoku Rules
		  Var candidates() As Integer
		  If (Me.grid.Get(row, col) > 0) Then Return candidates
		  
		  For value As Integer = 1 To N
		    If Me.grid.IsValueValid(row, col, value) Then
		      candidates.Add(value)
		    End If
		  Next
		  
		  Return candidates
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetBlockIndices(blockRow As Integer, blockCol As Integer) As Integer()
		  Var pos(8) As Integer
		  Var idx As Integer = 0
		  For r As Integer = blockRow * 3 To blockRow * 3 + 2
		    For c As Integer = blockCol * 3 To blockCol * 3 + 2
		      pos(idx) = r * 9 + c
		      idx = idx + 1
		    Next
		  Next
		  Return pos
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetColIndices(col As Integer) As Integer()
		  Var pos(8) As Integer
		  For row As Integer = 0 To 8
		    pos(row) = row * 9 + col
		  Next
		  Return pos
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetRowIndices(row As Integer) As Integer()
		  Var pos(8) As Integer
		  For col As Integer = 0 To 8
		    pos(col) = row * 9 + col
		  Next
		  Return pos
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HasCandidates(c As CellCandidates) As Boolean
		  For k As Integer = 0 To 8
		    If c.Candidates(k).Hint = CandidateHint.Candidate Then Return True
		  Next
		  Return False
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private cellCandidates() As CellCandidates
	#tag EndProperty

	#tag Property, Flags = &h21
		Private grid As Grid
	#tag EndProperty


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

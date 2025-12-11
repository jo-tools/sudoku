#tag Class
Private Class CandidatesSearcher
	#tag Method, Flags = &h21
		Private Sub ApplyFilters(exclusionParams As Sudoku.ExclusionParams)
		  #Pragma DisableBoundsChecking
		  
		  ' Run all enabled exclusion filters until no more candidates change.
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
		  mGrid = Grid
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FilterHiddenSubsets() As Boolean
		  #Pragma DisableBoundsChecking
		  
		  ' Look for hidden pairs/triples/quads in each row, column and block.
		  Var foundExclusion As Boolean
		  
		  Var N As Integer = mGrid.Settings.N
		  Var blockRows As Integer = N \ mGrid.Settings.BoxHeight
		  Var blockCols As Integer = N \ mGrid.Settings.BoxWidth
		  
		  ' Process all rows.
		  For r As Integer = 0 To N - 1
		    If FilterHiddenSubsetsProcessUnit(GetRowIndices(r)) Then foundExclusion = True
		  Next
		  ' Process all columns.
		  For c As Integer = 0 To N - 1
		    If FilterHiddenSubsetsProcessUnit(GetColIndices(c)) Then foundExclusion = True
		  Next
		  ' Process all blocks.
		  For br As Integer = 0 To blockRows - 1
		    For bc As Integer = 0 To blockCols - 1
		      If FilterHiddenSubsetsProcessUnit(GetBlockIndices(br, bc)) Then foundExclusion = True
		    Next
		  Next
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FilterHiddenSubsetsProcessUnit(unitPositions() As Integer) As Boolean
		  #Pragma DisableBoundsChecking
		  
		  ' Work on a single unit (row/column/block) and search for hidden subsets.
		  Var N As Integer = mGrid.Settings.N
		  
		  ' Collect only cells in this unit that still have candidates.
		  Var cells() As Integer
		  For Each p As Integer In unitPositions
		    If HasCandidates(mCellCandidates(p)) Then cells.Add(p)
		  Next
		  If cells.Count < 2 Then Return False
		  
		  ' For each value, remember in which cells of this unit it can still appear.
		  Var valueList() As Integer
		  Var valueCellsList() As Variant
		  For value As Integer = 1 To N
		    Var occ() As Integer
		    For Each ci As Integer In cells
		      For k As Integer = 0 To N - 1
		        If mCellCandidates(ci).Candidates(k).Hint = CandidateHint.Candidate And mCellCandidates(ci).Candidates(k).Value = value Then
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
		  
		  ' Try all combinations of 2..kMaxSubsetSize values to see if they form a hidden subset.
		  ' We deliberately limit the subset size to pairs/triples/quads for
		  ' performance reasons, especially on larger grids.
		  Var maxSubset As Integer = Min(kMaxSubsetSize, valueList.Count)
		  Var tmpIdx(kMaxSubsetSize - 1) As Integer
		  For subsetSize As Integer = 2 To maxSubset
		    If FilterHiddenSubsetsProcessUnitRecurse(cells, valueList, valueCellsList, subsetSize, 0, 0, tmpIdx) Then foundExclusion = True
		  Next
		  
		  Return foundExclusion
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FilterHiddenSubsetsProcessUnitRecurse(cells() As Integer, valueList() As Integer, valueCellsList() As Variant, subsetSize As Integer, start As Integer, level As Integer, currentIdx() As Integer) As Boolean
		  #Pragma DisableBoundsChecking
		  
		  ' Recursively build combinations of values and check if they form a hidden subset.
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
		    ' If the union of cells matches the subset size, we have a hidden subset.
		    ' These values only occur in this exact set of cells → remove other values there.
		    If unionCells.Count = subsetSize Then
		      Var allowedVals() As Integer
		      For i As Integer = 0 To subsetSize - 1
		        allowedVals.Add(valueList(currentIdx(i)))
		      Next
		      For Each ci as integer In unionCells
		        For k As Integer = 0 To mGrid.Settings.N - 1
		          If mCellCandidates(ci).Candidates(k).Hint = CandidateHint.Candidate Then
		            If allowedVals.IndexOf(mCellCandidates(ci).Candidates(k).Value) = -1 Then
		              mCellCandidates(ci).Candidates(k).Hint = CandidateHint.ExcludedAsHiddenSubset
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
		  #Pragma DisableBoundsChecking
		  
		  ' Detect "locked candidates" inside a block and remove that value
		  ' from the rest of the affected row/column outside the block.
		  Var foundExclusion As Boolean
		  
		  Var N As Integer = mGrid.Settings.N
		  Var boxW As Integer = mGrid.Settings.BoxWidth
		  Var boxH As Integer = mGrid.Settings.BoxHeight
		  Var blockRows As Integer = N \ boxH
		  Var blockCols As Integer = N \ boxW
		  
		  For blockRow As Integer = 0 To blockRows - 1
		    For blockCol As Integer = 0 To blockCols - 1
		      Var blockR As Integer = blockRow * boxH
		      Var blockC As Integer = blockCol * boxW
		      
		      For value As Integer = 1 To N
		        Var positions() As Integer
		        ' Collect all cells in this block that still allow this value.
		        For rr As Integer = blockR To blockR + boxH - 1
		          For cc As Integer = blockC To blockC + boxW - 1
		            Var idx As Integer = rr * N + cc
		            If HasCandidates(mCellCandidates(idx)) Then
		              For k As Integer = 0 To N - 1
		                Var cand As Candidate = mCellCandidates(idx).Candidates(k)
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
		        Var firstR As Integer = positions(0) \ N
		        Var firstC As Integer = positions(0) Mod N
		        
		        ' Check if all candidate cells lie in a single row or column.
		        For i As Integer = 1 To positions.LastIndex
		          If (positions(i) \ N) <> firstR Then sameRow = False
		          If (positions(i) Mod N) <> firstC Then sameCol = False
		        Next
		        
		        If (Not sameRow) And (Not sameCol) Then Continue
		        
		        ' Remove candidates for this value from the same row/column
		        ' outside the current block.
		        If sameRow Then
		          For cc As Integer = 0 To N - 1
		            If cc >= blockC And cc <= blockC + boxW - 1 Then Continue
		            Var idx2 As Integer = firstR * N + cc
		            If HasCandidates(mCellCandidates(idx2)) Then
		              For k As Integer = 0 To N - 1
		                If mCellCandidates(idx2).Candidates(k).Hint = CandidateHint.Candidate And mCellCandidates(idx2).Candidates(k).Value = value Then
		                  mCellCandidates(idx2).Candidates(k).Hint = CandidateHint.ExcludedAsLockedCandidate
		                  foundExclusion = True
		                End If
		              Next
		            End If
		          Next
		        End If
		        
		        If sameCol Then
		          For rr As Integer = 0 To N - 1
		            If rr >= blockR And rr <= blockR + boxH - 1 Then Continue For
		            Var idx2 As Integer = rr * N + firstC
		            If HasCandidates(mCellCandidates(idx2)) Then
		              For k As Integer = 0 To N - 1
		                If mCellCandidates(idx2).Candidates(k).Hint = CandidateHint.Candidate And mCellCandidates(idx2).Candidates(k).Value = value Then
		                  mCellCandidates(idx2).Candidates(k).Hint = CandidateHint.ExcludedAsLockedCandidate
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
		  #Pragma DisableBoundsChecking
		  
		  ' Look for naked pairs/triples/quads in each row, column and block.
		  Var foundExclusion As Boolean
		  
		  Var N As Integer = mGrid.Settings.N
		  Var blockRows As Integer = N \ mGrid.Settings.BoxHeight
		  Var blockCols As Integer = N \ mGrid.Settings.BoxWidth
		  
		  For r As Integer = 0 To N - 1
		    If FilterNakedSubsetsProcessUnit(GetRowIndices(r)) Then foundExclusion = True
		  Next
		  For c As Integer = 0 To N - 1
		    If FilterNakedSubsetsProcessUnit(GetColIndices(c)) Then foundExclusion = True
		  Next
		  For br As Integer = 0 To blockRows - 1
		    For bc As Integer = 0 To blockCols - 1
		      If FilterNakedSubsetsProcessUnit(GetBlockIndices(br, bc)) Then foundExclusion = True
		    Next
		  Next
		  
		  Return foundExclusion
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FilterNakedSubsetsProcessUnit(unitPositions() As Integer) As Boolean
		  #Pragma DisableBoundsChecking
		  
		  ' Work on a single unit and look for cells that share the same small
		  ' candidate set (naked pairs/triples/quads).
		  Var N As Integer = mGrid.Settings.N
		  
		  Var cells() As Integer
		  For Each p As Integer In unitPositions
		    If HasCandidates(mCellCandidates(p)) Then cells.Add(p)
		  Next
		  If cells.Count < 2 Then Return False
		  
		  ' Build a list of candidate values for each cell in this unit.
		  Var candList() As Variant
		  For Each ci As Integer In cells
		    Var list() As Integer
		    For k As Integer = 0 To N - 1
		      If mCellCandidates(ci).Candidates(k).Hint = CandidateHint.Candidate Then
		        list.Add(mCellCandidates(ci).Candidates(k).Value)
		      End If
		    Next
		    candList.Add(list)
		  Next
		  If candList.Count < 2 Then Return False
		  
		  Var foundExclusion As Boolean
		  
		  ' Try all combinations of 2..kMaxSubsetSize cells to see if their union of values
		  ' matches the subset size (naked subset detected).
		  ' We deliberately limit the subset size to pairs/triples/quads for
		  ' performance reasons, especially on larger grids.
		  Var maxSubset As Integer = Min(kMaxSubsetSize, candList.Count)
		  Var tmpIdx(kMaxSubsetSize - 1) As Integer
		  For subsetSize As Integer = 2 To maxSubset
		    If FilterNakedSubsetsProcessUnitRecurse(cells, candList, subsetSize, 0, 0, tmpIdx) Then foundExclusion = True
		  Next
		  
		  Return foundExclusion
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FilterNakedSubsetsProcessUnitRecurse(cells() As Integer, candList() As Variant, subsetSize As Integer, start As Integer, level As Integer, currentIdx() As Integer) As Boolean
		  #Pragma DisableBoundsChecking
		  
		  ' Recursively build combinations of cells and check if they form a naked subset.
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
		        For k As Integer = 0 To mGrid.Settings.N - 1
		          If mCellCandidates(ciOther).Candidates(k).Hint = CandidateHint.Candidate And _
		            unionVals.IndexOf(mCellCandidates(ciOther).Candidates(k).Value) <> -1 Then
		            mCellCandidates(ciOther).Candidates(k).Hint = CandidateHint.ExcludedAsNakedSubset
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
		  #Pragma DisableBoundsChecking
		  
		  ' Search for X-Wing patterns for each value across rows and columns.
		  Var foundExclusion As Boolean
		  
		  Var N As Integer = mGrid.Settings.N
		  
		  For v As Integer = 1 To N
		    ' Row-based X-Wing: find rows where value v appears in exactly two columns.
		    Var rowCols() As Variant
		    Redim rowCols(N - 1)
		    For r As Integer = 0 To N - 1
		      Var cols() As Integer
		      For c As Integer = 0 To N - 1
		        Var idx As Integer = r * N + c
		        If mCellCandidates(idx).Candidates(v-1).Hint = CandidateHint.Candidate Then
		          cols.Add(c)
		        End If
		      Next
		      rowCols(r) = cols
		    Next
		    If FilterXWingFindPairs(rowCols, v, True) Then foundExclusion = True
		    
		    ' Column-based X-Wing: same idea, but swap roles of rows/columns.
		    Var colRows() As Variant
		    Redim colRows(N - 1)
		    For c As Integer = 0 To N - 1
		      Var rows() As Integer
		      For r As Integer = 0 To N - 1
		        Var idx As Integer = r * N + c
		        If mCellCandidates(idx).Candidates(v-1).Hint = CandidateHint.Candidate Then
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
		  #Pragma DisableBoundsChecking
		  
		  ' Given candidate positions per line (row/column), find pairs of lines
		  ' that share the same two positions and eliminate v elsewhere in those
		  ' columns/rows (classic X-Wing elimination).
		  Var foundExclusion As Boolean
		  
		  Var N As Integer = mGrid.Settings.N
		  
		  ' Compare all pairs of lines (rows or columns)
		  For l1 As Integer = 0 To N - 2
		    Var indices1() As Integer = lines(l1)
		    If indices1.Count <> 2 Then Continue  ' X-Wing only
		    For l2 As Integer = l1 + 1 To N - 1
		      Var indices2() As Integer = lines(l2)
		      If indices2.Count <> 2 Then Continue
		      
		      ' Same candidate positions -> X-Wing found
		      If indices1(0) = indices2(0) And indices1(1) = indices2(1) Then
		        ' Exclude candidate from other lines
		        For line As Integer = 0 To N - 1
		          If line = l1 Or line = l2 Then Continue
		          For i As Integer = 0 To 1
		            Var idx As Integer
		            If isRow Then
		              idx = line * N + indices1(i)
		            Else
		              idx = indices1(i) * N + line
		            End If
		            Var hint As CandidateHint = mCellCandidates(idx).Candidates(v-1).Hint
		            If hint = CandidateHint.Candidate Then
		              mCellCandidates(idx).Candidates(v-1).Hint = CandidateHint.ExcludedAsXWing
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
		  #Pragma DisableBoundsChecking
		  
		  ' Build the full matrix of cell candidates and then run all enabled
		  ' exclusion filters.
		  ' Reset Array for each Sudoku Cell
		  Redim mCellCandidates(-1)
		  mCellCandidates.ResizeTo(mGrid.Settings.N*mGrid.Settings.N-1)
		  
		  ' Fill Solve Cell Candidates
		  For row As Integer = 0 To mGrid.Settings.N-1
		    For col As Integer = 0 To mGrid.Settings.N-1
		      Var idx As Integer = row * mGrid.Settings.N + col
		      
		      Var c As CellCandidates
		      c.Row = row
		      c.Col = col
		      
		      If mGrid.Get(row, col) = 0 Then
		        ' Empty Cell - has Candidates
		        Var candidates() As Integer = GetAllCellCandidates(row, col)
		        For v As Integer = 1 To mGrid.Settings.N
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
		        For v As Integer = 1 To mGrid.Settings.N
		          Var cand As Candidate
		          cand.Value = v
		          cand.Hint = CandidateHint.NoCandidate
		          c.Candidates(v - 1) = cand
		        Next
		      End If
		      
		      mCellCandidates(idx) = c
		    Next
		  Next
		  
		  ApplyFilters(exclusionParams)
		  
		  Return mCellCandidates
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAllCellCandidates(row As Integer, col As Integer) As Integer()
		  #Pragma DisableBoundsChecking
		  
		  ' Return candidate values for cell according to Basic Sudoku Rules
		  Var candidates() As Integer
		  If (mGrid.Get(row, col) > 0) Then Return candidates
		  
		  For value As Integer = 1 To mGrid.Settings.N
		    If mGrid.IsValueValid(row, col, value) Then
		      candidates.Add(value)
		    End If
		  Next
		  
		  Return candidates
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetBlockIndices(blockRow As Integer, blockCol As Integer) As Integer()
		  ' Return linear indices for all cells in the given block.
		  
		  Var N As Integer = mGrid.Settings.N
		  Var boxW As Integer = mGrid.Settings.BoxWidth
		  Var boxH As Integer = mGrid.Settings.BoxHeight
		  
		  Var pos() As Integer
		  Redim pos(N - 1)
		  Var idx As Integer = 0
		  For r As Integer = blockRow * boxH To blockRow * boxH + boxH - 1
		    For c As Integer = blockCol * boxW To blockCol * boxW + boxW - 1
		      pos(idx) = r * N + c
		      idx = idx + 1
		    Next
		  Next
		  Return pos
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetColIndices(col As Integer) As Integer()
		  ' Return linear indices for all cells in the given column.
		  
		  Var N As Integer = mGrid.Settings.N
		  Var pos() As Integer
		  Redim pos(N - 1)
		  For row As Integer = 0 To N - 1
		    pos(row) = row * N + col
		  Next
		  Return pos
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetRowIndices(row As Integer) As Integer()
		  ' Return linear indices for all cells in the given row.
		  
		  Var N As Integer = mGrid.Settings.N
		  Var pos() As Integer
		  Redim pos(N - 1)
		  For col As Integer = 0 To N - 1
		    pos(col) = row * N + col
		  Next
		  Return pos
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HasCandidates(c As CellCandidates) As Boolean
		  ' Return True if the cell still has at least one active candidate.
		  For k As Integer = 0 To mGrid.Settings.N - 1
		    If c.Candidates(k).Hint = CandidateHint.Candidate Then Return True
		  Next
		  Return False
		End Function
	#tag EndMethod


	#tag Note, Name = CandidatesSearcher
		' ============================================================================
		' Candidates Searcher - Cell Candidate Analysis
		' ============================================================================
		'
		' Computes possible candidate values for each empty cell and applies
		' exclusion strategies to eliminate candidates:
		' - Locked Candidates
		'   Candidate limited to one row/column within a box
		'   or one box within a row/column
		' - Naked Subsets
		'   N cells in a unit whose combined candidates areexactly N values;
		'   remove these values from all other cells in the unit
		' - Hidden Subsets
		'   N values that appear only in the same N cells of a unit;
		'   remove all other candidates from those cells
		' - X-Wing
		'   Candidate appears twice in each of two rows (or columns) aligned in the
		'   same columns (or rows), forming a rectangle, enabling eliminations
		'   along the aligned axis.
		'
		' ============================================================================
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private mCellCandidates() As CellCandidates
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGrid As Grid
	#tag EndProperty


	#tag Constant, Name = kMaxSubsetSize, Type = Double, Dynamic = False, Default = \"4", Scope = Private
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

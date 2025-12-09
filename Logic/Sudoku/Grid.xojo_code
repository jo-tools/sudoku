#tag Class
Private Class Grid
	#tag Method, Flags = &h0
		Sub Clear()
		  ' Fill entire Grid with 0's
		  Redim mGrid(mSettings.N-1, mSettings.N-1)
		  
		  For row As Integer = 0 To mSettings.N-1
		    For col As Integer = 0 To mSettings.N-1
		      mGrid(row, col) = 0
		    Next
		  Next
		  
		  Redim mLockedCellIndexes(-1)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Clone() As Grid
		  ' Create a deep copy of this grid including all values and locked states
		  
		  #Pragma DisableBoundsChecking
		  
		  Var clone As New Grid(mSettings.N)
		  
		  For row As Integer = 0 To mSettings.N-1
		    For col As Integer = 0 To mSettings.N-1
		      clone.Set(row, col) = Me.Get(row, col)
		      
		      If Me.IsGridCellLocked(row, col) Then
		        clone.Lock(row, col)
		      End If
		    Next
		  Next
		  
		  Return clone
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(n As Integer)
		  ' Initialize a new grid with the specified size N.
		  ' Supported sizes: 4, 6, 8, 9, 12, 16
		  
		  Var s As Settings
		  
		  Select Case n
		    
		  Case 4
		    s.N = 4
		    s.BoxWidth = 2
		    s.BoxHeight = 2
		    
		  Case 6
		    s.N = 6
		    s.BoxWidth = 3
		    s.BoxHeight = 2
		    
		  Case 8
		    s.N = 8
		    s.BoxWidth = 4
		    s.BoxHeight = 2
		    
		  Case 9
		    s.N = 9
		    s.BoxWidth = 3
		    s.BoxHeight = 3
		    
		  Case 12
		    s.N = 12
		    s.BoxWidth = 4
		    s.BoxHeight = 3
		    
		  Case 16
		    s.N = 16
		    s.BoxWidth = 4
		    s.BoxHeight = 4
		    
		  Else
		    Raise New InvalidArgumentException("Unsupported Sudoku Size 'N=" + n.ToString + "; Supported are 4, 6, 8, 9, 12, 16", 99)
		    
		  End Select
		  
		  mSettings = s
		  
		  Me.Clear
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindEmpty(ByRef outRow As Integer, ByRef outCol As Integer) As Boolean
		  #Pragma DisableBoundsChecking
		  
		  ' Find the first empty cell
		  For row As Integer = 0 To mSettings.N-1
		    For col As Integer = 0 To mSettings.N-1
		      If mGrid(row, col) = 0 Then
		        outRow = row
		        outCol = col
		        Return True
		      End If
		    Next
		  Next
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Get(row As Integer, col As Integer) As Integer
		  ' Get the value at the specified position (0 = empty, 1-N = digit)
		  Return mGrid(row, col)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCountNonEmpty() As Integer
		  #Pragma DisableBoundsChecking
		  
		  Var count As Integer = 0
		  
		  ' Count non empty cells
		  For row As Integer = 0 To mSettings.N-1
		    For col As Integer = 0 To mSettings.N-1
		      If Me.Get(row, col) < 1 Then
		        Continue
		      End If
		      
		      count = count + 1
		    Next
		  Next
		  
		  Return count
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetIndex(row As Integer, col As Integer) As Integer
		  ' Convert (row, col) to a linear cell index
		  Return row * mSettings.N + col
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasEmptyCells() As Boolean
		  ' Check if the grid contains any empty cells (value = 0)
		  
		  #Pragma DisableBoundsChecking
		  
		  For row As Integer = 0 To mSettings.N-1
		    For col As Integer = 0 To mSettings.N-1
		      If (mGrid(row, col) = 0) Then Return true
		    Next
		  Next
		  
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsEmpty() As Boolean
		  ' Check if the entire grid is empty (all cells = 0)
		  
		  #Pragma DisableBoundsChecking
		  
		  For row As Integer = 0 To mSettings.N-1
		    For col As Integer = 0 To mSettings.N-1
		      If (mGrid(row, col) <> 0) Then Return False
		    Next
		  Next
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsGridCellLocked(row As Integer, col As Integer) As Boolean
		  ' Check if a cell is locked (a given that cannot be changed by the user)
		  Return (Me.Get(row, col) > 0) And (mLockedCellIndexes.IndexOf(Me.GetIndex(row, col)) >= 0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsValueValid(row As Integer, col As Integer, value As Integer) As Boolean
		  ' Check if placing value at Grid(row, col) is allowed according to Basic Sudoku rules.
		  ' Returns True if valid, False otherwise.
		  
		  Select Case value
		    
		  Case Is < 0
		    ' Negative values are invalid
		    Return False
		    
		  Case 0
		    ' Clearing out the value is always allowed
		    Return True
		    
		  Case Is <= mSettings.N
		    ' A valid number - let's check according to Sudoku Rules
		    If (mGrid(row, col) < 1) Then
		      ' Value is currently empty
		      Return IsValueValidInternal(row, col, value)
		    Else
		      ' Value is not currently empty. Set it temporarily to empty for this check,
		      ' so that it behaves such as the value is going to overwritten (later).
		      Var checkResult As Boolean
		      Var currentValue As Integer = mGrid(row, col)
		      mGrid(row, col) = 0
		      checkResult = IsValueValidInternal(row, col, value)
		      mGrid(row, col) = currentValue
		      Return checkResult
		    End If
		    
		  Else
		    ' Value out of range is not valid
		    Return False
		    
		  End Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsValueValidInternal(row As Integer, col As Integer, value As Integer) As Boolean
		  #Pragma DisableBoundsChecking
		  
		  ' Check if placing value at Grid(row, col) is allowed according to Basic Sudoku rules.
		  ' Note: The value at Grid(row, col) needs to be empty when calling this method!
		  ' Returns True if valid, False otherwise.
		  
		  ' 1. Check the rows
		  ' A number must not appear twice in the same row
		  For cc As Integer = 0 To mSettings.N-1
		    If mGrid(row,cc) = value Then
		      ' value already exists in this row → invalid
		      Return False
		    End If
		  Next
		  
		  ' 2. Check the columns
		  ' A number must not appear twice in the same column
		  For rr As Integer = 0 To mSettings.N-1
		    If mGrid(rr, col) = value Then
		      ' value already exists in this column → invalid
		      Return False
		    End If
		  Next
		  
		  ' 3. Check the blocks
		  ' Each block must contain unique numbers
		  ' Calculate the top-left corner of the block containing (row, col)
		  Var br As Integer = (row \ mSettings.BoxHeight) * mSettings.BoxHeight
		  Var bc As Integer = (col \ mSettings.BoxWidth) * mSettings.BoxWidth
		  
		  For rr As Integer = br To br + mSettings.BoxHeight - 1
		    For cc As Integer = bc To bc + mSettings.BoxWidth - 1
		      If mGrid(rr, cc) = value Then
		        ' value already exists in this block → invalid
		        Return False
		      End If
		    Next
		  Next
		  
		  ' Passed all checks
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Lock(index As Integer)
		  ' Lock a cell by its linear index (mark as a given)
		  If (mLockedCellIndexes.IndexOf(index) < 0) Then
		    mLockedCellIndexes.Add(index)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Lock(row As Integer, col As Integer)
		  ' Lock a cell by row and column (mark as a given)
		  Me.Lock(Me.GetIndex(row, col))
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LockCurrentState()
		  #Pragma DisableBoundsChecking
		  
		  ' Lock current state (used for Export in API only)
		  For row As Integer = 0 To mSettings.N-1
		    For col As Integer = 0 To mSettings.N-1
		      Var value As Integer = Me.Get(row, col)
		      
		      If (value > 0) Then
		        Me.Lock(row, col)
		      End If
		    Next
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Set(row As Integer, col As Integer, Assigns value As Integer)
		  ' Set the value at the specified position (0 = empty, 1-N = digit)
		  mGrid(row, col) = value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Settings() As Settings
		  ' Get the grid settings (N, BoxWidth, BoxHeight)
		  Return mSettings
		  
		End Function
	#tag EndMethod


	#tag Note, Name = Grid
		' ============================================================================
		' Sudoku Grid
		' ============================================================================
		' 
		' This class represents the Sudoku grid data structure and provides
		' basic grid operations. It stores the puzzle values and manages
		' cell locking (for distinguishing givens from user-entered values).
		' 
		' GRID STRUCTURE:
		' - N x N grid where N is the Sudoku size (4, 6, 8, 9, 12, or 16)
		' - Values range from 0 (empty) to N
		' - Box dimensions vary by size (e.g., 3x3 for 9x9, 4x3 for 12x12)
		' 
		' KEY METHODS:
		' - Get(row, col): Get value at position
		' - Set(row, col): Set value at position
		' - Clear(): Reset all cells to empty
		' - Clone(): Create a deep copy of the grid
		' - FindEmpty(): Find the first empty cell
		' - IsValueValid(): Check if a value placement follows Sudoku rules
		' 
		' CELL LOCKING:
		' - Lock(row, col): Mark a cell as a given (cannot be changed by user)
		' - IsGridCellLocked(): Check if a cell is locked
		' - LockCurrentState(): Lock all non-empty cells
		' 
		' VALIDATION:
		' - IsValueValid() checks the three Sudoku constraints:
		'   1. No duplicate in the same row
		'   2. No duplicate in the same column
		'   3. No duplicate in the same box
		' 
		' SETTINGS:
		' - N: Grid size (4, 6, 8, 9, 12, or 16)
		' - BoxWidth: Width of each box
		' - BoxHeight: Height of each box
		' 
		' ============================================================================
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private mGrid(-1,-1) As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLockedCellIndexes() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSettings As Settings
	#tag EndProperty


	#tag Structure, Name = Settings, Flags = &h0
		N As Integer
		  BoxWidth As Integer
		BoxHeight As Integer
	#tag EndStructure


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

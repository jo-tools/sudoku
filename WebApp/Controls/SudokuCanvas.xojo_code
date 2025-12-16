#tag Class
Protected Class SudokuCanvas
Inherits WebSDKUIControl
	#tag Event
		Sub DrawControlInLayoutEditor(g As Graphics)
		  ' Draw a preview of the Sudoku grid in the Xojo IDE
		  Var w As Double = g.Width
		  Var h As Double = g.Height
		  
		  ' Read properties from the control (using default values if needed)
		  Var n As Integer = IntegerProperty("N")
		  If n <= 0 Then
		    n = 9
		  End If
		  
		  Var margin As Double = DoubleProperty("MarginWindow")
		  If margin <= 0 Then margin = 20
		  Var cellSize As Double = DoubleProperty("CellSize")
		  If cellSize <= 0 Then cellSize = 60
		  
		  Var hairColor As Color = ColorProperty("GridlineHairLight")
		  if IsDarkMode then hairColor = ColorProperty("GridlineHairDark")
		  Var thickColor As Color = ColorProperty("GridlineLight")
		  if IsDarkMode then thickColor = ColorProperty("GridlineDark")
		  
		  ' Draw thin grid lines (hair lines)
		  g.DrawingColor = hairColor
		  g.PenSize = 1
		  For i As Integer = 1 To n - 1
		    ' Horizontal
		    g.DrawLine(margin, margin + i * cellSize, margin + n * cellSize, margin + i * cellSize)
		    ' Vertical
		    g.DrawLine(margin + i * cellSize, margin, margin + i * cellSize, margin + n * cellSize)
		  Next
		  
		  ' Draw thick block lines
		  g.DrawingColor = thickColor
		  g.PenSize = 2
		  
		  Var boxW As Integer = IntegerProperty("BoxWidth")
		  If boxW <= 0 Then boxW = 3
		  Var boxH As Integer = IntegerProperty("BoxHeight")
		  If boxH <= 0 Then boxH = 3
		  
		  For rowBlock As Integer = 0 To n Step boxH
		    ' Horizontal
		    g.DrawLine(margin, margin + rowBlock * cellSize, margin + n * cellSize, margin + rowBlock * cellSize)
		  Next
		  For colBlock As Integer = 0 To n Step boxW
		    ' Vertical
		    g.DrawLine(margin + colBlock * cellSize, margin, margin + colBlock * cellSize, margin + n * cellSize)
		  Next
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function ExecuteEvent(name As String, parameters As JSONItem) As Boolean
		  #Pragma unused name
		  #Pragma unused parameters
		  
		  // No events from client for this control
		  Return False
		End Function
	#tag EndEvent

	#tag Event
		Function HandleRequest(request As WebRequest, response As WebResponse) As Boolean
		  #Pragma unused request
		  #Pragma unused response
		  
		  // Ignored for this control
		  Return False
		End Function
	#tag EndEvent

	#tag Event
		Function JavaScriptClassName() As String
		  Return "JoTools.SudokuCanvas"
		End Function
	#tag EndEvent

	#tag Event
		Sub Serialize(js As JSONItem)
		  js.Value("width") = Self.Width
		  js.Value("height") = Self.Height
		  js.Value("n") = mN
		  js.Value("box_width") = mBoxWidth
		  js.Value("box_height") = mBoxHeight
		  js.Value("margin_window") = mMarginWindow
		  js.Value("cell_size") = mCellSize
		  js.Value("text_field_width") = mTextFieldWidth
		  js.Value("text_field_height") = mTextFieldHeight
		  
		  ' Colors (as hex strings for JavaScript)
		  js.Value("color_gridline_light") = ColorToHex(GridlineLight)
		  js.Value("color_gridline_dark") = ColorToHex(GridlineDark)
		  js.Value("color_gridline_hair_light") = ColorToHex(GridlineHairLight)
		  js.Value("color_gridline_hair_dark") = ColorToHex(GridlineHairDark)
		  
		  js.Value("color_hint_naked_single_light") = ColorToRGBA(CellHintNakedSingleLight)
		  js.Value("color_hint_naked_single_dark") = ColorToRGBA(CellHintNakedSingleDark)
		  js.Value("color_hint_hidden_single_light") = ColorToRGBA(CellHintHiddenSingleLight)
		  js.Value("color_hint_hidden_single_dark") = ColorToRGBA(CellHintHiddenSingleDark)
		  
		  js.Value("color_candidate_light") = ColorToHex(CandidateLight)
		  js.Value("color_candidate_dark") = ColorToHex(CandidateDark)
		  
		  js.Value("color_excluded_locked_candidate") = ColorToHex(ExcludedLockedCandidate)
		  js.Value("color_excluded_naked_subset") = ColorToHex(ExcludedNakedSubset)
		  js.Value("color_excluded_hidden_subset") = ColorToHex(ExcludedHiddenSubset)
		  js.Value("color_excluded_xwing") = ColorToHex(ExcludedXWing)
		  
		  ' Cell hints array (JSON array of {row, col, hint})
		  Var hintsArray As New JSONItem("[]")
		  For Each h As Sudoku.CellHint In mCellHints
		    Var hintObj As New JSONItem
		    hintObj.Value("row") = h.Row
		    hintObj.Value("col") = h.Col
		    hintObj.Value("hint") = CType(h.SolveHint, Integer)
		    hintsArray.Add(hintObj)
		  Next
		  js.Value("cell_hints") = hintsArray
		  
		  ' Cell candidates array (JSON array of {row, col, candidates: [{value, hint}]})
		  Var candidatesArray As New JSONItem("[]")
		  For Each c As Sudoku.CellCandidates In mCellCandidates
		    Var cellObj As New JSONItem
		    cellObj.Value("row") = c.Row
		    cellObj.Value("col") = c.Col
		    Var candArr As New JSONItem("[]")
		    For Each cand As Sudoku.Candidate In c.Candidates
		      Var candObj As New JSONItem
		      candObj.Value("value") = cand.Value
		      candObj.Value("hint") = CType(cand.Hint, Integer)
		      candArr.Add(candObj)
		    Next
		    cellObj.Value("candidates") = candArr
		    candidatesArray.Add(cellObj)
		  Next
		  js.Value("cell_candidates") = candidatesArray
		  
		  js.Value("show_hints") = mShowHints
		  js.Value("show_candidates") = mShowCandidates
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function SessionHead(session As WebSession) As String
		  #Pragma unused session
		  
		  // Ignored for this control
		  Return ""
		End Function
	#tag EndEvent

	#tag Event
		Function SessionJavascriptURLs(session As WebSession) As String()
		  #Pragma unused session
		  
		  Var result() As String
		  
		  Static jsFile As WebFile
		  If jsFile = Nil Then
		    jsFile = New WebFile(False)
		    jsFile.Filename = "sudoku-canvas.js"
		    jsFile.MIMEType = "application/javascript"
		    jsFile.Data = kJavaScript
		  End If
		  result.Add(jsFile.URL)
		  
		  Return result
		End Function
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function ColorToHex(c As Color) As String
		  ' Convert Color to #RRGGBB hex string
		  Return c.ToString.Replace("&h00", "#")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ColorToRGBA(c As Color) As String
		  ' Convert Color to rgba(r,g,b,a) string
		  Var alpha As Double = (255 - c.Alpha) / 255.0
		  Return "rgba(" + c.Red.ToString + "," + c.Green.ToString + "," + c.Blue.ToString + "," + Format(alpha, "0.00") + ")"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Refresh(sendImmediately As Boolean = False)
		  UpdateControl(sendImmediately)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetupLayout(MarginWindow As Integer, CellSize As Integer, TextFieldWidth As Integer, TextFieldHeight As Integer)
		  Me.mMarginWindow = MarginWindow
		  Me.mCellSize = CellSize
		  Me.mTextFieldWidth = TextFieldWidth
		  Me.mTextFieldHeight = TextFieldHeight
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateCandidates(cellHints() As Sudoku.CellHint, cellCandidates() As Sudoku.CellCandidates, showHints As Boolean, showCandidates As Boolean)
		  ' Update all candidate/hint data and refresh the control once
		  mCellHints = cellHints
		  mCellCandidates = cellCandidates
		  mShowHints = showHints
		  mShowCandidates = showCandidates
		  
		  Refresh(True)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateSudokuLayout(N As Integer, BoxWidth As Integer, BoxHeight As Integer, WidthHeight As Integer)
		  Me.N = N
		  Me.mBoxWidth = BoxWidth
		  Me.mBoxHeight = BoxHeight
		  
		  Me.Width = WidthHeight
		  Me.Height = WidthHeight
		  
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mCandidateDark
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCandidateDark = value
			End Set
		#tag EndSetter
		CandidateDark As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mCandidateLight
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCandidateLight = value
			End Set
		#tag EndSetter
		CandidateLight As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mCellHintHiddenSingleDark
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCellHintHiddenSingleDark = value
			End Set
		#tag EndSetter
		CellHintHiddenSingleDark As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mCellHintHiddenSingleLight
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCellHintHiddenSingleLight = value
			End Set
		#tag EndSetter
		CellHintHiddenSingleLight As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mCellHintNakedSingleDark
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCellHintNakedSingleDark = value
			End Set
		#tag EndSetter
		CellHintNakedSingleDark As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mCellHintNakedSingleLight
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCellHintNakedSingleLight = value
			End Set
		#tag EndSetter
		CellHintNakedSingleLight As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mExcludedHiddenSubset
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mExcludedHiddenSubset = value
			End Set
		#tag EndSetter
		ExcludedHiddenSubset As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mExcludedLockedCandidate
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mExcludedLockedCandidate = value
			End Set
		#tag EndSetter
		ExcludedLockedCandidate As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mExcludedNakedSubset
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mExcludedNakedSubset = value
			End Set
		#tag EndSetter
		ExcludedNakedSubset As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mExcludedXWing
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mExcludedXWing = value
			End Set
		#tag EndSetter
		ExcludedXWing As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mGridlineDark
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mGridlineDark = value
			End Set
		#tag EndSetter
		GridlineDark As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mGridlineHairDark
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mGridlineHairDark = value
			End Set
		#tag EndSetter
		GridlineHairDark As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mGridlineHairLight
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mGridlineHairLight = value
			End Set
		#tag EndSetter
		GridlineHairLight As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mGridlineLight
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mGridlineLight = value
			End Set
		#tag EndSetter
		GridlineLight As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mBoxHeight As Integer = 3
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBoxWidth As Integer = 3
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCandidateDark As Color = &cD3D3D3
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCandidateLight As Color = &cA9A9A9
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCellCandidates() As Sudoku.CellCandidates
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCellHintHiddenSingleDark As Color = &cFFFB00E6
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCellHintHiddenSingleLight As Color = &c945200BF
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCellHintNakedSingleDark As Color = &c4F8F00BF
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCellHintNakedSingleLight As Color = &c4F8F00BF
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCellHints() As Sudoku.CellHint
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCellSize As Double = 60
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mExcludedHiddenSubset As Color = &cFFA500
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mExcludedLockedCandidate As Color = &cFF0000
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mExcludedNakedSubset As Color = &cFFA500
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mExcludedXWing As Color = &cFFFF00
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGridlineDark As Color = &cC0C0C0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGridlineHairDark As Color = &c5E5E5E
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGridlineHairLight As Color = &cA9A9A9
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGridlineLight As Color = &c424242
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMarginWindow As Double = 20
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mN As Integer = 9
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mShowCandidates As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mShowHints As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextFieldHeight As Double = 40
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextFieldWidth As Double = 40
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mN
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mN = value
			End Set
		#tag EndSetter
		N As Integer
	#tag EndComputedProperty


	#tag Constant, Name = kJavaScript, Type = String, Dynamic = False, Default = \"var JoTools;\n(function (JoTools) {\n  // SudokuCanvas: Client-side canvas control for drawing Sudoku grid\x2C hints\x2C and candidates\n  class SudokuCanvas extends XojoWeb.XojoVisualControl {\n    constructor(id\x2C events) {\n      super(id\x2C events);\n      const el \x3D this.DOMElement();\n      if (el) { el.style.position \x3D \'absolute\'; }\n\n      // Create canvas element for drawing\n      this.mCanvas \x3D document.createElement(\'canvas\');\n      this.mCanvas.id \x3D this.mControlID + \'_canvas\';\n      if (el) { el.appendChild(this.mCanvas); }\n      this.mCanvas.style.width \x3D \'100%\';\n      this.mCanvas.style.height \x3D \'100%\';\n      this.mCanvas.style.display \x3D \'block\';\n      this.mCtx \x3D this.mCanvas.getContext(\'2d\');\n      this.mData \x3D {};\n\n      // Listen for dark mode changes to re-render with correct colors\n      this.mDarkQuery \x3D window.matchMedia \? window.matchMedia(\'(prefers-color-scheme: dark)\') : null;\n      if (this.mDarkQuery) {\n        const mq \x3D this.mDarkQuery;\n        const that \x3D this;\n        const listener \x3D function () { that.render(); };\n        if (mq.addEventListener) { mq.addEventListener(\'change\'\x2C listener); }\n        else if (mq.addListener) { mq.addListener(listener); }\n      }\n    }\n\n    updateControl(data) {\n      super.updateControl(data);\n      this.mData \x3D JSON.parse(data);\n      this.render();\n    }\n\n    render() {\n      super.render();\n      const el \x3D this.DOMElement();\n      if (!el) return;\n      this.setAttributes();\n      this.applyUserStyle();\n      this.applyTooltip(el);\n      const d \x3D this.mData;\n      if (!d || !this.mCanvas || !this.mCtx) return;\n      const canvas \x3D this.mCanvas;\n      const ctx \x3D this.mCtx;\n\n      // Use server-provided dimensions to avoid issues with CSS transform scaling\n      // (SudokuController applies scale() which affects getBoundingClientRect)\n      const dpr \x3D window.devicePixelRatio || 1;\n      const width \x3D d.width || el.offsetWidth || 580;\n      const height \x3D d.height || el.offsetHeight || 580;\n      canvas.width \x3D width * dpr;\n      canvas.height \x3D height * dpr;\n      canvas.style.width \x3D width + \'px\';\n      canvas.style.height \x3D height + \'px\';\n      ctx.setTransform(dpr\x2C 0\x2C 0\x2C dpr\x2C 0\x2C 0);\n\n      // Grid parameters from WebApp\n      const n \x3D d.n || 9;\n      const boxWidth \x3D d.box_width || 3;\n      const boxHeight \x3D d.box_height || 3;\n      const margin \x3D d.margin_window || 20;\n      const cellSize \x3D d.cell_size || 60;\n      const tfWidth \x3D d.text_field_width || 40;\n      const tfHeight \x3D d.text_field_height || 40;\n\n      // Detect dark mode\n      let useDark \x3D false;\n      if (this.mDarkQuery) { useDark \x3D this.mDarkQuery.matches; }\n      else if (window.matchMedia) { useDark \x3D window.matchMedia(\'(prefers-color-scheme: dark)\').matches; }\n\n      // Colors from WebApp (with fallbacks)\n      const colGridLight \x3D d.color_gridline_light || \'#424242\';\n      const colGridDark \x3D d.color_gridline_dark || \'#C0C0C0\';\n      const colHairLight \x3D d.color_gridline_hair_light || \'#A9A9A9\';\n      const colHairDark \x3D d.color_gridline_hair_dark || \'#5E5E5E\';\n      const colHintNakedLight \x3D d.color_hint_naked_single_light || \'rgba(79\x2C143\x2C0\x2C0.75)\';\n      const colHintNakedDark \x3D d.color_hint_naked_single_dark || \'rgba(79\x2C143\x2C0\x2C0.75)\';\n      const colHintHiddenLight \x3D d.color_hint_hidden_single_light || \'rgba(148\x2C82\x2C0\x2C0.75)\';\n      const colHintHiddenDark \x3D d.color_hint_hidden_single_dark || \'rgba(255\x2C251\x2C0\x2C0.90)\';\n      const colCandLight \x3D d.color_candidate_light || \'#A9A9A9\';\n      const colCandDark \x3D d.color_candidate_dark || \'#D3D3D3\';\n      const colExclLocked \x3D d.color_excluded_locked_candidate || \'#FF0000\';\n      const colExclNaked \x3D d.color_excluded_naked_subset || \'#FFA500\';\n      const colExclHidden \x3D d.color_excluded_hidden_subset || \'#FFA500\';\n      const colExclXWing \x3D d.color_excluded_xwing || \'#FFFF00\';\n\n      // Select colors based on mode\n      const colHair \x3D useDark \? colHairDark : colHairLight;\n      const colGrid \x3D useDark \? colGridDark : colGridLight;\n      const colHintNaked \x3D useDark \? colHintNakedDark : colHintNakedLight;\n      const colHintHidden \x3D useDark \? colHintHiddenDark : colHintHiddenLight;\n      const colCand \x3D useDark \? colCandDark : colCandLight;\n\n      // Clear canvas\n      ctx.clearRect(0\x2C 0\x2C width\x2C height);\n\n      // Draw cell hint backgrounds (naked/hidden single)\n      const showHints \x3D d.show_hints || false;\n      const cellHints \x3D d.cell_hints || [];\n      if (showHints && cellHints.length > 0) {\n        for (const h of cellHints) {\n          // hint: 1\x3DNakedSingle\x2C 2\x3DHiddenSingle\n          if (h.hint \x3D\x3D\x3D 1) { ctx.fillStyle \x3D colHintNaked; }\n          else if (h.hint \x3D\x3D\x3D 2) { ctx.fillStyle \x3D colHintHidden; }\n          else { continue; }\n          ctx.fillRect(margin + h.col * cellSize\x2C margin + h.row * cellSize\x2C cellSize\x2C cellSize);\n        }\n      }\n\n      // Draw thin \"hair\" grid lines\n      ctx.strokeStyle \x3D colHair;\n      ctx.lineWidth \x3D 1;\n      for (let i \x3D 1; i < n; i++) {\n        // Horizontal line\n        ctx.beginPath();\n        ctx.moveTo(margin\x2C margin + i * cellSize);\n        ctx.lineTo(margin + n * cellSize\x2C margin + i * cellSize);\n        ctx.stroke();\n        // Vertical line\n        ctx.beginPath();\n        ctx.moveTo(margin + i * cellSize\x2C margin);\n        ctx.lineTo(margin + i * cellSize\x2C margin + n * cellSize);\n        ctx.stroke();\n      }\n      // Draw thick block lines (box borders)\n      ctx.strokeStyle \x3D colGrid;\n      ctx.lineWidth \x3D 2;\n      const penOffset \x3D 1; // half of lineWidth for alignment\n      for (let rb \x3D 0; rb <\x3D n; rb +\x3D boxHeight) {\n        ctx.beginPath();\n        ctx.moveTo(margin - penOffset\x2C margin + rb * cellSize - penOffset);\n        ctx.lineTo(margin + n * cellSize - penOffset\x2C margin + rb * cellSize - penOffset);\n        ctx.stroke();\n      }\n      for (let cb \x3D 0; cb <\x3D n; cb +\x3D boxWidth) {\n        ctx.beginPath();\n        ctx.moveTo(margin + cb * cellSize - penOffset\x2C margin - penOffset);\n        ctx.lineTo(margin + cb * cellSize - penOffset\x2C margin + n * cellSize - penOffset);\n        ctx.stroke();\n      }\n\n      // Draw candidates\n      const showCandidates \x3D d.show_candidates || false;\n      const cellCandidates \x3D d.cell_candidates || [];\n      if (showCandidates && cellCandidates.length > 0) {\n        // Calculate margin areas (space between cell border and TextField)\n        const marginH \x3D (cellSize - tfWidth) / 2;\n        const marginV \x3D (cellSize - tfHeight) / 2;\n\n        // Candidate slot layout based on N\n        // Layout patterns:\n        //   N\x3D4:  1\x2C2 top; 3\x2C4 bottom\n        //   N\x3D6:  1\x2C2 top; 3 left; 4 right; 5\x2C6 bottom\n        //   N\x3D8:  1\x2C2\x2C3 top; 4 left; 5 right; 6\x2C7\x2C8 bottom\n        //   N\x3D9:  1\x2C2\x2C3\x2C4 top; 5 left; 6 right; 7\x2C8\x2C9 bottom\n        //   N\x3D12: 1\x2C2\x2C3\x2C4 top; 5\x2C7 left; 6\x2C8 right; 9\x2C10\x2C11\x2C12 bottom\n        //   N\x3D16: 1\x2C2\x2C3\x2C4\x2C5 top; 6\x2C8\x2C10 left; 7\x2C9\x2C11 right; 12\x2C13\x2C14\x2C15\x2C16 bottom\n        let slotsTop\x2C slotsLeft\x2C slotsRight\x2C slotsBottom;\n        if (n \x3D\x3D\x3D 4) { slotsTop \x3D 2; slotsLeft \x3D 0; slotsRight \x3D 0; slotsBottom \x3D 2; }\n        else if (n \x3D\x3D\x3D 6) { slotsTop \x3D 2; slotsLeft \x3D 1; slotsRight \x3D 1; slotsBottom \x3D 2; }\n        else if (n \x3D\x3D\x3D 8) { slotsTop \x3D 3; slotsLeft \x3D 1; slotsRight \x3D 1; slotsBottom \x3D 3; }\n        else if (n \x3D\x3D\x3D 9) { slotsTop \x3D 4; slotsLeft \x3D 1; slotsRight \x3D 1; slotsBottom \x3D 3; }\n        else if (n \x3D\x3D\x3D 12) { slotsTop \x3D 4; slotsLeft \x3D 2; slotsRight \x3D 2; slotsBottom \x3D 4; }\n        else if (n \x3D\x3D\x3D 16) { slotsTop \x3D 5; slotsLeft \x3D 3; slotsRight \x3D 3; slotsBottom \x3D 5; }\n        else { slotsTop \x3D Math.floor((n+3)/4); slotsBottom \x3D Math.floor((n+3)/4); const rem \x3D n - slotsTop - slotsBottom; slotsLeft \x3D Math.floor((rem+1)/2); slotsRight \x3D rem - slotsLeft; }\n        ctx.font \x3D \'8px sans-serif\';\n        ctx.textAlign \x3D \'center\';\n        ctx.textBaseline \x3D \'middle\';\n\n        // Left and right X positions (centered in margin areas)\n        const leftX \x3D marginH / 2;\n        const rightX \x3D cellSize - marginH / 2;\n        for (const cell of cellCandidates) {\n          const cellLeft \x3D margin + cell.col * cellSize;\n          const cellTop \x3D margin + cell.row * cellSize;\n          for (const cand of cell.candidates) {\n            if (cand.value < 1 || cand.value > n) continue;\n            if (cand.hint \x3D\x3D\x3D 0) continue; // NoCandidate\n            const idx \x3D cand.value - 1;\n            let centerX\x2C centerY;\n\n            // Determine position based on slot assignment\n            // Order: top row -> left/right sides (interleaved) -> bottom row\n            if (idx < slotsTop) {\n              // Top row - first slot at leftX\x2C last slot at rightX\x2C others distributed between\n              if (slotsTop \x3D\x3D\x3D 1) { centerX \x3D cellLeft + cellSize / 2; }\n              else { const frac \x3D idx / (slotsTop - 1); centerX \x3D cellLeft + leftX + frac * (rightX - leftX); }\n              centerY \x3D cellTop + marginV / 2;\n            } else if (idx < slotsTop + slotsLeft + slotsRight) {\n              // Middle section: interleave left and right\n              const midIdx \x3D idx - slotsTop;\n              const slotHeight \x3D tfHeight / Math.max(slotsLeft\x2C 1);\n              if (midIdx % 2 \x3D\x3D\x3D 0) {\n                // Left side - even middle indices (0\x2C 2\x2C 4\x2C ...)\n                const leftIdx \x3D Math.floor(midIdx / 2);\n                centerX \x3D cellLeft + leftX;\n                centerY \x3D cellTop + marginV + leftIdx * slotHeight + slotHeight / 2;\n              } else {\n                // Right side - odd middle indices (1\x2C 3\x2C 5\x2C ...)\n                const rightIdx \x3D Math.floor(midIdx / 2);\n                centerX \x3D cellLeft + rightX;\n                centerY \x3D cellTop + marginV + rightIdx * slotHeight + slotHeight / 2;\n              }\n            } else {\n              // Bottom row - first slot at leftX\x2C last slot at rightX\x2C others distributed between\n              const botIdx \x3D idx - slotsTop - slotsLeft - slotsRight;\n              if (slotsBottom \x3D\x3D\x3D 1) { centerX \x3D cellLeft + cellSize / 2; }\n              else { const frac \x3D botIdx / (slotsBottom - 1); centerX \x3D cellLeft + leftX + frac * (rightX - leftX); }\n              centerY \x3D cellTop + cellSize - marginV / 2 - 1;\n            }\n\n            // Draw candidate number\n            ctx.fillStyle \x3D colCand;\n            ctx.fillText(cand.value.toString()\x2C centerX\x2C centerY + 2);\n\n            // Draw exclusion mark if applicable (diagonal strike-through)\n            // hint: 0\x3DNoCandidate\x2C 1\x3DCandidate\x2C 2\x3DExcludedAsLockedCandidate\x2C 3\x3DExcludedAsNakedSubset\x2C 4\x3DExcludedAsHiddenSubset\x2C 5\x3DExcludedAsXWing\n            let exclColor \x3D null;\n            if (cand.hint \x3D\x3D\x3D 2) { exclColor \x3D colExclLocked; }\n            else if (cand.hint \x3D\x3D\x3D 3) { exclColor \x3D colExclNaked; }\n            else if (cand.hint \x3D\x3D\x3D 4) { exclColor \x3D colExclHidden; }\n            else if (cand.hint \x3D\x3D\x3D 5) { exclColor \x3D colExclXWing; }\n            if (exclColor) {\n              // Strike-through line centered on the candidate number\n              // Adjusted +2 to match the text vertical offset\n              const crossSize \x3D 8;\n              const crossCenterY \x3D centerY + 2;\n              ctx.strokeStyle \x3D exclColor;\n              ctx.lineWidth \x3D 1;\n              ctx.beginPath();\n              ctx.moveTo(centerX - crossSize * 0.25\x2C crossCenterY + crossSize * 0.25);\n              ctx.lineTo(centerX + crossSize * 0.25\x2C crossCenterY - crossSize * 0.25);\n              ctx.stroke();\n            }\n          }\n        }\n      }\n    }\n  }\n  JoTools.SudokuCanvas \x3D SudokuCanvas;\n})(JoTools || (JoTools \x3D {}));\n", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
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
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockHorizontal"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
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
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue="False"
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
			Name="LockVertical"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
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
			InitialValue="580"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="580"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CandidateDark"
			Visible=false
			Group="Sudoku"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CandidateLight"
			Visible=false
			Group="Sudoku"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ExcludedHiddenSubset"
			Visible=false
			Group="Sudoku"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ExcludedLockedCandidate"
			Visible=false
			Group="Sudoku"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ExcludedNakedSubset"
			Visible=false
			Group="Sudoku"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ExcludedXWing"
			Visible=false
			Group="Sudoku"
			InitialValue="&c000000"
			Type="Color"
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
			Name="Visible"
			Visible=true
			Group="Visual Controls"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Indicator"
			Visible=true
			Group="Visual Controls"
			InitialValue="0"
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
			Name="N"
			Visible=true
			Group="Sudoku"
			InitialValue="9"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridlineHairLight"
			Visible=true
			Group="Sudoku"
			InitialValue="&cA9A9A9"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridlineHairDark"
			Visible=true
			Group="Sudoku"
			InitialValue="&c5E5E5E"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridlineLight"
			Visible=true
			Group="Sudoku"
			InitialValue="&c424242"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridlineDark"
			Visible=true
			Group="Sudoku"
			InitialValue="&cC0C0C0"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CellHintNakedSingleLight"
			Visible=false
			Group="Sudoku"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CellHintNakedSingleDark"
			Visible=false
			Group="Sudoku"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CellHintHiddenSingleLight"
			Visible=false
			Group="Sudoku"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CellHintHiddenSingleDark"
			Visible=false
			Group="Sudoku"
			InitialValue="&c000000"
			Type="Color"
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
			Name="PanelIndex"
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
			Name="ControlID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

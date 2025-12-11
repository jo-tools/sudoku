#tag Class
Protected Class SudokuCanvas
Inherits WebSDKUIControl
	#tag Event
		Sub DrawControlInLayoutEditor(g As Graphics)
		  ' Draw a preview of the Sudoku grid in the Xojo IDE
		  ' Xojo IDE seems to have some margin - let's reduce the Width/Height
		  Var w As Double = g.Width - 24
		  Var h As Double = g.Height - 24
		  
		  ' Read properties from the control (using default values if needed)
		  Var n As Integer = IntegerProperty("N")
		  If n <= 0 Then
		    n = 9
		  End If
		  
		  Var hairColor As Color = ColorProperty("GridlineHairLight")
		  if IsDarkMode then hairColor = ColorProperty("GridlineHairDark")
		  Var thickColor As Color = ColorProperty("GridlineThickLight")
		  if IsDarkMode then thickColor = ColorProperty("GridlineThickDark")
		  
		  ' Calculate cell size based on available space
		  Var margin As Double = 0 '10
		  Var availableSize As Double = Min(w, h) ' - 2 * margin
		  Var cellSize As Double = availableSize / n
		  
		  ' Background
		  g.DrawingColor = FillColor()
		  g.FillRectangle(0, 0, w, h)
		  
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
		  
		  var b as integer = 3
		  select case n
		  case 9
		    b = 3
		  case 16
		    b = 4
		  end select
		  For rowBlock As Integer = 0 To n Step b
		    ' Horizontal
		    g.DrawLine(margin, margin + rowBlock * cellSize, margin + n * cellSize, margin + rowBlock * cellSize)
		  Next
		  For colBlock As Integer = 0 To n Step b
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
		Sub Opening()
		  ebOpening = true
		  
		  Opening
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Serialize(js As JSONItem)
		  js.Value("width") = Self.Width
		  js.Value("height") = Self.Height
		  js.Value("n") = mN
		  js.Value("box_width") = mBoxWidth
		  js.Value("box_height") = mBoxHeight
		  
		  ' Colors (as hex strings for JavaScript)
		  js.Value("color_gridline") = GridlineThickLight.ToString.Replace("&h00", "#")
		  js.Value("color_gridline_hair") = GridlineHairLight.ToString.Replace("&h00", "#")
		  js.Value("color_gridline_dark") = GridlineThickDark.ToString.Replace("&h00", "#")
		  js.Value("color_gridline_hair_dark") = GridlineHairDark.ToString.Replace("&h00", "#")
		  
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

	#tag Event
		Sub Shown()
		  ebOpening = false
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Refresh(sendImmediately As Boolean = False)
		  if ebOpening then return
		  
		  UpdateControl(sendImmediately)
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Opening()
	#tag EndHook


	#tag Property, Flags = &h21
		Private ebOpening As Boolean = True
	#tag EndProperty

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
			  Return mGridlineThickDark
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mGridlineThickDark = value
			End Set
		#tag EndSetter
		GridlineThickDark As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mGridlineThickLight
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mGridlineThickLight = value
			End Set
		#tag EndSetter
		GridlineThickLight As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mBoxHeight As Integer = 3
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBoxWidth As Integer = 3
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGridlineHairDark As Color = &cA9A9A9
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGridlineHairLight As Color = &cA9A9A9
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGridlineThickDark As Color = &c424242
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGridlineThickLight As Color = &c424242
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mN As Integer = 9
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mN
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  select case value
			  case 9
			    mN = 9
			    mBoxWidth = 3
			    mBoxHeight = 3
			  case 16
			    mN = 16
			    mBoxWidth = 4
			    mBoxHeight = 4
			  else
			    return
			  end select
			  
			  Refresh
			End Set
		#tag EndSetter
		N As Integer
	#tag EndComputedProperty


	#tag Constant, Name = kJavaScript, Type = String, Dynamic = False, Default = \"var JoTools;\r\n(function (JoTools) {\r\n  class SudokuCanvas extends XojoWeb.XojoVisualControl {\r\n    constructor(id\x2C events) {\r\n      super(id\x2C events);\r\n      const el \x3D this.DOMElement();\r\n      if (el) { el.style.position \x3D \'absolute\'; }\r\n      this.mCanvas \x3D document.createElement(\'canvas\');\r\n      this.mCanvas.id \x3D this.mControlID + \'_canvas\';\r\n      if (el) { el.appendChild(this.mCanvas); }\r\n      this.mCanvas.style.width \x3D \'100%\';\r\n      this.mCanvas.style.height \x3D \'100%\';\r\n      this.mCanvas.style.display \x3D \'block\';\r\n      this.mCtx \x3D this.mCanvas.getContext(\'2d\');\r\n      this.mData \x3D {};\r\n      this.mDarkQuery \x3D window.matchMedia \? window.matchMedia(\'(prefers-color-scheme: dark)\') : null;\r\n      if (this.mDarkQuery) {\r\n        const mq \x3D this.mDarkQuery;\r\n        const that \x3D this;\r\n        const listener \x3D function () { that.render(); };\r\n        if (mq.addEventListener) { mq.addEventListener(\'change\'\x2C listener); }\r\n        else if (mq.addListener) { mq.addListener(listener); }\r\n      }\r\n    }\r\n    updateControl(data) {\r\n      super.updateControl(data);\r\n      this.mData \x3D JSON.parse(data);\r\n      this.render();\r\n    }\r\n    render() {\r\n      super.render();\r\n      const el \x3D this.DOMElement();\r\n      if (!el) return;\r\n      this.setAttributes();\r\n      this.applyUserStyle();\r\n      this.applyTooltip(el);\r\n      const d \x3D this.mData;\r\n      if (!d || !this.mCanvas || !this.mCtx) return;\r\n      const canvas \x3D this.mCanvas;\r\n      const ctx \x3D this.mCtx;\r\n      const dpr \x3D window.devicePixelRatio || 1;\r\n      const rect \x3D el.getBoundingClientRect();\r\n      const width \x3D rect.width;\r\n      const height \x3D rect.height;\r\n      canvas.width \x3D width * dpr;\r\n      canvas.height \x3D height * dpr;\r\n      canvas.style.width \x3D width + \'px\';\r\n      canvas.style.height \x3D height + \'px\';\r\n      ctx.setTransform(dpr\x2C 0\x2C 0\x2C dpr\x2C 0\x2C 0);\r\n      const n \x3D d.n || 9;\r\n      const boxWidth \x3D d.box_width || Math.round(Math.sqrt(n));\r\n      const boxHeight \x3D d.box_height || Math.round(Math.sqrt(n));\r\n      const margin \x3D 10;\r\n      const gridSize \x3D Math.min(width\x2C height) - 2 * margin;\r\n      const cellSize \x3D gridSize / n;\r\n      ctx.clearRect(0\x2C 0\x2C width\x2C height);\r\n      const colHairLight \x3D d.color_gridline_hair || \'#a9a9a9\';\r\n      const colGridLight \x3D d.color_gridline || \'#424242\';\r\n      const colHairDark \x3D d.color_gridline_hair_dark || colHairLight;\r\n      const colGridDark \x3D d.color_gridline_dark || colGridLight;\r\n      let useDark \x3D false;\r\n      if (this.mDarkQuery) {\r\n        useDark \x3D this.mDarkQuery.matches;\r\n      } else if (window.matchMedia) {\r\n        useDark \x3D window.matchMedia(\'(prefers-color-scheme: dark)\').matches;\r\n      }\r\n      const colHair \x3D useDark \? colHairDark : colHairLight;\r\n      const colGrid \x3D useDark \? colGridDark : colGridLight;\r\n      ctx.strokeStyle \x3D colHair;\r\n      ctx.lineWidth \x3D 1;\r\n      for (let i \x3D 1; i < n; i++) {\r\n        ctx.beginPath(); ctx.moveTo(margin\x2C margin + i * cellSize); ctx.lineTo(margin + n * cellSize\x2C margin + i * cellSize); ctx.stroke();\r\n        ctx.beginPath(); ctx.moveTo(margin + i * cellSize\x2C margin); ctx.lineTo(margin + i * cellSize\x2C margin + n * cellSize); ctx.stroke();\r\n      }\r\n      ctx.strokeStyle \x3D colGrid;\r\n      ctx.lineWidth \x3D 2;\r\n      for (let rb \x3D 0; rb <\x3D n; rb +\x3D boxHeight) {\r\n        ctx.beginPath(); ctx.moveTo(margin - 1\x2C margin + rb * cellSize - 1); ctx.lineTo(margin + n * cellSize - 1\x2C margin + rb * cellSize - 1); ctx.stroke();\r\n      }\r\n      for (let cb \x3D 0; cb <\x3D n; cb +\x3D boxWidth) {\r\n        ctx.beginPath(); ctx.moveTo(margin + cb * cellSize - 1\x2C margin - 1); ctx.lineTo(margin + cb * cellSize - 1\x2C margin + n * cellSize - 1); ctx.stroke();\r\n      }\r\n    }\r\n  }\r\n  JoTools.SudokuCanvas \x3D SudokuCanvas;\r\n})(JoTools || (JoTools \x3D {}));\r\n", Scope = Private
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
			Name="GridlineThickLight"
			Visible=true
			Group="Sudoku"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridlineHairLight"
			Visible=true
			Group="Sudoku"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridlineHairDark"
			Visible=true
			Group="Sudoku"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridlineThickDark"
			Visible=true
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

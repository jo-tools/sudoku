#tag Menu
Begin Menu MainMenuBar
   Begin DesktopMenuItem FileMenu
      SpecialMenu = 0
      Index = -2147483648
      Text = "#App.kFileMenu"
      AutoEnabled = True
      AutoEnable = True
      Visible = True
      Begin DesktopMenuItem FileOpen
         SpecialMenu = 0
         Index = -2147483648
         Text = "#App.kFileOpen"
         ShortcutKey = "O"
         Shortcut = "Cmd+O"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem FileSaveAs
         SpecialMenu = 0
         Index = -2147483648
         Text = "#App.kFileSaveAs"
         ShortcutKey = "S"
         Shortcut = "Cmd+Shift+S"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem FileSeparator1
         SpecialMenu = 0
         Index = -2147483648
         Text = "-"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem FilePrint
         SpecialMenu = 0
         Index = -2147483648
         Text = "#App.kFilePrint"
         ShortcutKey = "P"
         Shortcut = "Cmd+P"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem FileExportPDF
         SpecialMenu = 0
         Index = -2147483648
         Text = "#App.kFileExportPDF"
         ShortcutKey = "E"
         Shortcut = "Cmd+E"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem FileSeparator2
         SpecialMenu = 0
         Index = -2147483648
         Text = "-"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopQuitMenuItem FileQuit
         SpecialMenu = 0
         Index = -2147483648
         Text = "#App.kFileQuit"
         ShortcutKey = "#App.kFileQuitShortcut"
         Shortcut = "Cmd+#App.kFileQuitShortcut"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
   End
   Begin DesktopMenuItem EditMenu
      SpecialMenu = 0
      Index = -2147483648
      Text = "&Edit"
      AutoEnabled = True
      AutoEnable = True
      Visible = True
      Begin DesktopMenuItem EditUndo
         SpecialMenu = 0
         Index = -2147483648
         Text = "&Undo"
         ShortcutKey = "Z"
         Shortcut = "Cmd+Z"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem EditSeparator1
         SpecialMenu = 0
         Index = -2147483648
         Text = "-"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem EditCut
         SpecialMenu = 0
         Index = -2147483648
         Text = "Cu&t"
         ShortcutKey = "X"
         Shortcut = "Cmd+X"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem EditCopy
         SpecialMenu = 0
         Index = -2147483648
         Text = "&Copy"
         ShortcutKey = "C"
         Shortcut = "Cmd+C"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem EditPaste
         SpecialMenu = 0
         Index = -2147483648
         Text = "&Paste"
         ShortcutKey = "V"
         Shortcut = "Cmd+V"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem EditClear
         SpecialMenu = 0
         Index = -2147483648
         Text = "#App.kEditClear"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem EditSeparator2
         SpecialMenu = 0
         Index = -2147483648
         Text = "-"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem EditSelectAll
         SpecialMenu = 0
         Index = -2147483648
         Text = "Select &All"
         ShortcutKey = "A"
         Shortcut = "Cmd+A"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
   End
   Begin DesktopMenuItem SudokuMenu
      SpecialMenu = 0
      Index = -2147483648
      Text = "&Sudoku"
      AutoEnabled = True
      AutoEnable = True
      Visible = True
      Begin DesktopMenuItem SudokuNew
         SpecialMenu = 0
         Index = -2147483648
         Text = "#App.kSudokuNew"
         ShortcutKey = "N"
         Shortcut = "Cmd+N"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem SudokuSeparator1
         SpecialMenu = 0
         Index = -2147483648
         Text = "-"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem SudokuLock
         SpecialMenu = 0
         Index = -2147483648
         Text = "#App.kSudokuLock"
         ShortcutKey = "L"
         Shortcut = "Cmd+L"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem SudokuSeparator2
         SpecialMenu = 0
         Index = -2147483648
         Text = "-"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem SudokuShowHints
         SpecialMenu = 0
         Index = -2147483648
         Text = "#App.kSudokuShowHints"
         ShortcutKey = "I"
         Shortcut = "Cmd+I"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem SudokuShowCandidates
         SpecialMenu = 0
         Index = -2147483648
         Text = "#App.kSudokuShowCandidates"
         ShortcutKey = "J"
         Shortcut = "Cmd+J"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem SudokuExclusion
         SpecialMenu = 0
         Index = -2147483648
         Text = "#App.kSudokuExclusion"
         AutoEnabled = True
         AutoEnable = True
         SubMenu = True
         Visible = True
         Begin DesktopMenuItem SudokuExclusionLockedCandidates
            SpecialMenu = 0
            Index = -2147483648
            Text = "Locked Candidates"
            AutoEnabled = True
            AutoEnable = True
            Visible = True
         End
         Begin DesktopMenuItem SudokuExclusionNakedSubsets
            SpecialMenu = 0
            Index = -2147483648
            Text = "Naked Subsets"
            AutoEnabled = True
            AutoEnable = True
            Visible = True
         End
         Begin DesktopMenuItem SudokuExclusionHiddenSubsets
            SpecialMenu = 0
            Index = -2147483648
            Text = "Hidden Subsets"
            AutoEnabled = True
            AutoEnable = True
            Visible = True
         End
         Begin DesktopMenuItem SudokuExclusionXWing
            SpecialMenu = 0
            Index = -2147483648
            Text = "X-Wing"
            AutoEnabled = True
            AutoEnable = True
            Visible = True
         End
      End
      Begin DesktopMenuItem SudokuSeparator3
         SpecialMenu = 0
         Index = -2147483648
         Text = "-"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem SudokuSolve
         SpecialMenu = 0
         Index = -2147483648
         Text = "#App.kSudokuSolve"
         ShortcutKey = "B"
         Shortcut = "Cmd+B"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
   End
End
#tag EndMenu

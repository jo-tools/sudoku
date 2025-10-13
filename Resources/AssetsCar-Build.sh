#!/bin/sh
#

# Build Assets.car
# by combining Assets.xcassets (Accent Color, App Icon)
# and App.icon (Icon Composer, macOS Tahoe App Icon)
actool \
	--compile . \
	--platform macosx \
	--minimum-deployment-target 10.14 \
	--app-icon App \
	--output-partial-info-plist /dev/null \
	--enable-icon-stack-fallback-generation=disabled \
	./Assets/Assets.xcassets \
	./Assets/App.icon

# App ICNS
iconutil -c icns -o ./App.icns ./Assets/Assets.xcassets/App.iconset

# Sudoku ICNS - DocumentIcon in FileTypeGroup 'Sudoku'
iconutil -c icns -o ./Sudoku.icns ./Assets/Assets.xcassets/Sudoku.iconset

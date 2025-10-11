#!/bin/sh
#

actool \
	--compile . \
	--platform macosx \
	--minimum-deployment-target 10.14 \
	--app-icon App \
	--output-partial-info-plist /dev/null \
	--enable-icon-stack-fallback-generation=disabled \
	./Assets/Assets.xcassets \
	./Assets/App.icon

iconutil -c icns -o ./App.icns ./Assets/Assets.xcassets/App.iconset

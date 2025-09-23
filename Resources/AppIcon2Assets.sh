#!/bin/sh
#

actool \
	--compile . \
	--platform macosx \
	--minimum-deployment-target 10.14 \
	--app-icon App \
	--output-partial-info-plist /dev/null \
	--enable-icon-stack-fallback-generation=disabled \
	./App.icon

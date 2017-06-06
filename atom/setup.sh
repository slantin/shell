#!/bin/bash

source ../sources/colors

if [ $(which apm) -eq "apm not found" ]; then
	pc $RED "Atom package manager is not installed! Aboriting..."
	exit 1
fi

apm install atom-material-ui
apm install atom-material-syntax-dark
apm install nord-atom-syntax
apm install file-icons
apm install fonts
apm install go-plus
apm install go-signature-statusbar
apm install go-debug
apm install pane-layout-plus
apm install pane-move-plus
apm install split-diff
apm install zentabs

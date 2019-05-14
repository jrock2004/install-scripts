#!/usr/bin/env bash

exts=(
	arcticicestudio.nord-visual-studio-code
	dbaeumer.vscode-eslint
	EditorConfig.EditorConfig
	emberjs.vscode-ember
	josa.ember-related-files
	jrock2004.vscode-ember-snippets
	ngryman.codesandbox-theme
	peterjausovec.vscode-docker
	PKief.material-icon-theme
)

for ext in "${exts[@]}"; do
	ext_name=$( echo "$ext" | awk '{print $1}' )

	code --install-extension "$ext"
done

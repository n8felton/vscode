#!/usr/bin/env bash
#
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for license information.

function app_path() {
	BUNDLE_IDENTIFIER=""
	if [[ $1 == *"/code-insiders" ]]; then
		BUNDLE_IDENTIFIER="com.microsoft.VSCodeInsiders"
	elif [[ $1 == *"/code-exploration" ]]; then
		BUNDLE_IDENTIFIER="com.microsoft.VSCodeExploration"
	else
		BUNDLE_IDENTIFIER="com.microsoft.VSCode"
	fi
	echo "$(mdfind kMDItemCFBundleIdentifier = "${BUNDLE_IDENTIFIER}")"
}
CONTENTS="$(app_path "${BASH_SOURCE[0]}")/Contents"
ELECTRON="$CONTENTS/MacOS/Electron"
CLI="$CONTENTS/Resources/app/out/cli.js"
ELECTRON_RUN_AS_NODE=1 "$ELECTRON" "$CLI" --ms-enable-electron-run-as-node "$@"
exit $?

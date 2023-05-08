#!/bin/bash
scriptDir="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )/"
cd "$scriptDir"
date +%s > "$scriptDir""lastUpdatedAt"
if [[ "$(git pull --ff-only)" != "Already up to date." ]]; then
	./install.sh
elif [[ "$1" == "--error-on-up-to-date" ]]; then
	exit 1
fi

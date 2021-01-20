#!/bin/bash

set -e

TIME_TO_WAIT_BETWEEN_UPDATES=$((24 * 60 * 60)) # one day

scriptDir="$( cd "$(dirname "${BASH_SOURCE}")" >/dev/null 2>&1 ; pwd -P )/"

if [[ ! -f "$scriptDir""lastUpdatedAt" ]] || [[ "$(cat $scriptDir/lastUpdatedAt)" < $(( $(date +%s) - $TIME_TO_WAIT_BETWEEN_UPDATES )) ]]; then
	if [[ $($scriptDir/updater.sh --error-on-up-to-date) ]]; then
		echo "Bash configuration auto-updated in background; restart terminal to load changes"
	fi
fi
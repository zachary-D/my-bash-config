#!/bin/bash
scriptDir="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )/"
cd "$scriptDir"
git pull
./install.sh
#!/bin/bash
scriptPath="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )/"
cd "$scriptPath"
git pull
./install.sh
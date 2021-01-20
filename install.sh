#!/bin/bash

#This string is appended as arguments to the scripts in this package in order to determine which lines were added to .bashrc or cron by the installer
INSTALLER_SCRIPT_IDENTIFIER="this-line-was-added-by-the-bash-config-manager-auto-installer"

scriptPath="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )/"

config_path="$scriptPath"bash-config.sh

bashrc="$(grep -v $INSTALLER_SCRIPT_IDENTIFIER ~/.bashrc)"
echo "$bashrc" > ~/.bashrc
printf "\nsource $config_path $INSTALLER_SCRIPT_IDENTIFIER\n" >> ~/.bashrc



cronUpdateCommand="$scriptPath""updater.sh $INSTALLER_SCRIPT_IDENTIFIER > /dev/null"

cronJobs="0 12 * * * $cronUpdateCommand
@reboot $cronUpdateCommand"

( crontab -l | grep -v $INSTALLER_SCRIPT_IDENTIFIER ; echo "$cronJobs" ) | crontab -
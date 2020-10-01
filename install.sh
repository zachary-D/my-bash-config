#!/bin/bash
config_path="$(pwd)/bash-config.sh"

if [[ "$( grep -o $config_path ~/.bashrc )" == "" ]]; then
	printf "\nsource $config_path\n" >> ~/.bashrc
else
	echo "Config file already sourced"
fi

# $1 - string to check for; $2 - command to add
function addCommandtoCronIfMissing() {
	commandToAdd="$2"
	if [[ "$2" == "" ]]; then
		commandToAdd="$1"
	fi

	if [[ $( crontab -l | grep -F -o "$1") == "" ]]; then
		( crontab -l; echo "$commandToAdd" ) | crontab -
	else
		echo "$1 already found"
	fi
}

cronUpdateCommand="cd $(pwd); git pull >> /dev/null"
addCommandtoCronIfMissing "0 2 * * * $cronUpdateCommand"
addCommandtoCronIfMissing "@reboot $cronUpdateCommand"

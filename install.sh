#!/bin/bash
config_path="$(pwd)/bash-config.sh"

if [[ "$( grep -o $config_path ~/.bashrc )" == "" ]]; then
	printf "\nsource $config_path\n" >> ~/.bashrc
else
	echo "Config file already sourced"
fi

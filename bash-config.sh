#!/bin/bash

# set tab size=4 (interactive terminals only)
# https://askubuntu.com/a/251033, https://stackoverflow.com/a/25391867
[[ $- == *i* ]] && tabs -4

scriptDir="$( cd "$(dirname "${BASH_SOURCE}")" >/dev/null 2>&1 ; pwd -P )/"
PATH="$PATH:$scriptDir""scripts/"

# git shortcuts
alias ggraph="git log --stat --graph --branches --remotes"
alias gstat="git status"
alias gdiff="git diff --ignore-space-change"
alias gdiffc="gdiff --cached"

# redirect mariadb to the WSL host over the network so it can connect to the server running on the windows-side (WSL)
# set REDIRECT_DB in the machine-specific bash config before this file is loaded to enable
case "$REDIRECT_DB" in
	WSL_HOST)
		alias mariadb="mariadb -h $WSL_HOST"
		alias mysqldump="mysqldump -h $WSL_HOST"
	;;
	LOCALHOST_IP)
		alias mariadb="mariadb -h 127.0.0.1"
		alias mysqldump="mysqldump -h 127.0.0.1"
	;;
esac

# functional aliases
alias mysql=mariadb
alias typescript="node -r ts-node/register"
alias code=code-insiders

# prevent sl from locking us in
alias sl="sl -e"
alias LS="LS -e"

# funny meme aliases
alias yeet="rm"
alias skrrt="exit"
alias skurt="skrrt"
alias yolo="rm -rf"
alias hashtag="sudo"
alias gay=lolcat

# jump to my user directory on the windows-side
alias win="cd /mnt/c/Users/zac*"

# Startup banner
function dispBanner() {
	welcome="Welcome back Zack,"
	banner="It's Terminal Time"

	if [[ $(dpkg -l | grep -E '(figlet)|(lolcat)' | wc -l) == 2 ]]; then
		echo "$welcome" | gay
		$(figlet -v >> /dev/null) && figlet -f slant -tc "$banner" | gay
	else
		echo "$welcome"
		echo "$banner"
	fi

	echo $(date '+It is %H:%M on %a %b %d')
}

[[ $- == *i* ]] && dispBanner

[[ $- == *i* ]] && ( $scriptDir/backgroundUpdate.sh & )

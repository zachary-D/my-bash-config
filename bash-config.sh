#!/bin/bash

# git shortcuts
alias ggraph="git log --stat --graph --branches --remotes"
alias gstat="git status"
alias gdiff="git diff --ignore-space-change"

# redirect mariadb to localost over the network so it can connect to the server running on the windows-side (WSL)
# this expects that $WSL_HOST be set to the host IP
alias mariadb="mariadb -h $WSL_HOST"

# functional aliases
alias mysql=mariadb
alias typescript="node -r ts-node/register"
alias code=code-insiders

# prevent sl from locking us in
alias sl="sl -e"
alias LS="LS -e"

# rsync default args
alias rsync-d="rsync -avz --progress --append-verify --protect-args"

# funny meme aliases
alias yeet="rm"
alias skrrt="exit"
alias skurt="skrrt"
alias yolo="rm -rf"
alias hashtag="sudo"
alias gay=lolcat

# jump to my user directory on the windows-side
alias win="cd /mnt/c/Users/zac*"

# open this directory in windows explorer
function exp() {
	if [[ "$1" == "" ]]; then
			dir="."
	else
			dir="$1"
	fi

	if [[ "$dir" != "." ]] && [[ "$dir" != ".." ]] ; then
			#If $dir is not an absolute path, append $(pwd)
			if [[ ${dir:0:1} != '/' ]]; then
					dir="$(pwd)\\$dir"
			fi

			#Replace / with \ (linux slashes with windows slashes)
			dir=$(echo $dir | sed s/'\/'/'\\'/g)

			#Prepend the WSL network directory
			dir="\\\\wsl\$\\Ubuntu$dir"
	fi

	explorer.exe "$dir"
}

PATH="$PATH:./node_modules/.bin/"

# function myClone()
# {
# 	git clone git@github.com:zachary-D/"$1"
# }

# alias myclone=myClone

#
# This is a copy of the original .bashrc
# Place this on ~/.bashrc to apply.
# Author: Nar Cuenca
# email: narc.ph@gmail.com
#

PROMPT_COMMAND=__prompt_command

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### Aliases ###
alias ls='ls --color=auto'
alias code='codium'
alias edit_config='sudo vim /etc/nixos/configuration.nix'
alias dotfile='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

### Command prompt setup ###

# Get git branch
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`

	if [ ! "${BRANCH}" == "" ]; then
		STAT=`parse_git_dirty`
		echo "\[\e[m\]\[\e[1;33m\][${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# Get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''

	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

# Get the current working directory
function get_working_dir {
	echo "\[\e[1;35m\]\W"
}

# Sets the command prompt with colors depending on prev command exit status
function __prompt_command {
	local EXIT="$?"
	PS1="`get_working_dir` `parse_git_branch`"

	if [ $EXIT != 0 ]; then
		PS1+=" \[\e[m\]\[\e[1;31m\]🍺 \[\e[m\]"
	else
		PS1+=" \[\e[m\]🍺 "
	fi
}

# PS1='[\u@\h \W]\$ '


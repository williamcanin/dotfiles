#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Path to the bash it configuration
# export BASH_IT="$HOME/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
# export BASH_IT_THEME='wilcan'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
# export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
# export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
# export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
# export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
# export BASH_IT_RELOAD_LEGACY=1

# Load Bash It
# if [[ -f "$BASH_IT/bash_it.sh" ]]; then
#  source "$BASH_IT/bash_it.sh"
# fi



# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
 set -o notify
#
# Don't use ^D to exit
 set -o ignoreeof
#
# Use case-insensitive filename globbing
 shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
 shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
 shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
 COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
 COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
 COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
 # [[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options
#
# Don't put duplicate lines in the history.
 export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
 export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
 export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
 # export PROMPT_COMMAND="history -a"

# Source global definitions
#
# if [ -f /etc/bashrc ]; then
# . /etc/bashrc
# fi

# Configuration user
# if [ -f "${HOME}/.shellrc" ]; then
#   source "${HOME}/.shellrc"
# fi

# Aliases.
# if [ -f "${HOME}/.aliasesrc" ]; then
#   source "${HOME}/.aliasesrc"
# fi

# Disable color ls
# alias ls='ls --color=never'
# Emulate an MS-DOS prompt in your Linux shell.
# Laszlo Szathmary (jabba.laci@gmail.com), 2011
# Project home page:
# https://ubuntuincident.wordpress.com/2011/02/08/emulate-the-ms-dos-prompt/
#
#
# Modified by Soldier of Fortran
#
# Add to you ~/.bashrc file with: 'source ~/.themes/95/bashrc'

#function msdos_pwd
#{
#    local dir="`pwd`"
#
#    echo $dir | tr '/' '\\'
#}

#export PS1='C:`msdos_pwd`> '

#echo 
#echo
#echo "Microsoft(R) Windows 95"
#echo "   (C)Copyright Microsoft Corp 1981-1996."
#echo

. "$HOME/.cargo/env"
. "/home/rust/cargo/env"

source /home/boss/.config/broot/launcher/bash/br

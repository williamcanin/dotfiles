#!/usr/bin/env sh

# shellcheck disable=SC2034,SC1090,SC2298,SC2296
### File responsible for ZSH behavior settings
# Note: If using Oh-My-ZSH there is no need to load these settings.

### [ Set ] -----------------------------------------------------------------------------

## Don't wait for job termination notification
set -o notify

## Don't use ^D to exit
set -o ignoreeof



### [ COMP ] ----------------------------------------------------------------------------

## Define to access remotely checked-out files over passwordless ssh for CVS
COMP_CVS_REMOTE=1

## Define to avoid stripping description in --option=description of './configure --help'
COMP_CONFIGURE_HINTS=1

## Define to avoid flattening internal contents of tar files
COMP_TAR_INTERNAL_PATHS=1



### [ Auto Suggestions ] -----------------------------------------------------------------

zsh_autosuggestions="/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
if [ -f "$zsh_autosuggestions" ]; then
  . $zsh_autosuggestions
fi



### [ Syntax Highlighting ] ---------------------------------------------------------------

zsh_syntax_highlighting="/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
if [ -f "$zsh_syntax_highlighting" ]; then
  . $zsh_syntax_highlighting
fi



### [ History ] -------------------------------------------------------------------------

HISTSIZE=1000000000
export HISTSIZE

if [ -n "${ZSH_VERSION-}" ]; then
    # Zsh
    HISTFILE="$HOME/.zsh_history"
    SAVEHIST=1000000000

    setopt APPEND_HISTORY
    setopt INC_APPEND_HISTORY
    setopt EXTENDED_HISTORY
    setopt HIST_IGNORE_DUPS
elif [ -n "${BASH_VERSION-}" ]; then
    # Bash
    HISTFILE="$HOME/.bash_history"
    HISTFILESIZE=1000000000
    HISTTIMEFORMAT='[%F %T] '

    HISTCONTROL="${HISTCONTROL:+$HISTCONTROL,}ignoredups"

    # Ignore lines starting with a space, fg, bg, and exit
    HISTIGNORE='[[:space:]]*:&:[fb]g:exit'

    PROMPT_COMMAND='history -a'

    export HISTFILE HISTFILESIZE HISTTIMEFORMAT HISTCONTROL HISTIGNORE PROMPT_COMMAND
fi



### [ History Hook ] --------------------------------------------------------------------
# Skips history entries for commands not found in PATH (zsh-only feature)
if [ -n "$ZSH_VERSION" ]; then
  zshaddhistory() {
    whence ${${(z)1}[1]} >| /dev/null 2>&1
  }
fi


### [ Bindkeys ] ------------------------------------------------------------------------

bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey "^H" backward-kill-word
bindkey "^[[3;5~" kill-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey '^[[Z' reverse-menu-complete
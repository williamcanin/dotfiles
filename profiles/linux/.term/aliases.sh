#!/usr/bin/env sh

### File responsible for creating aliases for the terminal

# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.

### [ Temporary ] ----------------------------------------------------------------------------
alias tildr='/home/$USER/Projects/github/organizations/orbitbits/tildr/target/x86_64-unknown-linux-gnu/debug/tildr'
alias catalina='VBoxManage startvm macos-catalina'



### [ Modern shell ] -------------------------------------------------------------------------
alias ll='eza -lah --icons'
alias ls='ls__alias'
alias etree='eza --tree'

# Exemples fd:
# ff <file-name>
# ff -e <extension>
# ff conf <folder-name>
# ff '^config$'
# ff '^wayland.conf$'
# ff --hidden <filename-or-foldername>
# ff -t d <folder-name>
# ff -t f <filename>
# ff -e <extension> -x rm {}
# ff -e <extension> -x cat {}
# ff . <folder> | fzf
# ff <filename.ext> <path>
# ff <filename> <path>
# ff <target> <path>
alias ff='fd'



### [ Logs e systemd ] ------------------------------------------------------------------------
alias boot-err='boot_err__alias'
alias serv-log='serv_log__alias'
alias boot-err-1='journalctl -b -1 -p err'
alias logs='journalctl -xe'
alias follow='journalctl -f'
alias userlogs='journalctl --user -xe'
alias failed='systemctl --failed'
alias status='systemctl status'



### [ Network ] -------------------------------------------------------------------------------
alias myip='curl ifconfig.me'
alias ports='ss -tulpn'



### [ Processes ] -----------------------------------------------------------------------------
alias psg='ps aux | grep'



### [ Files ] ---------------------------------------------------------------------------------
alias du1='du -sh * | sort -h'



### [ Devices ] -------------------------------------------------------------------------------
alias devices='lsblk -f'



### [ Git ] -----------------------------------------------------------------------------------
alias git-bare='git_bare__alias'
#alias gs='git status'
#alias ga='git add'
#alias gc='git commit'
#alias gp='git push'
#alias gl='git pull'
#alias gd='git diff'
#alias gco='git checkout'
#alias gb='git branch'



### [ Sway ] ----------------------------------------------------------------------------------
alias sway-reload='swaymsg reload'
alias sway-tree='swaymsg -t get_tree'


### [ Hyprland ] ----------------------------------------------------------------------------------
alias hyprland-reload='hyprctl reload'


### [ NVidia ] --------------------------------------------------------------------------------
alias gpu='nvidia-smi'
alias gpuwatch='watch -n1 nvidia-smi'



### [ Vi / Vim / Nvim ] -----------------------------------------------------------------------

alias v='nvim'
alias vi='nvim'



### [ Debug ]
alias env-systemd='systemctl --user show-environment'
alias env-wayland='env | grep -E "WAYLAND|DISPLAY|XDG"'



### [ Workflow ] -----------------------------------------------------------------------------
alias workflow="sh ~/.workflow/main.sh"



### [ Arch Linux ] ---------------------------------------------------------------------------
alias arch='arch_command__alias'



### [ History off ] ---------------------------------------------------------------------------
# Run a command without recording it in history
_run_private() { unset HISTFILE; "$@"; }
alias off='_run_private'



### [ LOCALS Entry ] --------------------------------------------------------------------------
alias hdd-git='cd /run/media/$USER/files/git'
alias orbitbits='cd /home/$USER/Projects/github/organizations/orbitbits'
alias tilder-repo='cd "$(tilder repo path)"'



### [ ZSH ] -----------------------------------------------------------------------------------

alias zshconfig="vim ~/.zshrc"



### [ Kitty terminal ]  -----------------------------------------------------------------------
alias kitty-conf='vim ~/.config/kitty/kitty.conf'



### [ Interactive ] ---------------------------------------------------------------------------

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# alias fm='vifm'
alias fm='ranger'
alias copy='rsync -ah --progress'



### [ Clean trash ] ---------------------------------------------------------------------------

#alias etrash='rm -rfv $HOME/.local/share/Trash/*'
#alias trashe='trash-empty -f'



### [ Human-readable ] ------------------------------------------------------------------------

alias df='df -h'
alias du='du -h'



### [ Misc ] ----------------------------------------------------------------------------------

alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
alias p='pwd'



### [ Listing ] --------------------------------------------------------------------------------

# alias ls='ls --color=auto'
# alias ls='ls $LS_OPTIONS'
# alias ll='ls $LS_OPTIONS -l'
# alias l='ls $LS_OPTIONS -lA'

## Some shortcuts for different directory listings
# alias ls='ls -hF --color=tty'                 # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
# alias ll='ls -l'                              # long list
# alias la='ls -A'                              # all but . and ..
# alias l='ls -CF'                              #
# alias lt="tree"



### [ Rust ] -----------------------------------------------------------------------------------

alias rust="rustc"



### [ Python ] -----------------------------------------------------------------------------------

alias python="python3"



### [ DJango ] ----------------------------------------------------------------------------------

alias djm='python manage.py migrate'
alias djmk='python manage.py makemigrations'
alias djs='python manage.py runserver'



### [ Makepkg ] ---------------------------------------------------------------------------------
## Arch Linux

alias cleanpkg='rm -rf src pkg && find . -maxdepth 1 \( -name "*.pkg.tar.zst" -o -name "*.src.tar.zst" -o -name "*.tar.gz" -o -name "*.log" \) -delete'



### [ Shred ] -----------------------------------------------------------------------------------
## Remove Security

alias killdisk='shred -n 3 -z -v'
alias rms='shred -n 3 -z -u -v'



### [ Secure Delete ] ----------------------------------------------------------------------------

alias srm='srm -rvz'



### [ Fastfetch ] --------------------------------------------------------------------------------

alias about='fastfetch__alias'



### [Flashiso ] ----------------------------------------------------------------------------------

alias flashiso='flashiso__alias'



### [ Yazi ] -------------------------------------------------------------------------------------

alias yy='yazi'



### [ Dbeaver ] ----------------------------------------------------------------------------------

alias dbeaver='GTK_THEME=Adwaita dbeaver &'



### [ Zed ] --------------------------------------------------------------------------------------

alias zed='zeditor'



### [ Server Here ] ------------------------------------------------------------------------------
## Run server in directory using Python

alias server-here="python -m http.server --bind 0.0.0.0 4000"



### [ Nuke ] -------------------------------------------------------------------------------------
## Removing files and folders safely using shred.
## The function `question_security_delete__alias` is in $HOME/.term/init.sh.

alias rip='question_security_delete__alias'
# alias burn='question_security_delete'
# alias void='question_security_delete'
# alias nuke='question_security_delete'



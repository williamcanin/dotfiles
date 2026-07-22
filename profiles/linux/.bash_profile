#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc



####  Automatic login (tty)

# Enter session
# if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
# startx
# fi
# Exit session
# if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
#   exec xinit -- :0 -novtswitch &>/dev/null &
#   logout
# fi

# [[ -z $DISPLAY && $XDG_VTNR -eq 1 || $XDG_VTNR -eq 2 ]] && { exec startx; }
# [[ -z $DISPLAY && $XDG_VTNR -eq 1 || $XDG_VTNR -eq 2 ]] && { exec xinit -- :0 -novtswitch &>/dev/null; logout;}


# Oracle Database Express Edition (XE)
#export ORACLE_VERSION="11.2.0"
#export ORACLE_SID=XE
#export ORACLE_OWNR=oracle
#export ORACLE_BASE=/u01/app/$ORACLE_OWNR
#export ORACLE_HOME=$ORACLE_BASE/product/$ORACLE_VERSION/xe
#export ORACLE_BIN=$ORACLE_HOME/bin
#export PATH=$PATH:$ORACLE_HOME:$ORACLE_BIN

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#xrandr --newmode "1360x768_60.00"   84.75  1360 1432 1568 1776  768 771 781 798 -hsync +vsync
#xrandr --addmode LVDS1 1360x768_60.00
#xrandr --output LVDS1 --mode 1360x768_60.00

export PATH="$HOME/.poetry/bin:$PATH"
. "$HOME/.cargo/env"
. "/home/rust/cargo/env"

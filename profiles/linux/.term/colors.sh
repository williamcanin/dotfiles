#!/usr/bin/env sh

### [ COLORS | LS_COLORS ] -----------------------------------------------------
## Install: yay -S vivid
LS_COLORS=$(vivid generate catppuccin-mocha)
export LS_COLORS

# Fallback
# eval "$(dircolors)"


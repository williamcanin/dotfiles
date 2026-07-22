#!/bin/bash

#!/bin/bash

WS=2

open_or_focus() {
    local MATCH="$1"
    local CMD="$2"

    if i3-msg -t get_tree | grep -q "$MATCH"; then
        i3-msg "[${MATCH}] focus"
    else
        i3-msg "exec $CMD"
    fi
}

wait_for_window() {
    local MATCH="$1"
    for i in {1..40}; do
        i3-msg -t get_tree | grep -q "$MATCH" && return
        sleep 0.05
    done
}

# ir workspace
i3-msg "workspace $WS"

# abrir apps
open_or_focus 'instance":"layout_thunar' 'thunar --name layout_thunar'
open_or_focus 'name":"layout_term' 'terminator --title layout_term'
open_or_focus 'instance":"layout_subl' 'subl --class layout_subl'

# esperar nascer
wait_for_window 'layout_thunar'
wait_for_window 'layout_term'
wait_for_window 'layout_subl'

# layout
i3-msg '[instance="layout_thunar"] floating enable, resize set 680 1035, move position 14 27'
i3-msg '[title="layout_term"] floating enable, resize set 1220 400, move position 696 27'
i3-msg '[title="layout_subl"] floating enable, resize set 1220 627, move position 696 430'

# foco final no terminal
i3-msg '[title="layout_term"] focus'


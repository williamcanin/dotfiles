#!/usr/bin/env sh

case $1 in
	--show)
		echo " Sys"
	;;
	--open)
        ## Btop
        # sudo pacman -S btop jd kitty
        #
        current_ws=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name')
        #
        # Vai para a workspace 9 e abre o btop no kitty
        i3-msg workspace 9
        kitty -e btop
        #
        # Quando fechar o calcurse, volta para a workspace anterior
        i3-msg workspace "$current_ws"
    ;;
esac

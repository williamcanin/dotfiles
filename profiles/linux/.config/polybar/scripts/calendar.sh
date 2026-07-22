#!/usr/bin/env sh

case $1 in
	--calendar)
		echo " $(date +%A), $(date +%d) $(date +%B)"
	;;
	--open)
        ## Google Calendar
		#if [[ -f $(which google-chrome-stable) ]]; then
		#	google-chrome-stable "https://calendar.google.com/calendar/u/0/r/month"
		#fi

        ## Gsimplecal
        # sudo pacman -S gsimplecal
        #gsimplecal &

        ## Calcurse
        # sudo pacman -S calcurse kitty jd
        #
        current_ws=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name')
        #
        # Vai para a workspace 9 e abre o calcurse no kitty
        i3-msg workspace 9
        kitty -e calcurse
        #
        # Quando fechar o calcurse, volta para a workspace anterior
        i3-msg workspace "$current_ws"
    ;;
esac

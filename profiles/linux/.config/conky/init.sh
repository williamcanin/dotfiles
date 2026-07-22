#!/usr/bin/env sh

ROOT="$HOME/.config/conky"

case $1 in
	install )
		mkdir -p $HOME/.fonts/
		mkdir -p $ROOT/
		cp -f $ROOT/fonts/ConkySymbols.ttf $HOME/.fonts/
		echo "Done!"
	;;
	start)
		# Terminate already running bar instances
		killall -q conky
		
		# Wait until the processes have been shut down
		while pgrep -u $UID -x conky > /dev/null; do sleep 1; done
		
		if pgrep -x i3 > /dev/null; then
		  conky -c $ROOT/i3/conky.conf &
		elif pgrep -x xfce4-session > /dev/null; then
		  conky -c $ROOT/xfce/conky.conf &
        elif pgrep -x gnome-shell > /dev/null; then
		  conky -c $ROOT/gnome/conky.conf &
		fi

		echo "Done!"
	;;
	*)
		echo "Usage: $0 {install|start}"
	;;
esac

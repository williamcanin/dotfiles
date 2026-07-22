#!/bin/bash

playerctl --player=spotify metadata --follow --format ' {{ title }} - {{ artist }} ' | while read -r line; do
    notify-send "Spotify" "$line" -i spotify
done


#!/usr/bin/env sh


sudo -k
case $1 in
    --show)
        if ! updates=$(checkupdates 2> /dev/null | wc -l); then
            updates=0
        fi

        if [ "$updates" -gt 0 ]; then
            echo " $updates"
        else
            echo " 0"
        fi
    ;;
    --open-terminal)
        distro=$(cat /etc/os-release | grep ^NAME | cut -d"=" -f2 | cut -d'"' -f2)

        exec terminator --command="echo \"[ ${distro} System Update ]\n\" && echo \"To update... \n\"; checkupdates && echo \"\n\" && sudo pacman -Sy --needed archlinux-keyring && sudo pacman-key --populate archlinux && sudo pacman -Syyu" &
    ;;
    --open-pamac)
        if [[ -f $(which pamac-manager) ]]; then
            exec pamac-manager --updates &
        fi
    ;;
esac
# Set keyboard to BR ABNT2 default
setxkbmap -layout br,us -option grp:alt_shift_toggle


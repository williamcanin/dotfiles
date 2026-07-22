#!/usr/bin/env sh


case $1 in
  --show)
    # Interface de rede
    IFACE="eno1"

    if ip link show "$IFACE" up > /dev/null 2>&1; then
      
      # Pega o IP da interface
      IP=$(ip -4 addr show "$IFACE" | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -n1)
      
      if [ -n "$IP" ]; then
        echo " $IP"
      else
        echo ""
      fi
    
    else
      echo ""
   fi
  ;;
  --vim)
   ## Install: sudo pacman -S vim terminator
   exec terminator --command="echo \"[ Vim: Network Edition ]\nEnable or disable interface: sudo ip link set eno1 [down|up]
\"; sudo vim /etc/systemd/network/20-wired.network"
   #exec terminator --command="echo \"[ Vim: Network Edition ]\n\"; sudoedit /etc/systemd/network/20-wired.network"
  ;;
  --xed)
    exec pkexec xed /etc/systemd/network/20-wired.network
    # exec terminator --command="echo \"[ Network Edition ]\n\"; pkexec xed /etc/systemd/network/20-wired.network"
  ;;
  --less)
    exec terminator --command="less /etc/systemd/network/20-wired.network --less"
  ;;
esac


#!/usr/bin/env sh


case $1 in
    --status)
    if pgrep redshift > /dev/null; then
        echo ""  # noite ligada
    else
        echo ""  # noite desligada
    fi
    ;;
    --toggle)
    # Toggle Redshift e retorna status para Polybar
    PID=$(pgrep redshift)
    LAT=-21.66919
    LONG=-49.69329

    if [ -n "$PID" ]; then
        pkill redshift
        echo ""  # ícone quando desligado
    else
        redshift -l $LAT:$LONG & 
        echo ""  # ícone quando ligado
    fi
    ;;
esac

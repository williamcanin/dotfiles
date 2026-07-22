#!/usr/bin/env bash


case $1 in
  --show)

  # padrão 3 espaços
  SPACES="   "


  # Adicione AQUI aplicativos que tem tray
  APPS=(steam VeraCrypt Discord Telegram Slack)

  TRAY_ACTIVE=false

  for win in $(xprop -root _NET_CLIENT_LIST 2>/dev/null | grep -o "0x[0-9a-fA-F]\+"); do
    class=$(xprop -id $win WM_CLASS 2>/dev/null)
    
    # verifica se a classe da janela está no array APPS
    for app in "${APPS[@]}"; do
      if [[ "$class" == *"$app"* ]]; then
        TRAY_ACTIVE=true
        break 2  # já encontrou, sai dos dois loops
      fi
    done
  done

  if [ "$TRAY_ACTIVE" = true ]; then
    echo "$SPACES"
  else
    echo ""
  fi

  ;;
esac


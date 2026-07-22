#!/usr/bin/env sh
# shellcheck disable=SC2086,SC2296,SC2016,SC1091

### [ Load compinit ] ------------------------------------------------------------------

autoload -Uz compinit
compinit -C

zstyle ':completion:*' menu select

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*' matcher-list '' \
    'm:{a-z}={A-Z}' \
    'r:|[._-]=* r:|=*'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --icons --tree --color=always $realpath'




### [ Load ~/.keyrc ] ------------------------------------------------------------------
## IMPORTANT: THIS FILE IS SENSITIVE, YOU MUST ENCRYPT IT.
[ -f "$HOME/.keyrc" ] && . "$HOME/.keyrc"



### [ Load os-release ] -----------------------------------------------------------------

. /etc/os-release


### [ ZSH Plugins ] ---------------------------------------------------------------------

# if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
#   git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# fi

# if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
#   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# fi

### [ Editor ] --------------------------------------------------------------------------
## Preferred editor for local and remote sessions

export EDITOR='vim'



### [ Get Distro ] ----------------------------------------------------------------------

# export DISTRO=$(cat `ls -atr /etc/*-release | tail -2` | grep "PRETTY_NAME" | cut -d= -f2 |  sed 's/"//g')



### [ Arch Linux ] ----------------------------------------------------------------------
## Commands for managing Arch Linux
## Usage: alias arch='arch_command__alias'

if [ "$ID" = "arch" ]; then

  arch_command__alias() {
    GREEN='\033[0;32m'
    YELLOW='\033[1;33m'
    NC='\033[0m'

    flag="$1"

    case "$flag" in
      --update|-u)
        printf "%s[ Arch Linux Update ]%s" "$GREEN" "$NC"
        su -c "pacman -Sy --needed archlinux-keyring; pacman-key --populate archlinux; pacman -Syyu"
      ;;
      --orphans|-o)
        printf "%s[ Arch Linux Packages Orphans ]%s" "$YELLOW" "$NC"
        pkgs
        pkgs="$(pacman -Qdtq)"

        if [ -n "$pkgs" ]; then
          sudo pacman -Rs "$pkgs"
        else
          echo "no orphans to remove"
        fi
      ;;
      --clean-cache|-cc)
        printf "%s[ Arch Linux Clean Cache ]%s" "$YELLOW" "$NC"
        printf 's\ns\n' | sudo pacman -Scc
      ;;
      --list|-l)
        printf "%s[ Installed Packages ]%s" "$GREEN" "$NC"
        pacman -Qe
      ;;
      *)
        echo "Usage: arch <options>"
        echo ""
        echo "options:"
        echo "  --update  | -u       ------------- Update system"
        echo "  --orphans | -o       ------------- List packages orphans"
        echo "  --clean-cache | -cc  ------------- Clean package cache"
        echo "  --list | -l          ------------- List of installed packages"
      ;;
    esac
  }

fi



### [ Android Studio ] ------------------------------------------------------------------

[ -d "/opt/android-studio/bin" ] && export PATH="/opt/android-studio/bin:$PATH"

if [ -d "$HOME/Android/Sdk" ]; then
  export ANDROID_HOME="$HOME/Android/Sdk"
  export ANDROID_AVD_HOME="$HOME/.config/.android/avd"
  export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH"
fi


### [ Poetry ] ---------------------------------------------------------------------------
## Install via script "get-poetry.py"

[ -d "$HOME/.poetry/bin" ] && export PATH="$HOME/.poetry/bin:$PATH"



### [ Rust ] -----------------------------------------------------------------------------

[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"



### [ Pyenv ] ----------------------------------------------------------------------------
## Nota: Pyenv instalado manualmente, sem ser pela distro

#command -v pyenv >/dev/null && [ -d "$HOME/.pyenv/bin" ] && {
#  export PYENV_ROOT="$HOME/.pyenv"
#  export PATH="$PYENV_ROOT/bin:$PATH"
#  eval "$(pyenv init - zsh)"
#}




# ### [ Direnv ] ----------------------------------------------------------------------------

command -v direnv >/dev/null && {
  case "$SHELL" in
    */zsh)
      eval "$(direnv hook zsh)"
    ;;
    */bash)
      eval "$(direnv hook bash)"
    ;;
  esac
}



### [ NVM ] -------------------------------------------------------------------------------
## Node Version Manager - Simple bash script to manage multiple active node.js versions
## Arch Linux install: sudo pacman -S nvm
## Use: nvm install 22 (NodeJs 22+)

# export NVM_DIR="$HOME/.nvm"
# [ -s "/usr/share/nvm/init-nvm.sh" ] && . "/usr/share/nvm/init-nvm.sh"
# [ -s "/usr/share/nvm/bash_completion" ] && . "/usr/share/nvm/bash_completion"



### [ Nodenv ] ------------------------------------------------------------------------------

command -v nodenv >/dev/null && eval "$(nodenv init -)"



### [ Ruby (rbenv) ] ------------------------------------------------------------------------
## https://github.com/rbenv/rbenv

#[ -d "$HOME/.rbenv/bin" ] && {
#  export PATH="$HOME/.rbenv/bin:$PATH"
#  eval "$(rbenv init - zsh)"
#}



### [ RubyGems ] ----------------------------------------------------------------------------

if command -v ruby > /dev/null && command -v gem > /dev/null; then
  # export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
  export GEM_HOME="$HOME/.local/share/gem/ruby/3.4.0"
  export GEM_BIN="$GEM_HOME/bin"
  export PATH="$GEM_HOME:$GEM_BIN:$PATH"
fi



### [ Golang ] -------------------------------------------------------------------------------

if command -v go >/dev/null; then
  export GOPATH="$HOME/.go"
  export PATH="$GOPATH/bin:$PATH"
fi



### [ Laravel ] -------------------------------------------------------------------------------

[ -d "$HOME/.config/composer/vendor/bin" ] && export PATH="$HOME/.config/composer/vendor/bin:$PATH"



### [ Java ] -----------------------------------------------------------------------------------

[ -d "/usr/lib/jvm/default" ] && export JAVA_HOME="/usr/lib/jvm/default" && export PATH="$JAVA_HOME/bin:$PATH"



### [ Flutter ] ---------------------------------------------------------------------------------

[ -d "/opt/flutter" ] && export PATH="/opt/flutter/bin:$PATH"



### [ Snap ] -------------------------------------------------------------------------------------
## Arch Linux
## First of all, create the symbolic link: `ln -sF /var/lib/snapd/snap /snap`

[ -d "/snap/bin" ] && export PATH="/snap/bin:$PATH"



### [ FlatPak ] -----------------------------------------------------------------------------------
## XDG_DATA_DIRS

[ -d "/var/lib/flatpak/exports/share" ] && \
export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share:$XDG_DATA_DIRS"



### [ Wine ] ---------------------------------------------------------------------------------------

[ -d "$HOME/.wine" ] && export PATH="win32:$HOME/.wine:$PATH"



### [ Cowsay ] -------------------------------------------------------------------------------------

# command -v cowsay >/dev/null && cowsay -r "Welcome back, $(whoami)"



### [ Jayatana ] ------------------------------------------------------------------------------------
## For "vala-panel-appmenu" in XFCE
## See: https://github.com/rilian-la-te/vala-panel-appmenu

[ -f "/usr/share/java/jayatanaag.jar" ] && {
  export _JAVA_OPTIONS="$_JAVA_OPTIONS -javaagent:/usr/share/java/jayatanaag.jar"
  export JAVA_TOOL_OPTIONS="-javaagent:/usr/share/java/jayatanaag.jar"
}



### [ Vulkan ] --------------------------------------------------------------------------------------

[ -f "/usr/share/vulkan/icd.d/nvidia_icd.json" ] && export PATH="/usr/share/vulkan/icd.d/nvidia_icd.json:$PATH"



### [ Pkgfile ] -------------------------------------------------------------------------------------

if [ -f "/usr/share/doc/pkgfile/command-not-found.zsh" ]; then
  . /usr/share/doc/pkgfile/command-not-found.zsh
fi



### [ Delete securely ] -----------------------------------------------------------------------------
## Function to securely remove files and folders using shred using.
## Usage: alias rip='question_security_delete__alias'

if command -v zenity >/dev/null; then
  question_security_delete__alias() {
    target="$1"
    interations=3

    [ -z "$target" ] && {
      echo "usage: rip <file|directory>"
      return 1
    }

    if ! command -v zenity >/dev/null; then
      echo "zenity not found"
      return 1
    fi

    if zenity --question \
      --width=500 \
      --text="Do you wish to permanently delete: $target ?"; then

      if [ -f "$target" ]; then
        shred -n $interations -z -u -v -- "$target"

      elif [ -d "$target" ]; then
        # Shred in all files
        find "$target" -type f -exec shred -n $interations -z -u -v -- {} \;

        # Remove diretórios vazios
        find "$target" -type d -empty -delete
        # Restore folder trash
        mkdir -p "$HOME/.local/share/Trash/files"
      else
        echo "not a valid file or directory"
      fi
    fi
  }
fi



### [ Fastfetch ] ------------------------------------------------------------------------------------
fastfetch__alias() {
  fastfetch "$@"
}



### [ Flashiso ] -------------------------------------------------------------------------------------
## Grava iso em dispositivos USB
## Uso: flashiso ~/Downloads/arch.iso sdb

flashiso__alias() {
  if [ "$#" -ne 2 ]; then
    echo "Uso: flashiso <imagem.iso> <sdX>"
    echo "Exemplo: flashiso arch.iso sdd"
    return 1
  fi

  ISO="$1"
  DEV="/dev/$2"

  echo "ISO:  $ISO"
  echo "DEST: $DEV"
  echo

  printf 'Tem certeza? Isso APAGA o dispositivo "%s"! (yes/N) ' "$DEV"
  read -r CONFIRM

  if [ "$CONFIRM" != "yes" ]; then
    echo "Cancelado."
    return 1
  fi

  # Desmonta qualquer partição montada do dispositivo
  for p in "${DEV}"?*; do
    sudo umount "$p" 2>/dev/null
  done

  # Grava a ISO
  echo "Gravando..."
  sudo dd if="$ISO" of="$DEV" bs=16M oflag=direct status=progress && sync
  echo "Terminado!"
}

### [ System analysis ] ---------------------------------------------------------------------

# Log error boots. E.g:
# boot-err  0     # boot current
# boot-err -1     # boot before
# boot-err -2     # two boots before
boot_err__alias() {
  journalctl -b "${1:-0}" -p err
}

# Services logs. E.g:
# servlog NetworkManager
# servlog docker
# servlog sshd
serv_log__alias() {
  journalctl -u "$1" -b
}



### [ Modern shell ] --------------------------------------------------------------------
ls__alias() {
  eza --icons "$@"
}
if [ -n "$ZSH_VERSION" ]; then
  compdef _eza ls
fi



### [ Git Bare Local ] ---------------------------------------------------------------------
# Prepare:
# git config --global url."file:///run/media/$USER/files/".insteadOf hdd:
# Path: "file:///run/media/$USER/files/" It's the root of the HDD.

git_bare__alias() {
    SRC="$PWD"
    NAME
    SUBDIR="${1:-}"
    DEST="/run/media/$USER/files/git"
    REMOTE_PATH="hdd:git"

    if ! git rev-parse --git-dir >/dev/null 2>&1; then
        echo "It's not inside a git repository."
        return 1
    fi

    NAME="$(basename "$SRC")"

    # Optional subdirectory
    if [ -n "$SUBDIR" ]; then
        DEST="$DEST/$SUBDIR"
        REMOTE_PATH="$REMOTE_PATH/$SUBDIR"
    fi

    mkdir -p "$DEST" || return

    TARGET="$DEST/${NAME}.git"

    if [ -e "$TARGET" ]; then
        echo "The repository already exists:"
        echo "$TARGET"
        return 1
    fi

    # Create bare
    git clone --bare "$SRC" "$TARGET" || return

    # Add remote only if it doesn't exist
    if ! git remote get-url hdd >/dev/null 2>&1; then
        git remote add hdd "$REMOTE_PATH/${NAME}.git"
    fi

    # Or just: git remote add hdd file://"$TARGET"

    echo
    echo "Bare created on:"
    echo "$TARGET"

    echo
    echo "Remote added:"
    echo "$REMOTE_PATH/${NAME}.git"
}


### [ FZF TAB COLORS ] -------------------------------------------------------------------------------

if [ -n "$ZSH_VERSION" ]; then
  zstyle ':fzf-tab:*' fzf-flags --color=bg:#262626,fg:#dddddd,hl:#1a8fff,fg+:#ffffff,bg+:#3a3a3a
fi



### [ Cursor ] ---------------------------------------------------------------------------------------

## Manual configuration for cursor action.
## \e[0 q - terminal standard
## \e[1 q - flashing block
## \e[2 q - fixed block
## \e[3 q - blinking underline
## \e[4 q - fixed underline
## \e[5 q - beam blinking
## \e[6 q - fixed beam

# precmd() { echo -ne '\e[1 q' }

# # Ensures cursor block even when starting a command line.
# zle-line-init() { echo -ne '\e[1 q' }
# zle -N zle-line-init

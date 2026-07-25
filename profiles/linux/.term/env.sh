#!/usr/bin/env sh

## IMPORTANT!
##
## DO NOT PUT KEY AND PASSWORD VALUES HERE. PUT THEM IN THE ~/.keyrc FILE.
#
#
#
### [ LS_OPTIONS ] -------------------------------------------------------------
export LS_OPTIONS='--color=auto'

### [ VCPKG ] ------------------------------------------------------------------
## Install: git clone https://github.com/microsoft/vcpkg ~/.local/share/vcpkg
## Update: git -C $VCPKG_ROOT pull

export VCPKG_ROOT="$HOME/.local/share/vcpkg"



### [ Workflow ] ---------------------------------------------------------------
## Copy files and executable scripts

export WORKFLOW_PATH="$HOME/.workflow"



### [ Local Bins ] --------------------------------------------------------------------------

export PATH="$HOME/.bin:$HOME/.cargo/bin:$HOME/.bin/libs:$HOME/.local/python/bin:$HOME/node_modules/.bin:$HOME/.local/bin:$HOME/bin:$PATH"



### [ osxcross ] ----------------------------------------------------------------------------

export PATH="$HOME/.osxcross/target/bin:$PATH"



### [ MAN ] ---------------------------------------------------------------------------------

export MANPATH="/usr/local/man:$MANPATH"



### [ Trash ] -------------------------------------------------------------------------------
export TRASH="$HOME/.local/share/Trash/files"



### [ LANG ] --------------------------------------------------------------------------------

# export LANG=en_US.UTF-8
export LANG=pt_BR.UTF-8



### [ FLAGS ] -------------------------------------------------------------------------------

export ARCHFLAGS="-arch x86_64"



### [ ZSH_AUTOSUGGEST ] ---------------------------------------------------------------------

## Foreground color for black terminal
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#6c6c6c'



### [ DotCtrl ] -----------------------------------------------------------------------------
## https://github.com/snakypy/dotctrl

export DOTFILES_HOME="/home/.dotfiles"
export DOTCTRL_PATH="$DOTFILES_HOME/linux"




### [ Rust ] --------------------------------------------------------------------------------

export CARGO_HOME="/home/rust/cargo"
export RUSTUP_HOME="/home/rust/rustup"
export PATH="$CARGO_HOME/bin:$PATH"



### [ OpenCode ] --------------------------------------------------------------------------
export PATH="$HOME/.opencode/bin:$PATH"



### [ OpenRouter ] --------------------------------------------------------------------------
## Requires: nodejs v24+
## Install: sudo npm install -g @gitlawb/openclaude --no-optional --ignore-scripts
## Note: OPENAI_API_KEY is in ~/.keyrc

#export CLAUDE_CODE_USE_OPENAI=1
#export OPENAI_BASE_URL=https://openrouter.ai/api/v1
#export OPENAI_MODEL=gpt-4o



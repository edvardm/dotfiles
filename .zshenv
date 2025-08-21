export EDITOR=nvim
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH=~/.cargo/bin:~/.local/bin:~/.ghcup/bin:~/.cabal/bin:/usr/local/bin:/usr/local/sbin:${PATH}

export GOPATH=$HOME/.go
export GO111MODULE=on
export PATH=$PATH:$GOPATH/bin
export XDG_CONFIG_HOME=$HOME/.config
export PIP_DISABLE_PIP_VERSION_CHECK=1

export PAGER="less -FX"

export DOCKER_BUILDKIT=1

export GPG_TTY=$(tty)

export TMUXP_CONFIGDIR=${XDG_CONFIG_HOME}/tmuxp
export TMUX_PLUGIN_MANAGER_PATH=${XDG_CONFIG_HOME}/tmux/plugins
export HOMEBREW_NO_AUTO_UPDATE=1

export HOMEBREW_NO_ENV_HINTS=1
export GHC_OPTIONS="-Wall -Werror"

export DISABLE_AUTO_TITLE=true

# fix mancolors for dark bg
export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;33m'     # begin blink
export LESS_TERMCAP_so=$'\e[01;44;37m' # begin reverse video
export LESS_TERMCAP_us=$'\e[01;37m'    # begin underline
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal

export PATH=$HOME/.local/share/bob/nvim-bin:$PATH
test -d $HOME/.cargo/env && . "$HOME/.cargo/env"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=120

HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(cabal git git-extras kubectl extract fasd
    gpg-agent colored-man-pages stack zsh-syntax-highlighting)
# plugins+=(zsh-vi-mode)

source $ZSH/oh-my-zsh.sh

export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;33m'     # begin blink

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

### Direnv
eval "$(direnv hook zsh)"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="--ansi --bind='ctrl-o:execute(xdg-open {})'"
export FZF_CTRL_T_OPTS="--preview-window 'right:60%' --preview 'bat --color=always --style=header,changes --line-range :300 {}'"

setopt autolist
zstyle ':completion:*' menu select

# zmv is awesome
autoload -U zmv

fpath+=~/.zfunc

autoload -Uz compinit
compinit

# compdefs for aliases

zstyle ':completion:*:*:make:*' tag-order 'targets'
compdef g=git
# compdef kg='kubernetes get'
compdef remake=make
# compdef j=just
# end of compdefs

# stty -ixon # no xon/xoff

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Really -- this for ignoring all dups in history :3
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP

setopt PROMPT_SUBST

test -f ~/.poetry/env && source ~/.poetry/env

# source $HOME/.config/broot/launcher/bash/br

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

[ -f "${HOME}/.ghcup/env" ] && source "${HOME}/.ghcup/env"

eval "$(zoxide init zsh --cmd z)"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh" # This loads nvm

source ~/Code/fzf-git.sh/fzf-git.sh

eval "$(starship init zsh)"

source $HOME/.docker/init-zsh.sh || true # Added by Docker Desktop

# eval "$(~/.local/bin/mise activate zsh)"

test -f ~/work/aliases && . ~/work/aliases

. "$HOME/.cargo/env"


# complete ssh hosts by alias, not full hostname
zstyle ':completion:*:(ssh|scp|sftp):*' hosts


# pnpm
export PNPM_HOME="/Users/ed/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval $(bob complete zsh)
test -d ~/.claude && alias cl=~/.claude/local/claude


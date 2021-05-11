unalias ggsup > /dev/null 2>&1


if [ "$(uname -s)" = "Darwin" ]; then
    # coreutils for mac
    alias tar='gtar'
    alias sed='gsed'
    alias find='gfind'
    alias date='gdate'

    alias cin='pbcopy'

elif [ "$(uname -s)" = "Linux" ]; then
    alias susp='systemctl suspend'
    alias cin='xclip -selection c'
    alias wakeup='xrandr --output HDMI-2 --mode 3840x2160 --right-of eDP-1'
fi

alias aG='alias | grep'
alias ag=ansible-galaxy
alias agi='sudo apt install'
alias agrp='sudo apt remove --purge'
alias agu='sudo apt update && sudo apt-get -y upgrade'
alias an=ansible
alias ap=ansible-playbook
alias aws2='/usr/local/bin/aws'
alias ecr-login='aws-ecr-auth | aws-docker-login'
alias bld='cargo build'
alias bri='brew install'
alias c='\cat'
alias cat='bat --style="changes" --color auto'
alias ci='cargo install'
alias cleanswp='rm -rf ~/.local/share/nvim/*.swp'
alias cook='cookiecutter'
alias d='git diff'
alias da='direnv allow'
alias dc='docker-compose'
alias de='direnv edit'
alias dk='docker'
alias dkv='docker volume'
alias drun='docker run -it --rm'
alias e='nvim'
alias emacs=vi
alias ft="\fzf-tmux -d 15"
alias fzf="\fzf -m --preview 'cat --color=always {}'"
alias g='git'
alias gp='git push --follow-tags'
alias gpfnv='git push --force-with-lease --no-verify'
alias gpnv='git push --no-verify --follow-tags'
alias gr='rg'
alias grep='ggrep --color=auto'
alias grbmr='git pull --rebase origin master'
alias gs='git stash'
alias gsp='git stash push'
alias i='(type ipython >/dev/null || pip install ipython readline) && ipython'
alias isodate='date --utc +%FT%TZ'
alias isodate_fs="isodate | sed 's/\://g'"
alias k='kubectl'
alias kd='kubectl describe'
alias kg='kubectl get'
alias l='ls'
alias la='l -a'
alias lc=litecli
alias lint='pylint -f colorized --disable=missing-docstring'
alias ll='l -l'
alias lla='ll -a'
alias ls='\exa --git --group-directories-first'
alias lt='ls  -l --sort=oldest'
alias ltr='ls  -l --sort=newest'
alias lzd='lazydocker'
alias make='remake'
alias mk=remake
alias mutt=neomutt
alias nf=neofetch
alias pg='pgcli'
alias pie='http'  # pie is so much easier to search from history
alias piens='http --verify false'
alias pin='poetry install --no-root'
alias ping='prettyping'
alias po='poetry'
alias prm='poetry remove'
alias relock='git checkout --ours poetry.lock && git add poetry.lock'
alias py='python3'
alias r="\nvim -R"
alias recent='lt --color=always| head -10'
alias rg='\rg --smart-case' # ripgrep
alias rgn='rg -N'
alias rmpyc='fd -I __pycache__ | xargs  rm -r'
alias run='cargo run'
alias sl=sqlite3
alias ssh.iceye='e ~/.ssh/config.d/iceye'
alias st='git status'
alias suspend='systemctl suspend -i'
alias tf=terraform
alias todo='nvim -n ~/Documents/personal.todo.md'
alias tree='ls --tree --git-ignore'
alias venv='(test -d ${VENV-.venv} || python -m venv ${VENV-.venv}) && source ${VENV-.venv}/bin/activate'
alias vialias="nvim ~/.oh-my-zsh/custom/aliases.zsh ; source ~/.oh-my-zsh/custom/aliases.zsh"
alias vifun='e ~/.oh-my-zsh/custom/functions.zsh; source ~/.oh-my-zsh/custom/functions.zsh'
alias vim="\nvim"
alias vimrc='nvim ~/.config/nvim/init.vim'
alias vtime='/usr/bin/time -v'
alias vv='vim "$(fzf)"'
alias wakeup='xrandr --output HDMI-2 --mode 3840x2160 --right-of eDP-1'
alias wtodo='nvim -n ~/Documents/work.todo.md'
alias xz='\xz -T0'
alias zshenv='nvim ~/.zshenv'
alias zshrc='nvim ~/.zshrc'
ignore_local() {
  mkdir -p .git/info/
	echo $* >> .git/info/exclude
}

dl_music() {
  pushd ~/Music ; youtube-dl --embed-thumbnail -w --audio-quality 4 -x --audio-format best "$1" ; popd
}

inplace_sort() {
  args="$@"
  tmp=sort.tmp.$$
  fname=${@[-1]}
  sort $args > $tmp && mv $tmp "$fname"
}

mcd() {
  mkdir -p $1 && cd $1
}

pycook() {
  cookiecutter --no-input -f ~/code/python_cookiecutter "$*"
}


# so that pyenv works immediately after pip changes
unalias pip > /dev/null 2>&1
pip() {
    pip3 $* && (pyenv rehash > /dev/null 2>&1)
}

viewlines() { sed -n "\"$1\",\"$2\"p" "$3"; }

shell2task() {
  # really quick invoke tasks
  name=${1//-/_}
  cmd="${2}"
  \cat <<EOF
from invoke import task

@task
def $name(ctx):
    """Description"""
    ctx.run("$cmd")
EOF
}

disableipv6() {
    sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
    sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
}

mkhost() {
    echo "${1}\t${@:2}" | sudo tee -a /etc/hosts
}

# source any secret stuff if present
WORK=~/dotfiles/oh-my-zsh/custom/aliases.work.zsh
test -f $WORK && source $WORK

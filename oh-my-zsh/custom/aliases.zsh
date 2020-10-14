unalias ggsup > /dev/null 2>&1


if [ "$(uname -s)" = "Darwin" ]; then
    # coreutils for mac
    alias tar='gtar'
    alias sed='gsed'
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
alias autoflake='\autoflake -r --in-place --remove-all-unused-imports'
alias autopep8='\autopep8 -aa --experimental --in-place --recursive'
alias mutt=neomutt
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
alias ft="\fzf-tmux -d 15"
alias fzf="\fzf -m --preview 'cat --color=always {}'"
alias g='git'
alias gpfnv='git push --force-with-lease --no-verify'
alias gpnv='git push --no-verify'
alias gr='rg'
alias grbmr='git pull --rebase origin master'
alias gs='git stash'
alias gsp='git stash push'
alias i='(type ipython >/dev/null || pip install ipython readline) && ipython'
alias isodate='date --utc +%FT%TZ'
alias isodate_fs="isodate | sed 's/\://g'"
alias l='ls'
alias la='l -a'
alias lint='pylint -f colorized --disable=missing-docstring'
alias ll='l -l'
alias lla='ll -a'
alias ls='\exa --git --group-directories-first'
alias lt='ls  -l --sort=oldest'
alias ltr='ls  -l --sort=newest'
alias lzd='lazydocker'
alias pg='pgcli'
alias pie='http'  # pie is so much easier to search from history
alias ping='prettyping'
alias po='poetry'
alias poetry_shell='. "$(dirname $(poetry run which python))/activate"'
alias py='python3'
alias r="\nvim -R"
alias recent='lt --color=always| head -10'
alias rg='\rg --smart-case' # ripgrep
alias rgn='rg -N'
alias rmpyc='fd -I __pycache__ | xargs  rm -r'
alias run='cargo run'
alias ssh.iceye='e ~/.ssh/config.d/iceye'
alias st='git status'
alias suspend='systemctl suspend -i'
alias test_cook='cook -f --no-input ~/code/python_cookiecutter/ makes_http_requests=n http_api=n && cd my_project'
alias tf=terraform
alias todo='nvim -n ~/Documents/personal.todo.md'
alias tree='ls --tree --git-ignore'
alias vialias="nvim ~/.oh-my-zsh/custom/aliases.zsh ; source ~/.oh-my-zsh/custom/aliases.zsh"
alias vifun='e ~/.oh-my-zsh/custom/functions.zsh; source ~/.oh-my-zsh/custom/functions.zsh'
alias vim="\nvim"
alias vimrc='nvim ~/.config/nvim/init.vim'
alias vtime='/usr/bin/time -v'
alias vv='vim "$(fzf)"'
alias wakeup='xrandr --output HDMI-2 --mode 3840x2160 --right-of eDP-1'
alias wtodo='nvim -n ~/Documents/work.todo.md'
alias zshenv='nvim ~/.zshenv'
alias zshrc='nvim ~/.zshrc'

ignore_local() {
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

charm() {
    /usr/local/share/pycharm/bin/pycharm.sh $* &!
}

mkhost() {
    echo "${1}\t${@:2}" | sudo tee -a /etc/hosts
}

# source any secret stuff if present
test -f aliases.work.zsh && source aliases.work.zsh

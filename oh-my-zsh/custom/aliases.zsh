unalias ggsup > /dev/null 2>&1

alias aG='alias | grep'
alias todo='nvim -n ~/work.todo'
alias agi='sudo apt install'
alias agu='sudo apt update && sudo apt-get -y upgrade'
alias ci='cargo install'
alias autoflake='\autoflake -r --in-place --remove-all-unused-imports'
alias autopep8='\autopep8 -aa --experimental --in-place --recursive'
alias charm='pycharm-community'
alias clipin='xclip -selection c'
alias clipout='xclip -selection c -o'
alias cat='bat --style="changes" --color auto'
alias cook='cookiecutter'
alias de='direnv edit'
alias d='git diff'
alias e='nvim'
alias fzf="\fzf -m --preview 'cat --color=always {}'"
alias ft="\fzf-tmux -d 15"
alias g='git'
alias tf=terraform
alias dk='docker'
alias drun='docker run -it --rm'

# TODO: move these to .gitconfig?
alias gpfnv='git push --force-with-lease --no-verify'
alias gpnv='git push --no-verify'
alias grbmr='git pull --rebase origin master'
alias gr='rg'
alias gs='git stash'
alias gsp='git stash push'

alias rg='\rg --smart-case' # ripgrep
alias rgn='rg -N'
alias i='(type ipython >/dev/null || pip install ipython readline) && ipython'
alias isodate='date --utc +%FT%TZ'
alias isodate_fs="isodate | sed 's/\://g'"
alias suspend='systemctl suspend'
alias dc='docker-compose'
alias cleanswp='rm -rf ~/.local/share/nvim/*.swp'
alias ls='\exa --git --group-directories-first'
alias tree='ls --tree --git-ignore'
alias l='ls'
alias lt='ls  -l --sort=oldest'
alias ltr='ls  -l --sort=newest'
alias recent='lt --color=always| head -10'
alias lint='pylint -f colorized --disable=missing-docstring'
alias la='l -a'
alias ll='l -l'
alias lla='ll -a'
alias pie='http'  # pie is so much easier to search from history
alias ping='prettyping'
alias franz='killall franz ; \franz &'
alias po='poetry'
alias py='python3'
alias st='git status'
alias test_cook='cook -f --no-input ~/code/python_cookiecutter/ makes_http_requests=n http_api=n && cd my_project'
alias vialias="nvim ~/.oh-my-zsh/custom/aliases.zsh ; source ~/.oh-my-zsh/custom/aliases.zsh"
alias vim="\nvim"
alias r="\nvim -R"
alias vv='vim "$(fzf)"'
alias vtime='/usr/bin/time -v'
alias zshenv='nvim ~/.zshenv'
alias zshrc='nvim ~/.zshrc'
alias lzd='lazydocker'
alias vimrc='nvim ~/.config/nvim/init.vim'
alias rmpyc='fd -I __pycache__ | xargs  rm -r'


alias wakeup='xrandr --output HDMI-2 --mode 3840x2160 --right-of eDP-1'

ignore-local() {
	echo $1 >> .git/info/exclude
}

dl-music() {
  pushd ~/Music ; youtube-dl --embed-thumbnail -w --audio-quality 4 -x --audio-format best "$1" ; popd
}

inplace-sort() {
  args="$@"
  fname=${@[-1]}
  sort $args > .sort.tmp && mv .sort.tmp "$fname"
}


venv() {
  test -d .venv || python -m venv .venv
  . .venv/bin/activate
}

mcd() {
  mkdir -p $1 && cd $1
}

pycook() {
  cookiecutter --no-input -f ~/code/python_cookiecutter "$*"
}


# so that pip
unalias pip > /dev/null 2>&1
pip() {
    pip3 $* && (pyenv rehash > /dev/null 2>&1)
}

viewlines() { sed -n "\"$1\",\"$2\"p" "$3"; }

shell2task() {
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

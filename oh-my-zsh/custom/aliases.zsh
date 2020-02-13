unalias ggsup > /dev/null 2>&1

alias aG='alias | grep'
alias todo='nvim ~/work.todo'
alias agi='sudo apt install'
alias agu='sudo apt update && sudo apt-get -y upgrade'
alias ci='cargo install'
alias autoflake='\autoflake -r --in-place'
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
alias ls='\exa --git --group-directories-first'
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
alias req2poetry="sed 's/==\(.*\)/ = \"^\1\"/'"
alias franz='killall franz ; \franz &'
alias po='poetry'
alias py='python3'
alias pytest='\pytest --durations 3'
alias st='git status'
alias test_cook='cook -f --no-input ~/code/python_cookiecutter/ makes_http_requests=n http_api=n && cd my_project'
alias vialias="nvim ~/.oh-my-zsh/custom/aliases.zsh ; source ~/.oh-my-zsh/custom/aliases.zsh"
alias vim="\nvim"
alias r="\nvim -R"
alias vv='vim "$(fzf)"'
alias vtime='/usr/bin/time -v'
alias zshenv='nvim ~/.zshenv'
alias zshrc='nvim ~/.zshrc'
alias vimrc='nvim ~/.config/nvim/init.vim'
alias vpn="openconnect --disable-ipv6 --verbose --user emajakari --authgroup NewSpace --no-dtls https://vpnfi.iceye.com/"


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

pyfix() {
    autoflake $1 && isort $1 && black $1
}

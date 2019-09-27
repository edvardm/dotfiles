unalias ggsup > /dev/null 2>&1 

alias aG='alias | grep'
alias agi='sudo apt install'
alias agu='sudo apt update && sudo apt-get -y upgrade'
alias autoflake='\autoflake -r --in-place'
alias autopep8='\autopep8 -aa --experimental --in-place --recursive'
alias charm='pycharm-community'
alias clipin='xclip -selection c'
alias clipout='xclip -selection c -o'
alias cook='cookiecutter'
alias de='direnv edit'
alias d='git diff'
alias e='nvim'
alias fzf="\fzf -m --preview 'bat --style=numbers --color=always {}'"
alias ft="\fzf-tmux -d 15"
alias g='git'

# TODO: move these to .gitconfig?
alias gpfnv='git push --force-with-lease --no-verify'
alias gpnv='git push --no-verify'
alias grbmr='git rebase origin/master'
alias gr='rg'
alias gs='git stash'
alias gsp='git stash push'

alias rg='\rg --smart-case' # ripgrep
alias rgn='rg -N'
alias i='(type ipython >/dev/null || pip install ipython readline) && ipython'
alias isodate='date --utc +%FT%TZ'
alias l='\exa --git'
alias lint='pylint -j8 -rn -f colorized --disable=missing-docstring'
alias la='l -a'
alias ll='l -l'
alias lla='ll -a'
alias pie='http'  # pie is so much easier to search from history
alias ping='prettyping'
alias req2poetry="sed 's/==\(.*\)/ = \"^\1\"/'"
alias po='poetry'
alias py='python3'
alias pytest='\pytest --durations 3'
alias st='git status'
alias test_cook='cook -f --no-input ~/code/python-cookiecutter/ makes_http_requests=n http_api=n && cd my_project'
alias vialias="nvim ~/.oh-my-zsh/custom/aliases.zsh ; source ~/.oh-my-zsh/custom/aliases.zsh"
alias vim="\nvim"
alias view="\nvim -R"
alias vtime='/usr/bin/time -v'
alias zshenv='nvim ~/.zshenv'
alias zshrc='nvim ~/.zshrc'
alias vimrc='nvim ~/.config/nvim/init.vim'
alias wakeup='xrandr --output HDMI-2 --auto --right-of eDP-1'

local-ignore() {
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
  cookiecutter -f ~/code/python_cookiecutter project_name=$1
}


unalias pip > /dev/null 2>&1
pip() {
    pip3 $* && pyenv rehash
}

mv_dotfile() {
  echo mv $1 ~/dotfiles/
  echo ln -s parent($1) ~/dotfiles/$1
}

fsub() {
    ambr $1 $2 && git commit -m "$1 -> $2"
}


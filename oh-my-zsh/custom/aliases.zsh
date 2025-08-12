unalias ggsup >/dev/null 2>&1

if [ "$(uname -s)" = "Darwin" ]; then
  # coreutils for mac
  alias tar='gtar'
  alias sed='gsed'
  alias find='gfind'
  alias date='gdate'
  alias grep='ggrep'

  alias cin='pbcopy'
  alias sleep=gsleep
  alias units=gunits
  alias reset-time='sudo sntp -sS time.apple.com'
  alias flush-dns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
elif [ "$(uname -s)" = "Linux" ]; then
  command -v dzdo >/dev/null 2>&1 && alias sudo=dzdo
  alias susp='systemctl suspend'
  alias cin='xclip -selection c'
  alias wakeup='xrandr --output HDMI-2 --mode 3840x2160 --right-of eDP-1'
fi

# global aliases
alias -g P="| less"
alias -g H="--help | less"

alias a='asdf'
alias aG='alias | grep'
alias autoflake='\autoflake --in-place --remove-all-unused-imports --remove-unused-variables --remove-duplicate-keys --ignore-init-module-imports -r'
alias ag=ansible-galaxy
alias s="git status"
alias gsn='git status -s | cut -c4-' # names only
alias agi='sudo apt-fast install'
alias agrp='sudo apt remove --purge'
alias agu='sudo apt update && sudo apt-get -y upgrade'
alias an=ansible
alias ap=ansible-playbook
alias aws2='/usr/local/bin/aws'
alias bat='\bat --theme TwoDark'
alias bri='brew install'
alias c='bat'
alias ca=cargo
alias cb='cargo build'
alias ci='cargo install'
alias mde='f() { mkdir -p "$(dirname -- "$1")" && touch "$1" && "${EDITOR:-vim}" "$1"; }; f'
alias cook='cookiecutter'
alias charm='pycharm'
alias clone='gh repo clone'
alias h='head'
alias d='git diff'
alias dx='devbox'
alias dxa='devbox add'
alias dxs='devbox shell'

alias dfm='git diff origin/$(git_main_branch) --'
alias da='direnv allow'
alias dc='docker compose'
alias de='direnv edit'
alias dk='docker'
alias kc='kubectl config'
alias dkv='docker volume'
alias drun='docker run -it --net=host'
alias drunrm='drun --rm'
alias du='dust'
alias dust='dust -r'
alias df='duf -hide fuse,special'
alias ftrim='rename --nows --lower-case'
alias flm=flameshot
alias e='nvim'
alias emacs=vi
alias ea=earthly
# alias ft='\fzf-tmux -d 15'
# alias fzf='\fzf -m --preview \'\cat --color=always {}\''
alias fgco='fzf-git-checkout'
alias g='git'
alias eg='EDITOR=code g'
alias ce='code -n'
alias cm='chezmoi'
alias cms='chezmoi status'
alias cma='chezmoi re-add'
# alias ce='code --in-process-gpu -n'
alias gp='git push --follow-tags'
alias gpfnv='git push --force-with-lease --no-verify'
alias gpnv='git push --no-verify --follow-tags'
alias gcm='git checkout $(git_main_branch) && git pull'
alias gr='grep'
alias grep='grep --color=auto'
alias grb='git rebase --update-refs'
alias grbmr='git pull --rebase origin $(git_main_branch)'
alias gsp='git stash push'
alias glowp='glow -p'
alias ghci='ghci-8.10.7'
alias gv='gh repo view --web'
alias gup='git pull --stat --rebase'
alias dfs='git diff --stat'
alias dfsm='git diff --stat $(git_main_branch)'
alias isodate='date --utc +%FT%TZ'
alias isodate_fs="isodate | sed 's/\://g'"
alias j="just --timestamp"
alias jl='just --list'
alias jch='just --choose'
alias pydev='python -X dev'
alias ip='(type ipython >/dev/null || pip install ipython readline) && ipython'
alias i=inv
alias k='kubectl'
alias kb='kubie'
alias kd='kubectl describe'
alias kg='kubectl get'
alias kgl='kubectl get --show-labels'
alias ke='kubectl exec'
alias lg='lazygit'
alias l='eza'
alias la='l -a'
alias lc=litecli
alias lint='pylint -f colorized --disable=missing-docstring'
alias ll='eza -l'
alias lla='ll -a'
alias ls='\exa --git --group-directories-first'
alias lt='ls  -l --sort=oldest'
alias ltr='ls  -l --sort=newest'
alias lzd='lazydocker'
alias make='remake'
alias m=make
alias mn='make --dry-run'
alias mutt=neomutt
alias nf=neofetch
alias nb='git switch -c'
alias pg='pgcli'
alias pin='poetry install'
alias pdev='poetry add -D'
alias ping='prettyping'
alias pon='poetry new --src'
alias pol='poetry new'
alias po='poetry'
alias prm='poetry remove'
alias lpsql='psql -U postgres -h localhost'
alias lcreatedb='createdb -U postgres -h localhost'
alias ldropdb='dropdb -U postgres -h localhost'
alias relock='git checkout --ours poetry.lock && git add poetry.lock'
alias py='python'
alias r='\nvim -R'
alias recent='lt --color=always| head -10'
alias rg='\rg --smart-case --hidden' # ripgrep
alias ggn='git grep -n'
alias rgn='rg -N'
alias rmpyc='fd -I __pycache__ | xargs  rm -r'
alias rot13="tr 'A-Za-z' 'N-ZA-Mn-za-m'"
alias crun='cargo run'
alias st='stack'
alias sl=sqlite3
alias suspend='systemctl suspend -i'
alias tp='tmuxp'
alias tpa'tmuxp load -a'
alias tx='tmux'
alias tf=terraform
alias todo='nvim -n ~/Documents/personal.todo.md'
alias tree='ls --tree --git-ignore'
alias venv='(test -d .venv || uv venv) && . .venv/bin/activate'
alias vlog='bat -pp -l log'
alias vialias="nvim ~/.oh-my-zsh/custom/aliases.zsh ; source ~/.oh-my-zsh/custom/aliases.zsh"
alias vifun='e ~/.oh-my-zsh/custom/functions.zsh; source ~/.oh-my-zsh/custom/functions.zsh'
alias vim="\nvim"
alias vimrc='nvim ~/.config/nvim/init.vim'
alias vtime='/usr/bin/time -v'
alias vv='vim "$(fzf)"'
alias wakeup='xrandr --output HDMI-2 --mode 3840x2160 --right-of eDP-1'
alias wtodo='nvim -n ~/Documents/work.todo.md'
alias xz='\xz -T0'
alias tags='git for-each-ref --format="%(objectname:short=5) | %(refname:short) | %(creatordate:format:%Y-%m-%d %H:%M)" "refs/tags/*"| sort -r'
alias t='task'
alias zshenv='nvim ~/.zshenv'
alias zshrc='nvim ~/.zshrc'
alias snowsql=/Applications/SnowSQL.app/Contents/MacOS/snowsql
alias yirc='e ~/.config/yabai/yabairc'
alias ur='uv run'

ignore-local() {
  dotgit="$(git rev-parse --show-toplevel)/.git"
  mkdir -p ${dotgit}/info/
  echo $* >>${dotgit}/info/exclude
}

dl_music() {
  pushd ~/Music
  youtube-dl --embed-thumbnail -w --audio-quality 4 -x --audio-format best "$1"
  popd
}

mcd() {
  mkdir -p $1 && cd $1
}


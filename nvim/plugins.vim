call plug#begin()
Plug 'aklt/plantuml-syntax'
" Plug 'alvan/vim-closetag'
Plug 'aserebryakov/vim-todo-lists'
Plug 'cespare/vim-toml'
Plug 'chrisbra/Colorizer' " colorize all hex codes
Plug 'chrisbra/NrrwRgn'   " narrow region for vim
" Plug 'dbakker/vim-lint'
Plug 'dense-analysis/ale'  " must be configured to be convenient
Plug 'dracula/vim', {'as': 'dracula'}  " nice theme
Plug 'dzeban/vim-log-syntax'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json'
Plug 'enomsg/vim-haskellConcealPlus'
Plug 'fidian/hexmode'
Plug 'godlygeek/tabular'
" Plug 'habamax/vim-asciidoctor'
" Plug 'heavenshell/vim-pydocstring'
Plug 'honza/vim-snippets'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'inkarkat/vim-SyntaxRange'
" Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-journal'
Plug 'liuchengxu/vim-which-key'
" Plug 'ludovicchabant/vim-gutentags'  " causes ctags failures
" Plug 'craigemery/vim-autotag'  " neovim issue, :w fails every time
Plug 'machakann/vim-swap'
" Plug 'mattn/emmet-vim'
" Plug 'mboughaba/i3config.vim'
Plug 'mechatroner/rainbow_csv'
Plug 'mhinz/vim-signify'  " show diff in gutter
Plug 'mhinz/vim-startify'
Plug 'mtth/scratch.vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'ntpeters/vim-better-whitespace'
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'PeterRincker/vim-argumentative'  " <, and >, shift arguments, [, ], move over them etc
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" Plug 'python-rope/ropevim'
Plug 'racer-rust/vim-racer'
Plug 'scrooloose/nerdtree'
Plug 'sevko/vim-nand2tetris-syntax'
Plug 'sheerun/vim-polyglot'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'SirVer/ultisnips'  " causes sporadic errors
Plug 'sotte/presenting.vim'  " simple vim presentations
Plug 'stephpy/vim-yaml'
Plug 'terryma/vim-expand-region'
Plug 'tmhedberg/simpylfold'
Plug 'tpope/vim-abolish'  " smart-case find/sub (:S)
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-markdown'
Plug 'tpope/vim-projectionist'
" Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" Plug 'uarun/vim-protobuf'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'wincent/ferret'  " multi-file search
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-notes'
" Plug 'yaasita/edit-slack.vim'
" Plug 'Yggdroot/indentLine'  " show indentation line
" Plug 'zchee/deoplete-jedi'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" Plug 'jiangmiao/auto-pairs'
" Plug 'pearofducks/ansible-vim'
" Plug 'apalmer1377/factorus'
Plug 'machakann/vim-highlightedyank'
" Plug 'codota/tabnine-vim'
" newplug marker
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'NoahTheDuke/vim-just'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'ryanoasis/vim-devicons' " must be last!

call plug#end()


call plug#begin()
Plug 'adelarsq/vim-hackernews'
Plug 'rust-lang/rust.vim'
Plug 'mboughaba/i3config.vim'
" Plug 'wincent/ferret'
Plug 'aklt/plantuml-syntax'
" Plug 'alvan/vim-closetag'
Plug 'uarun/vim-protobuf'
Plug 'chrisbra/Colorizer' " colorize all hex codes
Plug 'dag/vim2hs'
Plug 'dbakker/vim-lint'
Plug 'dracula/vim', {'as': 'dracula'}  " nice theme
Plug 'tpope/vim-eunuch'
Plug 'jremmen/vim-ripgrep'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'enomsg/vim-haskellConcealPlus'
Plug 'fidian/hexmode'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'heavenshell/vim-pydocstring'
Plug 'honza/vim-snippets'
" Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/rainbow_parentheses.vim'
" Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-journal'
" Plug 'majutsushi/tagbar' " show outline of code, requires a ctag plugin
" Plug 'MattesGroeger/vim-bookmarks'  " just use vanilla bookmarks
Plug 'mechatroner/rainbow_csv'
Plug 'metakirby5/codi.vim'  " REPL/scratchpad
Plug 'mhinz/vim-signify'  " show diff in gutter
Plug 'mhinz/vim-startify'
Plug 'mtth/scratch.vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'PeterRincker/vim-argumentative'  " <, and >, shift arguments, [, ], move over them etc
" Plug 'rafi/awesome-vim-colorschemes'
Plug 'scrooloose/nerdtree'
" Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'SirVer/ultisnips'  " causes sporadic errors
Plug 'honza/vim-snippets'
Plug 'tell-k/vim-autopep8'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-abolish'  " smart-case find/sub (:S)
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yaasita/edit-slack.vim'
Plug 'Yggdroot/indentLine'  " show indentation line
Plug 'zchee/deoplete-jedi'
Plug 'tmhedberg/simpylfold'
Plug 'dzeban/vim-log-syntax'
Plug 'liuchengxu/vim-which-key'
Plug 'elzr/vim-json'
Plug 'cespare/vim-toml'
Plug 'chrisbra/NrrwRgn'
Plug 'stephpy/vim-yaml'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'habamax/vim-asciidoctor'
" Plug 'python-rope/ropevim'
" Plug 'ludovicchabant/vim-gutentags'  " causes ctags failures
Plug 'machakann/vim-swap'
Plug 'dense-analysis/ale'  " must be configured to be convenient

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release --locked
    else
      !cargo build --release --locked --no-default-features --features json-rpc
    endif
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
" newplug marker
Plug 'ryanoasis/vim-devicons' " must be last!

call plug#end()

" TODO: configure autoflake8 as Python formatter in addition to black

set hidden
let mapleader=","
nnoremap \ <leader>q

" Automatically reload when file changes
au FocusGained * :checktime

" Proper quote handling in this file
autocmd FileType * setlocal formatoptions-=cro

""" nvim VirtualEnv
let g:python3_host_prog = expand('~/.pyenv/shims/python3')

""" Coloring
syntax on

set so=5 " scroll context lines
set relativenumber
set t_Co=256
color dracula
set colorcolumn=80
set termguicolors

set cursorline
" highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE guifg=DarkGrey guibg=NONE
" highlight CursorLine   cterm=NONE ctermbg=236 ctermfg=white
" highlight CursorLineNR ctermbg=DarkBlue ctermfg=yellow
set guicursor=a:blinkon50
highlight Pmenu guibg=gray guifg=black gui=bold
highlight Comment gui=bold
highlight Normal gui=none
highlight NonText guibg=none

" clear search highlights
nnoremap <leader>cl :nohl<CR>

filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set ruler laststatus=2 showcmd showmode
set listchars=tab:▸\ ,eol:¬  " for set list
" set fillchars+=vert:\ 
set wrap breakindent
set number
set title

set foldmethod=indent
let g:SimpylFold_docstring_preview = 1
set foldlevelstart=1

set timeoutlen=200 ttimeoutlen=0
imap jj <Esc>

""" Plugin Configurations

""" Nerdtree
set guifont=DroidSansMono\ Nerd\ Font\ 11

""" Limelight
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermbg = '#404040'
let g:limelight_conceal_ctermfg = '#a0a0a0'

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guibg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.6

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
" let g:limelight_bop = '^\s'
" let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

nnoremap <silent> <Leader>ll :Limelight<CR>
nnoremap <silent> <Leader>nl :Limelight!<CR>

""" Bookmarks

" highlight BookmarkSign ctermbg=NONE ctermfg=160
" highlight BookmarkLine ctermbg=194 ctermfg=NONE
" let g:bookmark_sign = '♥'
" let g:bookmark_highlight_lines = 1


" NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '↠'
let g:NERDTreeDirArrowCollapsible = '↡'

" Airline
let g:airlinetheme = 'onedark'
let g:airline_powerline_fonts = 1
" let g:airline_section_z = ' %{strftime("%H:%M")}'
" let g:airline_section_warning = ''
"let g:airline#extensions#tabline#enabled = 1

" Neovim :Terminal
tmap <Esc> <C-\><C-n>
tmap <C-w> <Esc><C-w>
tmap <C-d> <Esc>:q<CR>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" Deoplete
let g:deoplete#enable_at_startup = 1
" Disable documentation window
" set completeopt-=preview

" Supertab
" let g:SuperTabDefaultCompletionType = "<C-n>"

" Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "~/dotfiles/nvim/UltiSnips"]

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" Fugitive
set diffopt=vertical
nnoremap <leader>gd :Gdiffsplit!<CR>
autocmd FilterWritePre * if &diff | setlocal wrap< | endif
nnoremap dg2 :diffget //2<CR>
nnoremap dg3 :diffget //3<CR>

" EasyAlign
" xmap ga <Plug>(EasyAlign)
" nnoremap ga <Plug>(EasyAlign)"

" Python (for Python 3+ only)
let g:pymode_python = 'python3'
let g:pymode_virtualenv = 1
let g:pymode_options_max_line_length = 88
autocmd FileType python set colorcolumn=88
autocmd FileType python noremap <buffer> <leader>y :call Autopep8()<CR>
autocmd FileType python iabbrev <buffer> dbg import pdb; pdb.set_trace()
autocmd FileType python iabbrev <buffer> icr from icecream import ic
autocmd FileType python iabbrev <buffer> pld # pylint: disable=

nnoremap <leader>iso :!isort %<CR><CR>
nnoremap <leader>bla :!black %<CR><CR>
nnoremap <leader>afl :!autoflake8 %<CR><CR>

" ALE
let g:ale_python_flake8_executable = 'python3'
let g:ale_fixers = {'python': ['isort', 'add_blank_lines_for_python_control_statements', 'autopep8' ]}
let g:ale_python_mypy_options = "--python-version 3.7"
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Easymotion
" nnoremap s <Plug>(easymotion-s2)
nnoremap <leader>s <Plug>(easymotion-t2)
nnoremap <leader>ss <Plug>(easymotion-overwin-f2)


" indentLine
let g:indentLine_char = '▏'
let g:indentLine_color_gui = '#363949'

" TagBar
let g:tagbar_width = 30
" let g:tagbar_iconchars = ['↠', '↡']

" Semshi
let g:semshi#simplify_markup = v:false

" fzf-vim
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'Type'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Character'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

""" Filetype-Specific Configurations

" Per-filetype customizations
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2

autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2

""" Custom Functions

" Trim Whitespaces
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction

""" Custom Mappings

" nnoremap <leader>q :NERDTreeToggle<CR>
" nnoremap <leader>w :TagbarToggle<CR>
" nnoremap <leader>ea :AirlineTheme
nnoremap <leader>vi :vsp ~/.config/nvim/init.vim<CR>
nnoremap <leader>t :call TrimWhitespace()<CR>
" nnoremap <leader>a gaip*
" nnoremap <leader>s <C-w>s<C-w>j:terminal<CR>
" nnoremap <leader>vs <C-w>v<C-w>l:terminal<CR>
" nnoremap <leader>d <Plug>(pydocstring)
nnoremap <leader>f :FZF<CR>
nnoremap <leader>go :Goyo<CR>
" nnoremap <leader>h :RainbowParentheses!!<CR>
nnoremap <leader>j :set filetype=journal<CR>
" nnoremap <leader>k :ColorToggle<CR>
nnoremap <leader>hn :HackerNews best<CR>J
" nnoremap <Tab> :bnext<CR>
" nnoremap <S-Tab> :bprevious<CR>

" whichkey
nnoremap <silent> <leader>      :<c-u>WhichKey ','<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey ','<CR>

au VimLeave * set guicursor=a:hor100-blinkon1
au FileType .vim setlocal fo-=c fo-=r fo-=o

" For commentary if needed:
" autocmd FileType apache setlocal commentstring=#\ %s

" Automatic dimming
hi def Dim cterm=none ctermbg=none ctermfg=242

function! s:DimInactiveWindow()
    syntax region Dim start='' end='$$$end$$$'
endfunction

function! s:UndimActiveWindow()
    ownsyntax
endfunction

autocmd WinEnter * call s:UndimActiveWindow()
autocmd BufEnter * call s:UndimActiveWindow()
autocmd WinLeave * call s:DimInactiveWindow()

" Pass a dictionary to set multiple options
"call deoplete#custom#option({
"\ 'auto_complete_delay': 1500,
"\ 'smart_case': v:true,
"\ })

" let g:autopep8_disable_show_diff=1
" let g:autopep8_max_line_length=120

" No cheating, ie. using arrows to move :)
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

""" FZF
let $FZF_DEFAULT_COMMAND='fd --type f'
let g:fzf_buffers_jump = 1
nnoremap <silent> <Leader>b :Buffers<CR>

""" Some macros

" Python
let @d="dt\"f]ct\": A,j0"  " assignment to dict entry, assumes double quotes


""" End macros



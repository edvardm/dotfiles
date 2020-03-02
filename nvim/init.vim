source ~/dotfiles/nvim/plugins.vim

syntax on
filetype plugin indent on
color dracula

let mapleader=","
nnoremap \ <leader>q

" switch 0 and ^
nnoremap ^ 0
nnoremap 0 ^

" Automatically reload when file changes
set autoread
au FocusGained,BufEnter * :checktime

set undolevels=512
set hidden
set so=5 " scroll context lines
set relativenumber
set t_Co=256
set colorcolumn=80
set termguicolors

set cursorline
" highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE guifg=DarkGrey guibg=NONE
" highlight CursorLine   cterm=NONE ctermbg=236 ctermfg=white
" highlight CursorLineNR ctermbg=DarkBlue ctermfg=yellow
set guicursor=a:blinkon50
highlight Pmenu guibg=DarkGray guifg=black gui=bold
highlight PmenuSel guibg=blue guifg=Yellow gui=bold
highlight Comment gui=bold
highlight Normal gui=none
highlight NonText guibg=none

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab
set autoindent
set hlsearch
set incsearch
set ignorecase
set smartcase
set ruler
set laststatus=2
set showcmd
set showmode
set listchars=tab:▸\ ,eol:¬  " for set list
" set fillchars+=vert:\ 
set wrap
set number
set title
set tags=.tags,TAGS,tags

set foldmethod=indent
let g:SimpylFold_docstring_preview = 1
set foldlevelstart=1

set timeoutlen=200 ttimeoutlen=0
set inccommand=split
imap jj <Esc>

nnoremap <leader>cl :nohl<CR>

"""r search results nvim VirtualEnv
let g:python3_host_prog = expand('~/.pyenv/shims/python3')

" Presenting
" au FileType md let b:presenting_slide_separator = '\v(^|\n)\-{4,}'

"Emmet
" let g:user_emmet_leader_key=';'
" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall

" Markdown
let g:markdown_syntax_conceal = 0
let g:markdown_minlines = 500

" Nerdtree
set guifont=DroidSansMono\ Nerd\ Font\ 11

" Limelight
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

" jedi/deoplete
let g:jedi#completions_enabled = 1

" Fugitive
set diffopt=vertical
nnoremap <leader>gd :Gdiffsplit!<CR>
autocmd FilterWritePre * if &diff | setlocal wrap< | endif
nnoremap dg2 :diffget //2<CR>
nnoremap dg3 :diffget //3<CR>

" Autopairs
au Filetype vim let b:AutoPairs = {"(": ")"}

" EasyAlign
" xmap ga <Plug>(EasyAlign)
" nnoremap ga <Plug>(EasyAlign)"
" Python (for Python 3+ only)
let g:pymode_python = 'python3'
let g:pymode_virtualenv = 1
let g:pymode_options_max_line_length = 88
autocmd FileType python set colorcolumn=88
" autocmd FileType python noremap <buffer> <leader>y :call Autopep8()<CR>
autocmd FileType python iabbrev <buffer> dbg import pdb; pdb.set_trace()
autocmd FileType python iabbrev <buffer> icr from icecream import ic
func Eatchar(pat)
   let c = nr2char(getchar(0))
   return (c =~ a:pat) ? '' : c
endfunc
autocmd FileType python iabbrev <buffer> pld # pylint: disable=

nnoremap <leader>iso :!isort %<CR><CR>
nnoremap <leader>bla :!black %<CR><CR>
nnoremap <leader>afl :!autoflake --remove-all-unused-imports %<CR><CR>

" ALE
let g:ale_python_flake8_executable = 'python3'
let g:ale_fixers = {'python': ['isort', 'add_blank_lines_for_python_control_statements', 'autopep8' ]}

let g:ale_rust_cargo_include_features = 'clippy'
let g:ale_python_mypy_options = "--python-version 3.7 --ignore-missing-imports"
let g:ale_python_pylint_options = "--rcfile .pylintrc"
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Rust.vim
" let g:autofmt_autosave = 1

" LSP

" Required for operations modifying multiple buffers like rename.
set hidden
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Easymotion
" nnoremap s <Plug>(easymotion-s2)
" nnoremap <leader>s <Plug>(easymotion-t2)
" nnoremap <leader>ss <Plug>(easymotion-overwin-f2)


" indentLine
let g:indentLine_char = '▏'
let g:indentLine_color_gui = '#363949'

" TagBar
let g:tagbar_width = 30
" let g:tagbar_iconchars = ['↠', '↡']

" vim-notes
let g:notes_directories = ['~/Documents/Notes']

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
nnoremap <leader>vp :vsp ~/.config/nvim/plugins.vim<CR>
nnoremap <leader>t :call TrimWhitespace()<CR>
" nnoremap <leader>a gaip*
" nnoremap <leader>s <C-w>s<C-w>j:terminal<CR>
" nnoremap <leader>vs <C-w>v<C-w>l:terminal<CR>
" nnoremap <leader>d <Plug>(pydocstring)
nnoremap <leader>f :FZF<CR>
nnoremap <leader>go :Goyo<CR>
nnoremap <leader>h :RainbowParentheses!!<CR>
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

""" Macros


""" End macros


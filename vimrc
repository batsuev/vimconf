" Pathogen
call pathogen#runtime_append_all_bundles()

" Syntax
filetype plugin indent on
syntax enable
set background=dark
if !has('gui_running')
  set t_Co=256
endif
colorscheme solarized

" Command line
set showcmd
set cmdheight=2
set ruler

" Row number
set number

" Text width: 80 symbols
set textwidth=160
set nowrap
set colorcolumn=+1

" Tabulations
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab
set shiftround
set autoindent smartindent

" Tabs && buffers
set showtabline=2
nmap <Right> :bn<CR>
nmap <Left> :bp<CR>
set hidden

" Invisible chars
set list
set listchars=tab:»\ ,trail:·,nbsp:%,extends:>,precedes:<

" Scroll
set scrolloff=0
set sidescroll=5
set sidescrolloff=5

" Visual mode
set clipboard+=unnamed

" Edit mode
set mousehide

" Saving
set autoread
set autowrite
autocmd FocusLost * :wa
set updatetime=3000
set updatecount=50
set directory=~/.vim/tmp
set backup
set backupdir=~/.vim/backup

" Backspace fix
set backspace=indent,eol,start

" Search
set incsearch
set hlsearch
set ignorecase smartcase

" Allow custom configs
set exrc

" Secure!
set secure

" Go back to the position the cursor was on the last time this file was edited
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute("normal! g'\"") | endif

" NerdTree
nmap <silent> <F3> :NERDTreeToggle<CR>

" Reload page
function! s:ReloadSafari()
    let l:openApp = " -e 'tell application \"Safari\"'"
\                 . " -e '    activate'"
\                 . " -e '    set rURL to URL of current tab of front window'"
\                 . " -e '    set URL of current tab of front window to rURL'"
\                 . " -e 'end tell'"
\                 . " -e 'tell application \"iTerm\"'"
\                 . " -e '    activate'"
\                 . " -e 'end tell'"
    exec "silent !osascript ".l:openApp
    exec "redraw!"
endfunction

command! ReloadSafari call s:ReloadSafari()
nmap <silent> <F5> :ReloadSafari<CR>

" Paste toggle for F2
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

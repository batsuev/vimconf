set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Bundles:
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-ruby/vim-ruby'
Bundle 'markcornick/vim-vagrant'
Bundle 'slim-template/vim-slim'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'bufexplorer.zip'
Bundle 'endel/actionscript.vim'

" /Bundles
filetype plugin indent on

" Color scheme
syntax enable
set background=dark
colorscheme solarized

" Command line
set showcmd
set cmdheight=1
set ruler

" Row number
set number

" Text width: 80 symbols
set textwidth=160
set nowrap
set colorcolumn=+1

" Tabulations
set smarttab
set tabstop=2
set shiftwidth=2
set expandtab
set shiftround
set autoindent smartindent

" Tabs && buffers
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

" NerdTree
nmap <silent> <F3> :NERDTreeToggle<CR>

" Paste toggle for F2
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Mouse
set mouse=a

" Status line
set laststatus=2
set statusline=%{fugitive#statusline()}
set statusline+=%t       "tail of the filename
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" Fuzze finder
nnoremap <silent> <F4>     :FufFile<CR>
nnoremap <silent> <C-e> :FufFile<CR>

" bufexplorer
nnoremap <silent> <F5> :BufExplorerVerticalSplit<CR>
nnoremap <silent> <C-b> :BufExplorerVerticalSplit<CR>

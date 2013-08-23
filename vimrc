set nocompatible
filetype off

set guioptions-=L
set guioptions-=r

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
Bundle 'vim-scripts/asm8051.vim'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'klen/python-mode'
Bundle 'rkulla/pydiction'

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


" Find file in current directory and edit it.
function! Find(name)
  let l:list=system("find . -name '".a:name."' | perl -ne 'print \"$.\\t$_\"'")
" replace above line with below one for gvim on windows
" let l:list=system("find . -name ".a:name." | perl -ne \"print qq{$.\\t$_}\"")
  let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
  if l:num < 1
    echo "'".a:name."' not found"
    return
  endif
  if l:num != 1
    echo l:list
    let l:input=input("Which ? (CR=nothing)\n")
    if strlen(l:input)==0
      return
    endif
    if strlen(substitute(l:input, "[0-9]", "", "g"))>0
      echo "Not a number"
      return
    endif
    if l:input<1 || l:input>l:num
      echo "Out of range"
      return
    endif
    let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
  else
    let l:line=l:list
  endif
  let l:line=substitute(l:line, "^[^\t]*\t./", "", "")
  execute ":e ".l:line
endfunction
command! -nargs=1 Find :call Find("<args>")

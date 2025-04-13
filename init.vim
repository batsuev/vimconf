call plug#begin()
  " CodeCompanion
  Plug 'olimorris/codecompanion.nvim'

  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

  Plug 'MeanderingProgrammer/render-markdown.nvim'

  Plug 'neovim/nvim-lspconfig'
  Plug 'ray-x/go.nvim'
  Plug 'ray-x/guihua.lua'

  Plug 'dracula/vim'
  Plug 'tpope/vim-fugitive'

  Plug 'ziglang/zig.vim'
call plug#end()

filetype plugin indent on
syntax enable
colorscheme dracula

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
set clipboard+=unnamedplus

" Edit mode
set mousehide

" Backspace fix
set backspace=indent,eol,start

" Search
set incsearch
set hlsearch
set ignorecase smartcase

set mouse=a
set laststatus=2
set statusline=%{FugitiveStatusline()}
set statusline+=\ [%f] "file format with parentheses
set statusline+=\ [%{&ff}] "file format with pipes
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" Find files using Telescope command-line sugar.
nnoremap <esc>ff <cmd>Telescope find_files<cr>
nnoremap <esc>fg <cmd>Telescope live_grep<cr>
nnoremap <esc>fb <cmd>Telescope buffers<cr>
nnoremap <esc>fh <cmd>Telescope help_tags<cr>

lua require('config')

" Auto-start CodeCompanionChat when Neovim starts
augroup CodeCompanionAutoStart
  autocmd!
  autocmd VimEnter * call timer_start(100, {-> execute('CodeCompanionChat')})
augroup END


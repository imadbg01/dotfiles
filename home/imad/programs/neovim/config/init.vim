set number
set relativenumber
syntax on
set hlsearch
set incsearch
set ignorecase
set spelllang=en_us
set spell
set smartcase
set autowrite
set autoindent
set confirm
set history=82
set nobackup
set noswapfile
set nowritebackup
set nomodeline
set noshelltemp
set noundofile
set viminfo=
set showcmd
set wildmenu
set wildmode=longest,list,full
filetype plugin indent on
set hidden
set cursorline
set colorcolumn=90
set fileformat=unix
set listchars=nbsp:%,tab:▸\ ,trail:_,eol:¬,precedes:←,extends:→
set infercase
set nojoinspaces
set showmatch
set matchtime=7
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab


"" Keymap

let mapleader = " "

nnoremap <leader>q :Ex<CR><Esc>
nnoremap <Esc> :nohlsearch<Esc>


let g: loaded_prel_provider=0

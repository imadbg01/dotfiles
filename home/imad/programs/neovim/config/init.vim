set termguicolors
set number
set relativenumber
syntax on
set hlsearch
set incsearch
set ignorecase
set spelllang=en_us
set spell
set smartcase
set autoindent
set confirm
set history=82
set scrolloff=10
set nobackup
set noswapfile
set nowritebackup
set nomodeline
set noshelltemp
set noundofile
set viminfo=
set wildmode=longest,list,full
filetype plugin indent on
set cursorline
set colorcolumn=90
set fileformat=unix
set listchars=nbsp:%,tab:▸\ ,trail:_,eol:¬,precedes:←,extends:→
set infercase
set nojoinspaces
set showmatch
set matchtime=7
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set completeopt=menu,menuone,noselect

"" Keymap

let mapleader = " "

nnoremap <Esc> :nohlsearch<Esc>
nnoremap <leader>q :NvimTreeToggle<CR>


let g: loaded_prel_provider=0
let g: loaded_netrw=1
let g: loaded_nertrwPlugin=1

set number
set relativenumber
set ttyfast
set autoindent
set hlsearch
set incsearch
set background=dark
set noswapfile
set t_Co=256
set scrolloff=5
set cursorline

syntax on

" Re-maps
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap <silent> <C-p> :GFiles --cached --exclude-standard --others<CR>

function MyNerdToggle()
    if @% == "" || &filetype == 'nerdtree'
        NERDTreeToggle
    else
        NERDTreeFind
    endif
endfunction

nnoremap <C-n> :call MyNerdToggle()<CR>

" fix colours
if has('termguicolors')
  set termguicolors
endif

" Fix italics in Vim
if !has('nvim')
  let &t_ZH="\e[3m"
  let &t_ZR="\e[23m"
endif

call plug#begin('~/.vim/plugged')

"" Editor utils
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'

" Git integration
Plug 'tpope/vim-fugitive'

" Auto detect indents
Plug 'tpope/vim-sleuth'

" Theme stuff
Plug 'sheerun/vim-polyglot'
Plug 'yunlingz/equinusocio-material.vim'

call plug#end()

" Theme
let g:equinusocio_material_style = 'darker'
colorscheme equinusocio_material
hi Visual gui=reverse cterm=reverse term=reverse
"hi Normal guibg=NONE ctermbg=NONE

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0

" File explorer
let NERDTreeShowHidden = 1

" Commands
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 ESLint :CocCommand eslint.executeAutofix

let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint', 'coc-json', 'coc-emmet', 'coc-yaml', 'coc-docker', 'coc-prettier', 'coc-pyright']

" recommended settings for coc
" https://github.com/neoclide/coc.nvim#example-vim-configuration
source ~/.coc.vim

" Undoing some stuff in coc.vim
set signcolumn=yes


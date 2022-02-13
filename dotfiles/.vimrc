""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

" Line numbers
set number
set relativenumber

" Use a fast tty connection
set ttyfast

set autoindent

" Highlight + incremental search
set hlsearch
set incsearch

" Cursor
set cursorline
set scrolloff=20

" Tabs and backspace settings
set backspace=2
set softtabstop=2
set shiftwidth=2
set expandtab

set termguicolors
set background=dark

" Dont create swap files for changed files
set noswapfile

" Dont wrap lines
set nowrap

" Use hjkl to move between vim panes
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins and Plugin Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Language server plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git diffs in sign column
Plug 'airblade/vim-gitgutter'

" File explorer
Plug 'preservim/nerdtree'

" Fuzzy finder + search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Status line plugin
Plug 'vim-airline/vim-airline'

" Git integration
Plug 'tpope/vim-fugitive'

" Automatically adjust tabsize based on file
Plug 'tpope/vim-sleuth'

" Collection of language packs
Plug 'sheerun/vim-polyglot'

" Colour theme
Plug 'yunlingz/equinusocio-material.vim'

" Commenting plugin
Plug 'tpope/vim-commentary'

call plug#end()

" Git
nnoremap <leader>g :Git

" Fuzzy finder
nnoremap <silent> <C-p> :GFiles --cached --exclude-standard --others<CR>

" Search
nnoremap <leader>s :Ag

" Overwrite Ag command to exclude matching filenames
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%'), <bang>0)

" Theme
let g:equinusocio_material_style = 'darker'
colorscheme equinusocio_material

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0

" File tree
let NERDTreeShowHidden = 1
let NERDTreeWinSize = 50

" File tree toggle
function MyNerdToggle()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        NERDTreeClose
    elseif @% == "" || &filetype == 'nerdtree'
        NERDTreeToggle
    else
        NERDTreeFind
    endif
endfunction
nnoremap <C-n> :call MyNerdToggle()<CR>

" Linting command
command! -nargs=0 ESLint :CocCommand eslint.executeAutofix

" COC language extensions
let g:coc_global_extensions = [
      \'coc-tsserver',
      \'coc-eslint',
      \'coc-json',
      \'coc-emmet',
      \'coc-yaml',
      \'coc-docker',
      \'coc-prettier',
      \'coc-go']

" Recommended settings for coc
" https://github.com/neoclide/coc.nvim#example-vim-configuration
source ~/.coc.vim

" Note: Stuff below this line has to be after .coc.vim

" Show sign column for git gutter symbols
set signcolumn=yes

" Format entire file with configured COC formatter
nnoremap <leader>f :Format

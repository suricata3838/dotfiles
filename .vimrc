" backup
set fenc=UTF-8
set nobackup
set noswapfile
set autoread
set hidden

" setting
set number
set incsearch
set hlsearch

" tab
set list listchars=tab:\▸\-
set expandtab
set tabstop=2
set shiftwidth=2

" pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on
" Yet-Another-JS plugin
" es6 hilight
autocmd BufRead,BufNewFile *.es6 setfiletype javascript

" vim-latex-live-preview settings
autocmd filetype tex setl updatetime=1
let g:livereview_previewer = 'open -a Preview' 

" open a NERDTree automatically
nmap <C-n> :NERDTreeToggle<CR>

" oceanicNext: enable JSX highlighting
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 2

syntax enable
if (has("termguicolors"))
  set termguicolors
endif
colorscheme OceanicNext

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" vim-airline-themes
let g:airline_theme = 'wombat'

" Powerline
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

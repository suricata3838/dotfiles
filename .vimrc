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

" <C-r> was used
nmap <S-r> :redo

" after you-complete-me installed backspace didn't work.
" backspace=inednt,eol,start
set backspace=2

" vim <=> clipboard
set clipboard+=autoselect,unnamed

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
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>


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
let g:ale_set_highlights = 0

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

" fzf
set rtp+=~/.fzf
nmap <C-f> :FZF<cr>

" Ag seaarch
" nmap <C-a> :Ag<cr>
" Rg seearcg
nmap <C-r> :Rg<cr>

let g:fzf_action = {
\ 'ctrl-o': 'tab split'
\ }

command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\ 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
\ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:30%')
\ : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
\ <bang>0)

" for Eslint6 with syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
"need automatically open and/or close the |location-list|(2)
let g:syntastic_auto_loc_list = 2 
let g:syntastic_enable_signs = 1
let g:syntastic_loc_list_height = 0 
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
highlight link SyntasticErrorSign DiffDelete
highlight link SyntasticWarning ALEErrorSign 
highlight link SyntasticError NeomakeWarning 

"NerdCommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'

" JsDoc with Lehre
let g:jsdoc_lehre_path = '/Users/norikakizawa/.nvm/versions/node/v13.5.0/bin/lehre'
let g:jsdoc_templates_path = '/Users/norikakizawa/.vim/bundle/vim-jsdoc/examples/snippet_template.js'
nmap <silent> <C-j> <Plug>(jsdoc)

" Tern Javascript Engine
" let g:tern_show_argument_hints='on_hold'
" and 
" let g:tern_map_keys=1
" set updatetime=4
" let maplocalleader = "\\"

let g:LanguageClient_serverCommands = {
  \ 'cpp': ['clangd'],
  \ }

" YouCompleteMe
let g:ycm_clangd_binary_path = "/Users/norikakizawa/clangd_11.0.0"
" trigger Hover popup with q meaning quick
nmap <leader>p <plug>(YCMHover)
" popup hlihgting
augroup MyYCMCostum
  autocmd!
  autocmd Filetype * let b:ycm_hover = {
  \ 'command': 'GetDoc',
  \ 'syntax': &filetype, 
  \ }
augroup END
" jump definition and go back with <CTRL-O>
nnoremap <leader>j :YcmCompleter GoTo<CR>

" Ctags customized for Rust
let g:rust_use_custom_ctags_defs = 1
let g:tagbar_type_rust = {
  \ 'ctagsbin' : '/usr/local/bin/ctags',
  \ 'ctagstype' : 'rust',
  \ 'kinds' : [
      \ 'n:modules',
      \ 's:structures:1',
      \ 'i:interfaces',
      \ 'c:implementations',
      \ 'f:functions:1',
      \ 'g:enumerations:1',
      \ 't:type aliases:1:0',
      \ 'v:constants:1:0',
      \ 'M:macros:1',
      \ 'm:fields:1:0',
      \ 'e:enum variants:1:0',
      \ 'P:methods:1',
  \ ],
  \ 'sro': '::',
  \ 'kind2scope' : {
      \ 'n': 'module',
      \ 's': 'struct',
      \ 'i': 'interface',
      \ 'c': 'implementation',
      \ 'f': 'function',
      \ 'g': 'enum',
      \ 't': 'typedef',
      \ 'v': 'variable',
      \ 'M': 'macro',
      \ 'm': 'field',
      \ 'e': 'enumerator',
      \ 'P': 'method',
  \ },
\ }

" Tagbar baed on Ctags
let g:tagbar_ctags_bin = "/usr/local/bin/ctags"
nmap <C-b> :TagbarToggle<CR>

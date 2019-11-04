set shell=bash

let mapleader = ";"

let maplocalleader = "-"

call plug#begin('~/.vim/plugged')

" tree plugin and git flags support -----------------------------------{{{
Plug 'scrooloose/nerdtree'

Plug 'Xuyuanp/nerdtree-git-plugin'

" mapping to show time
nmap <unique> <leader>t :NERDTree<CR>
" }}}

Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-commentary'
Plug 'chriskempson/base16-vim'
Plug 'sbdchd/neoformat'

" fuzzy matching on file selection ------------------------------------{{{
Plug 'srstevenson/vim-picker'

" set vim-picker mappings
nmap <unique> <leader>pe <Plug>PickerEdit
nmap <unique> <leader>pen :tabe<CR><Plug>PickerEdit
nmap <unique> <leader>ps <Plug>PickerSplit
nmap <unique> <leader>pt <Plug>PickerTabedit
nmap <unique> <leader>pv <Plug>PickerVsplit
nmap <unique> <leader>pb <Plug>PickerBuffer
nmap <unique> <leader>p] <Plug>PickerTag
nmap <unique> <leader>pw <Plug>PickerStag
nmap <unique> <leader>po <Plug>PickerBufferTag
nmap <unique> <leader>ph <Plug>PickerHelp

" }}}

" Vim HardTime --------------------------------------------------------{{{
Plug 'takac/vim-hardtime'

let g:hardtime_default_on = 0

" TODO: Add BACKSPACE
let g:list_of_normal_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_disabled_keys = []
" }}}

" Highlight indentation ------------------------------------------------{{{
Plug 'nathanaelkane/vim-indent-guides'

let g:indent_guides_auto_colors = 0
augroup indent_guides
    autocmd!
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
augroup END
" }}}

call plug#end()

set number
set mouse=nicr

function! CopyPasteToggle()
 if(&number == 1)
   set nonumber
   set mouse=""
 else
   set number
   set mouse=nicr
 endif
endfunc

nnoremap <C-e> :call CopyPasteToggle()<cr>

" SPACES not TABS ------------------------------------------------------{{{
" Make :x be aplied even if no change was made. Use ZZ if you really want
" the old :x functionality. This way tabs will be removed
noremap :x :wq

set expandtab
set shiftwidth=4
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
augroup retab_on_save
    autocmd!
    autocmd BufWritePre * retab
augroup END
" }}}

" REACT DEVELOPMENT SETUP ----------------------------------------------{{{
augroup react_setup
    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
    autocmd FileType html       setlocal shiftwidth=2 tabstop=2
    autocmd FileType css        setlocal shiftwidth=2 tabstop=2
augroup END
autocmd FileType python     setlocal shiftwidth=4 softtabstop=0 expandtab smarttab tabstop=8
" }}}

set autoindent
set cindent

set colorcolumn=100
augroup enable_strip_ws_on_save
    autocmd!
    autocmd BufEnter * EnableStripWhitespaceOnSave
augroup END
let g:strip_whitespace_confirm=0

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" " configure neoformat to use the scalafmt server
" let g:neoformat_scala_scalafmt = {
"         \ 'exe': 'ng',
"         \ 'args': ['org.scalafmt.cli.Cli', '--stdin'],
"         \ 'stdin': 1,
"         \ }
" " configure neoformat to autoformat on save
" autocmd BufWritePre *.{scala,sbt} Neoformat

" Use jk to go to normal mode -------------------------------------------{{{
inoremap jk <esc>
" }}}

" Make it easy to edit vimrc from anywhere ----------------------------- {{{
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" }}}

" Vimscript file settings ---------------------------------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

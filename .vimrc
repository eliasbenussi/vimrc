set shell=bash

call plug#begin('~/.vim/plugged')

" tree plugin and git flags support
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-commentary'
Plug 'chriskempson/base16-vim'
Plug 'sbdchd/neoformat'

" fuzzy matching on file selection
Plug 'srstevenson/vim-picker'

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

set expandtab
set shiftwidth=4

set autoindent
set cindent

set colorcolumn=100

autocmd BufEnter * EnableStripWhitespaceOnSave

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

let mapleader = ";"

" set vim-picker mappings
nmap <unique> <leader>pe <Plug>(PickerEdit)
nmap <unique> <leader>pen :tabe<CR><Plug>(PickerEdit)
nmap <unique> <leader>ps <Plug>(PickerSplit)
nmap <unique> <leader>pt <Plug>(PickerTabedit)
nmap <unique> <leader>pv <Plug>(PickerVsplit)
nmap <unique> <leader>pb <Plug>(PickerBuffer)
nmap <unique> <leader>p] <Plug>(PickerTag)
nmap <unique> <leader>pw <Plug>(PickerStag)
nmap <unique> <leader>po <Plug>(PickerBufferTag)
nmap <unique> <leader>ph <Plug>(PickerHelp)

" mapping to show time
nmap <unique> <leader>t :NERDTree<CR>


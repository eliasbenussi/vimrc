set shell=bash

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'gmarik/vundle'

" Install base16 colourscheme
Plugin 'chriskempson/base16-vim'

Plugin 'tpope/vim-sensible'

" Helps learning how to avoid hjkl and arrows when unnecessary
Plugin 'takac/vim-hardtime'

Plugin 'ConradIrwin/vim-bracketed-paste'

" We could also add repositories with a ".git" extension
Plugin 'scrooloose/nerdtree.git'

" To get plugins from Vim Scripts, you can reference the plugin
" by name as it appears on the site
Plugin 'Buffergator'

" Below are the syntax highlighting plugins
Plugin 'sheerun/vim-polyglot'

" General asynch linting
Plugin 'w0rp/ale'

" Handle trailing whitespaces
Plugin 'ntpeters/vim-better-whitespace'

" Now we can turn our filetype functionality back on

Plugin 'tpope/vim-commentary'

" " A Vim Plugin for Lively Previewing LaTeX PDF Output
" Plugin 'xuhdev/vim-latex-live-preview'

call vundle#end()

filetype plugin indent on

" let g:hardtime_default_on = 1

set relativenumber
set number

" Tab between windows in normal mode
nmap <Tab> <C-W><C-W>

function! NumberToggle()
 if(&relativenumber == 1)
   set norelativenumber
 else
   set relativenumber
 endif
endfunc

nnoremap <C-e> :call NumberToggle()<cr>

set expandtab
set shiftwidth=4

set autoindent
set cindent

set mouse=nicr

set colorcolumn=80
set background=dark

let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-monokai

autocmd BufEnter * EnableStripWhitespaceOnSave

" " set update frequency of the Tex live preview
" autocmd Filetype tex setl updatetime=1
" " set previewer for Tex
" let g:livepreview_previewer = 'open -a Preview'

set fenc=utf-8
set enc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set number
set cursorline
set virtualedit=onemore
set smartindent
set visualbell
set showmatch
set laststatus=2
set wildmode=list:longest
nnoremap j gj
nnoremap k gk
colorscheme elflord
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
set iminsert=0
set imsearch=-1

nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python %
autocmd BufNewFile,BufRead *.hs nnoremap <C-e> :!ghci %
autocmd BufNewFile,BufRead *.tex nnoremap <C-e> :!ptex2pdf -l -ot -kanji=utf8 -synctex=1 %
"-----------------------------------------------------------------
"neobundle
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('$HOME/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'itchyny/lightline.vim'
"NeoBundle 'davidhalter/jedi-vim'
call neobundle#end()
filetype plugin indent on

if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
endif

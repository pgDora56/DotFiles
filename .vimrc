set fenc=utf-8
set enc=utf-8
set nobackup
set noswapfile
set noundofile
set autoread
set hidden
set showcmd
set number
set cursorline
set cursorcolumn
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

nnoremap <ESC><ESC> :nohl<CR>
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
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'davidhalter/jedi-vim'
call neobundle#end()
filetype plugin indent on

if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
endif

"============================================================
" Unit.vimの設定
"
noremap <C-P> :Unite buffer<CR>
noremap <C-N> :Unite -buffer-name-file file<CR>
noremap <C-Z> :Unite file_mru<CR>
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')

au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')

au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> :q<CR>

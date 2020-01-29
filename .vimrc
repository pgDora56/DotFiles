set runtimepath^=$VIM\vim80
syntax on
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
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch!
set iminsert=0
set imsearch=-1
set backspace=indent,eol,start
set foldmethod=indent
set foldcolumn=3
set foldlevel=100

source C:\Users\admin\dotfiles\mycmd.vim

nnoremap <silent><ESC><ESC> :nohl<CR>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <silent><C-@> :NERDTreeToggle<CR>
nnoremap <F5> :tabe ~/.vimrc<CR>
nnoremap <F6> :tabe ~/_gvimrc<CR>
nnoremap <C-F5> :tabe ~/dotfiles/mycmd.vim<CR>
nnoremap x "_x
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python %
autocmd BufNewFile,BufRead *.hs nnoremap <C-e> :!stack ghci %
autocmd BufNewFile,BufRead *.ltx nnoremap <silent><C-e> :!ptex2pdf -l -ot -kanji=utf8 -synctex=1 %<CR>
autocmd BufNewFile,BufRead *.rs nnoremap <C-e> :!cargo run<CR>

"#####dein設定#####
" プラグインがインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体がインストールされるディレクトリ
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/dotfiles')
  let s:toml      = g:rc_dir . '/dein.toml'
  " let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  " call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

"#####基本設定#####
syntax on  "シンタックスハイライトを有効にする
" colorscheme slate


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

"==== vim-markdown Settings
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

"==== kannokanno/previm Settings
autocmd BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'start'
nnoremap <silent> <C-e> :PrevimOpen<CR>



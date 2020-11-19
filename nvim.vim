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
set scrolloff=5

noremap <C-J> :bprev<CR>
noremap <C-K> :bnext<CR>
nnoremap <C-m> call OpenDiary<CR> "Duplicate some command
nnoremap <silent><ESC><ESC> :nohl<CR>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <C-q> :NERDTreeToggle<CR>
nnoremap x "_x
nnoremap <A-t> :vnew<CR>:terminal<CR><C-w>L
nnoremap Q gq
tnoremap <Esc> <C-\><C-n>
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!py %<CR>
autocmd BufNewFile,BufRead *.hs nnoremap <C-e> :!stack ghci %
autocmd BufNewFile,BufRead *.ltx nnoremap <silent><C-e> :!ptex2pdf -l -ot -kanji=utf8 -synctex=1 %<CR>
autocmd BufNewFile,BufRead *.rs nnoremap <C-e> :!cargo run<CR>
autocmd BufNewFile,BufRead *.go nnoremap <C-e> :!go run %<CR>

exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")

"#####基本設定#####
"
source ~/.config/nvim/dotfiles/mycmd.vim

syntax on

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
"==== kannokanno/previm Settings
autocmd BufRead,BufNewFile *.md set filetype=markdown
nnoremap <silent> <C-p> :PrevimOpen<CR>
let g:vim_markdown_folding_disabled=1
let g:previm_enable_realtime=1

"=== mkdir setting
augroup vimrc-auto-mkdir  " {{{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)  " {{{
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " }}}
augroup END  " }}}

"=== colorscheme setting
colorscheme shirotelin

"=== pep8 setting
let g:syntastic_python_checkers = ["flake8"]
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

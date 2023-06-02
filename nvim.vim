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
nnoremap <C-H> gt
nnoremap <C-L> gT
nnoremap <silent><ESC><ESC> :nohl<CR>
nnoremap <silent><C-q> :NERDTreeToggle<CR>
nnoremap <silent><C-t><C-t> :TweetVimHomeTimeline<CR>
nnoremap <C-t>s :TweetVimCommandSay
nnoremap <silent><C-t>S :TweetVimSay<CR>
nnoremap <C-t>v :TweetVimListStatuses WatchList<CR>
nnoremap x "_x
nnoremap <A-t> :vnew<CR>:terminal<CR><C-w>L
nnoremap Q gq
tnoremap <Esc> <C-\><C-n>
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python3 %<CR>
autocmd BufNewFile,BufRead *.hs nnoremap <C-e> :!stack ghci %
autocmd BufNewFile,BufRead *.ltx nnoremap <silent><C-e> :!ptex2pdf -l -ot -kanji=utf8 -synctex=1 %<CR>
autocmd BufNewFile,BufRead *.rs nnoremap <C-e> :!cargo run<CR>
autocmd BufNewFile,BufRead *.go nnoremap <C-e> :GoRun<CR>

exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")

"#####基本設定#####
"
source ~/.config/nvim/DotFiles/dein.vim
source ~/.config/nvim/DotFiles/mycmd.vim
source ~/.config/nvim/DotFiles/autopep8.vim

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

"==== Filetype settings
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.asm set filetype=nasm


"==== vim-markdown Settings
"==== kannokanno/previm Settings
nnoremap <silent> <C-p> :PrevimOpen<CR>
let g:vim_markdown_folding_disabled=1
let g:previm_enable_realtime=1

"=== mkdir setting
augroup vimrc-auto-mkdir  " {{{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)  " {{{
    if !isdirectory(a:dir) && (a:force || input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " }}}
augroup END  " }}}

"=== colorscheme setting
colorscheme shirotelin

"=== pep8 setting
let g:syntastic_python_checkers = ["flake8"]
autocmd BufRead,BufNewFile /mnt/c/var/KyoPro/* let g:syntastic_python_checkers = ["pyflakes"]
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_ignore_files = ['\c/mnt/c/var/KyoPro/']
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"==== jedi-vim setting
let g:jedi#popup_on_dot = 0

"=== vim-go setting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_fmt_command = "gofmt"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
" let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['vet']

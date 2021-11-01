# DotFiles

my neovim setting

## File tree

```
~
└── .config
    └── nvim
        ├── init.vim      : Call by neovim
        └── DotFiles      : This repository 
```

## Setting
1. Install [neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-source)
2. Set up [dein](https://github.com/Shougo/dein.vim)
3. Set up `.config`
4. Start nvim and run `:call dein#install()`.
5. Let's coding!

## init.vim

```vim
if &compatible
        set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
        call dein#begin('~/.cache/dein')
        call dein#load_toml('~/.config/nvim/DotFiles/dein.toml', {'lazy': 0})
        call dein#load_toml('~/.config/nvim/DotFiles/dein_lazy.toml', {'lazy': 1})
        call dein#end()
        call dein#save_state()
endif
filetype plugin indent on

source ~/.config/nvim/DotFiles/nvim.vim
```

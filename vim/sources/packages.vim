" Set runtime path to include dein package manager
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/bundle')
    call dein#begin('~/.vim/bundle')
    call dein#add('Shougo/dein.vim')

    " Basics: colorscheme, status line
    call dein#add('itchyny/lightline.vim')
    call dein#add('flazz/vim-colorschemes')
    call dein#add('felixhummel/setcolors.vim')

    " Advanced: comments, git gutter, braces matching
    call dein#add('scrooloose/nerdcommenter')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('itmammoth/doorboy.vim')
    call dein#add('kopischke/vim-stay')

    " Ctrl-P:  Searchable file opening panels
    call dein#add('ctrlpvim/ctrlp.vim')

    " Syntaxes: whatever necessary to get the job done
    call dein#add('avakhov/vim-yaml',
      \ {'lazy': 1, 'on_ft': ['yaml']})
    call dein#add('elzr/vim-json',
      \ {'lazy': 1, 'on_ft': ['json']})
    call dein#add('plasticboy/vim-markdown',
      \ {'lazy': 1, 'on_ft': ['markdown']})

    " Required:
    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on    " required
syntax enable                " required

if dein#check_install()
  call dein#install()
endif

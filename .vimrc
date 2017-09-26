
set nocompatible              " required
filetype off                  " required

" Runtime path to include Dein and initialize
set rtp+=~/.vim/bundle/repos/github.com/Shougo/dein.vim
call dein#begin('~/.vim/bundle')

" Let Dein manage Dein, required
call dein#add('Shougo/dein.vim')

" Plugin Area!
call dein#add('tmhedberg/SimpylFold')
call dein#add('scrooloose/nerdtree')
call dein#add('scrooloose/nerdcommenter')
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('itchyny/lightline.vim')
call dein#add('flazz/vim-colorschemes')
call dein#add('airblade/vim-gitgutter')
call dein#add('itmammoth/doorboy.vim')
call dein#add('groenewege/vim-less')
call dein#add('elzr/vim-json')
call dein#add('davidhalter/jedi-vim')
call dein#add('nvie/vim-flake8')

" All of your Plugins must be added before the following line
call dein#end()              " required
filetype plugin indent on    " required
syntax enable                " required

if dein#check_install()
  call dein#install()
endif

" Include other config files
source ~/.vim/sources/mappings.vim

" Nerdtree-specific settings
"autocmd vimenter * NERDTree
"autocmd VimEnter * wincmd p
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Allow for nice statusline
set laststatus=2

" Lines of history
set history=700

" Highlight current line
set cul

" Set to auto read when file is changed from the outside
set autoread

" Show line numbers
set number

" Height of the command bar
set cmdheight=1

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Configure color scheme and slightly modify line numbers
" set background=dark
colorscheme zenburn
" highlight LineNr ctermfg=green


" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Restore proper backspace behavior
set backspace=indent,eol,start


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Enable folding
set foldmethod=indent
set foldlevel=99

" Allow proper crontab-editing on macOS
au BufEnter /private/tmp/crontab.* setl backupcopy=yes

" Enable PEP8 compliant python indentation
au BufNewFile,BufRead *.py;
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=100
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" Enable proper indentation for webdevelopment
au BufNewFile,BufRead *.js, *.html, *.css;
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" JSON highlighting
au! BufRead,BufNewFile *.json set filetype=json

" YAML indentation
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Enable whitespace and tab flagging
highlight UnwanttedTab ctermbg=red guibg=darkred
highlight TrailSpace guibg=red ctermbg=darkred
match UnwanttedTab /\t/
match TrailSpace / \+$/
autocmd ColorScheme * highlight UnwanttedTab ctermbg=red guibg=darkred
autocmd ColorScheme * highlight TrailSpace guibg=red ctermbg=darkred

" Remove trailing whitespace in python files automagically on save
autocmd BufWritePre *.py %s/\s\+$//e

" Enable overly long line flagging and colorcolumn
if exists('+colorcolumn')
    highlight ColorColumn ctermbg=238 guibg=#434443
    let &colorcolumn="80,".join(range(120,999),",")
endif

highlight OverLength ctermbg=red ctermfg=white guibg=darkred
augroup LongLines
    autocmd!
    autocmd FileType * match none
    autocmd FileType python,c,sh match OverLength '\%>121v.\+'
augroup END

augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost ~/.vimrc source ~/.vimrc
augroup END " }


" Custom settings for nerdcommenter
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDSpaceDelims = 1

" Custom settings for youcompleteme
let g:ycm_python_binary_path = 'python'



set nocompatible              " required
filetype off                  " required

" Runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugin Area!
Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'itmammoth/doorboy.vim'
""Plugin 'elzr/vim-json' "" Useful for working with tons of JSON

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Include other config files
source ~/.vim/sources/mappings.vim

" Nerdtree-specific settings
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Airline-specific settings
set laststatus=2
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1


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

" Enable syntax highlighting
syntax enable

" Configure color scheme and slightly modify line numbers
set background=light
colorscheme solarized
highlight LineNr ctermfg=green


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
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" Enable proper indentation for webdevelopment
au BufNewFile,BufRead *.js, *.html, *.css;
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Enable whitespace and tab flagging
highlight UnwanttedTab ctermbg=red guibg=darkred
highlight TrailSpace guibg=red ctermbg=darkred
match UnwanttedTab /\t/
match TrailSpace / \+$/

autocmd ColorScheme * highlight UnwanttedTab ctermbg=red guibg=darkred
autocmd ColorScheme * highlight TrailSpace guibg=red ctermbg=darkred

autocmd BufWritePre *.py %s/\s\+$//e

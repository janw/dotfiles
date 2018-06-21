" Initialize Plugins
if &compatible
	set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/bundle')
	call dein#begin('~/.vim/bundle')

	" Let dein manage dein
	" Required:
	call dein#add('Shougo/dein.vim')

	" Basics: colorscheme, status line
    call dein#add('itchyny/lightline.vim')
	call dein#add('flazz/vim-colorschemes')
        call dein#add('felixhummel/setcolors.vim')

    " Advanced: code folding, comments, git gutter, braces matching
    call dein#add('tmhedberg/simpylfold')
    call dein#add('scrooloose/nerdcommenter')
	call dein#add('airblade/vim-gitgutter')
	call dein#add('itmammoth/doorboy.vim')
    call dein#add('kopischke/vim-stay')

    " Ctrl-P:  Searchable file opening panels
    call dein#add('ctrlpvim/ctrlp.vim')

    " Syntaxes: whatever necessary to get the job done
	call dein#add('groenewege/vim-less',
			\ {'lazy': 1, 'on_ft': ['less']})
	call dein#add('elzr/vim-json',
			\ {'lazy': 1, 'on_ft': ['json']})
	call dein#add('davidhalter/jedi-vim',
			\ {'lazy': 1, 'on_ft': ['py', 'python', 'python2', 'python3']})
	call dein#add('nvie/vim-flake8',
			\ {'lazy': 1, 'on_ft': ['py', 'python', 'python2', 'python3']})
	call dein#add('plasticboy/vim-markdown',
			\ {'lazy': 1, 'on_ft': ['md', 'markdown','markd']})
	call dein#add('chase/vim-ansible-yaml',
			\ {'lazy': 1, 'on_ft': ['yaml', 'yml']})

    " Neovim: specifics
	if has('nvim')
		call dein#add('Shougo/deol.nvim')
	endif

	" Required:
	call dein#end()
	call dein#save_state()
endif

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

" Change to current dir automatically
set autochdir

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
colorscheme delek
set background=dark


" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Restore proper backspace behavior
set backspace=indent,eol,start


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Proper spaces-for-tabs behavior
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab


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
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab smarttab

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
let &cc="80"
fun! ToggleCC()
    if &cc == ''
        let &cc="80,".join(range(120,999),",")
    else
        let &cc=""
    endif
endfun
nnoremap <F2> :call ToggleCC()<CR>



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

" Gitgutter signs:
let g:gitgutter_sign_added = '•'
let g:gitgutter_sign_modified = '•'
let g:gitgutter_sign_removed = '•'
let g:gitgutter_sign_removed_first_line = '•'
let g:gitgutter_sign_modified_removed = '•'

" Ale Linter signs
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⁈'
highlight clear ALEErrorSign
highlight clear ALEWarningSign

" Lightline blocks
let g:lightline = {
      \ 'colorscheme': '16color',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'linter_warnings', 'linter_errors', 'linter_ok' ],
      \              [ 'filetype' ] ]
      \ },
      \ 'component_expand': {
      \   'linter_warnings': 'LightlineLinterWarnings',
      \   'linter_errors': 'LightlineLinterErrors',
      \   'linter_ok': 'LightlineLinterOK'
      \ },
      \ 'component_type': {
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'ok'
      \ },
      \ }




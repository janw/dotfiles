if &compatible
	set nocompatible
endif

" Include third-party packages
source ~/.vim/sources/packages.vim
source ~/.vim/sources/mappings.vim
source ~/.vim/sources/defaults.vim
source ~/.vim/sources/filetypes.vim

" Configure color scheme and slightly modify line numbers
colorscheme delek
set background=dark


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
fun! ToggleCC()
    if &cc == ''
        let &cc="80,".join(range(120,999),",")
    else
        let &cc=""
    endif
endfun
nnoremap <F2> :call ToggleCC()<CR>



" CtrlP-specific settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'rca'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Custom settings for nerdcommenter
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDSpaceDelims = 1

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

source ~/.vim/sources/lightline.vim


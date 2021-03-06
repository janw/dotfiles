"Map proper tabbing commands
nmap <C-right> :tabnext<CR>
nmap <C-left> :tabprevious<CR>
map <C-right> :tabnext<CR>
map <C-left> :tabprevious<CR>
imap <C-right> <ESC>:tabprevious<CR>
imap <C-left> <ESC>:tabnext<CR>

" Enable split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding with the spacebar
nnoremap <space> za

" Enabel mouse-wheel scrolling
set mouse=a

" Clear search highlighting by hitting ESC
nnoremap <silent><esc> :noh<CR>
nnoremap <esc>^[ <esc>^[

" Map copy-paste emulation
inoremap <C-v> <esc>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d


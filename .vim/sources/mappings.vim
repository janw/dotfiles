"Remove default arrow key mappings
ino <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>

no <up> <Nop>
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>

vno <up> <Nop>
vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>

"Map proper tabbing commands
nmap <C-right> :tabnext<CR>
nmap <C-left> :tabprevious<CR>
map <C-right> :tabnext<CR>
map <C-left> :tabprevious<CR>
imap <C-right> <ESC>:tabprevious<CR>
imap <C-left> <ESC>:tabnext<CR>

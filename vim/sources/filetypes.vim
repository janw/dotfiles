" Crontab-editing on macOS
au BufEnter /private/tmp/crontab.* setl backupcopy=yes

" Reload vimconf on save
au BufWritePost ~/.vimrc source ~/.vimrc

" Python: Enable PEP8 compliant python indentation
au BufRead,BufNewFile *.py;
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=120
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" Webdev: Enable proper indentation
au BufRead,BufNewFile *.js, *.html, *.css;
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" JSON: Highlighting
au! BufRead,BufNewFile *.json;
    \ set autoindent
    \ set formatoptions=tcq2l
    \ set shiftwidth=2
    \ set softtabstop=2
    \ set tabstop=8
    \ set expandtab
    \ set foldmethod=syntax
    \ set filetype=json

" YAML: Indentation
au BufRead,BufNewFile *.yml, *.yaml;
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
    \ set expandtab
    \ set smarttab
    \ set filetype=yaml

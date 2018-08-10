" Crontab-editing on macOS
au BufEnter /private/tmp/crontab.* setl backupcopy=yes

" Reload vimconf on save
au BufWritePost ~/.vimrc source ~/.vimrc

" Python: Enable PEP8 compliant python indentation
au BufRead,BufNewFile *.py set filetype=python
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=120
    \ expandtab
    \ autoindent
    \ fileformat=unix

" Webdev: Enable proper indentation
au BufRead,BufNewFile *.js,*.html,*.css set
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

" JSON: Highlighting
au! BufRead,BufNewFile *.json set
    \ autoindent
    \ formatoptions=tcq2l
    \ shiftwidth=2
    \ softtabstop=2
    \ tabstop=8
    \ expandtab
    \ foldmethod=syntax
    \ filetype=json

" YAML: Indentation
au BufRead,BufNewFile *.yml,*.yaml set
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
    \ expandtab
    \ smarttab
    \ filetype=yaml

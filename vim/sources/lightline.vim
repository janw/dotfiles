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


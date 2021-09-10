Plug 'dense-analysis/ale'

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\   'rust': ['analyzer', 'cargo'],
\}

let g:ale_sign_error = '🥺'
let g:ale_sign_warning = '🙃'

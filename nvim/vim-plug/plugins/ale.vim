Plug 'dense-analysis/ale'

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\   'rust': ['analyzer', 'cargo'],
\}

let g:ale_sign_error = '🥺'
let g:ale_sign_warning = '🙃'

" let g:ale_completion_enabled = 1
" let g:ale_completion_autoimport = 1
" let g:ale_completion_symbols = 1
" set omnifunc=ale#completion#OmniFunc
" call deoplete#custom#option('sources', {
" \ '_': ['ale'],
" \})

Plug 'psf/black', { 'branch': 'stable' }
autocmd BufWritePre *.py execute ':Black'
nnoremap <F9> :Black<CR>


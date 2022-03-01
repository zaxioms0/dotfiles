" goto preview
nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>

" definition in new tab
nnoremap gpn <cmd>tab split \| lua vim.lsp.buf.definition()<cr>


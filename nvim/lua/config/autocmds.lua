vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { "c", "cpp", "rust", "lua", "markdown", "markdown_inline" },
  callback = function() vim.treesitter.start() end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function(event)
        local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end


        -- disable semantic tokens except for c
        if vim.bo.filetype ~= "c" and vim.bo.filetype ~= "cpp" then
            local client = vim.lsp.get_client_by_id(event.data.client_id)
            client.server_capabilities.semanticTokensProvider = nil
        end

        map("<leader>d", vim.diagnostic.open_float, "Open Diagnostic Float")
        map("<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show All Diagnostics")
        map("H", vim.lsp.buf.hover, "Hover Documentation")
        map("gd", vim.lsp.buf.declaration, "Goto Declaration")
        map("gD", vim.lsp.buf.definition, "Goto Definition")
        map("gr", "<cmd>Telescope lsp_references<CR>", "List All References")
        map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
        map("<leader>rn", vim.lsp.buf.rename, "Rename all references")
        map("<leader>fm", vim.lsp.buf.format, "Format")
        -- map("<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Goto Definition in Vertical Split")

        -- local function client_supports_method(client, method, bufnr)
        --     if vim.fn.has 'nvim-0.11' == 1 then
        --         return client:supports_method(method, bufnr)
        --     else
        --         return client.supports_method(method, { bufnr = bufnr })
        --     end
        -- end
        --
        -- local client = vim.lsp.get_client_by_id(event.data.client_id)
        -- if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
        --     local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
        --
        --     -- When cursor stops moving: Highlights all instances of the symbol under the cursor
        --     -- When cursor moves: Clears the highlighting
        --     vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        --         buffer = event.buf,
        --         group = highlight_augroup,
        --         callback = vim.lsp.buf.document_highlight,
        --     })
        --     vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        --         buffer = event.buf,
        --         group = highlight_augroup,
        --         callback = vim.lsp.buf.clear_references,
        --     })
        --
        --     -- When LSP detaches: Clears the highlighting
        --     vim.api.nvim_create_autocmd('LspDetach', {
        --         group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
        --         callback = function(event2)
        --             vim.lsp.buf.clear_references()
        --             vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
        --         end,
        --     })
        -- end
    end,

})

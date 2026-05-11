vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = { "c", "cpp", "rust", "lua", "markdown", "markdown_inline", "python", "asm" },
--   callback = function() vim.treesitter.start() end,
-- })

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function(event)
        -- disable semantic tokens except for c
        if vim.bo.filetype ~= "c" and vim.bo.filetype ~= "cpp" then
            local client = vim.lsp.get_client_by_id(event.data.client_id)
            client.server_capabilities.semanticTokensProvider = nil
        end
        require("config.keymaps").lsp(event.buf)
    end,

})

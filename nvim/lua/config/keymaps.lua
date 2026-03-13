local M = {}
M.general = function()
    vim.keymap.set("n", "<C-t>", "<Nop>")
    vim.keymap.set("n", "<C-t>n", "<cmd>tabnew<CR>")
    vim.keymap.set("n", "<C-t>h", "<cmd>tabp<CR>")
    vim.keymap.set("n", "<C-t>l", "<cmd>tabn<CR>")

    -- fat finger protection
    vim.api.nvim_create_user_command('W', 'w', {})
    vim.api.nvim_create_user_command('WQ', 'wq', {})
    vim.api.nvim_create_user_command('Wq', 'wq', {})
    vim.api.nvim_create_user_command('Wqa', 'wqa', {})
    vim.api.nvim_create_user_command('Q', 'q', {})
end

M.lsp = function(buf)
    local map = function(keys, func, desc)
        vim.keymap.set("n", keys, func, { buffer = buf, desc = "LSP: " .. desc })
    end

    local builtin = require('telescope.builtin')
    map("<leader>d", vim.diagnostic.open_float, "Open Diagnostic Float")
    map("<leader>D", builtin.diagnostics, "Show All Diagnostics")
    map("H", vim.lsp.buf.hover, "Hover Documentation")
    map("gd", vim.lsp.buf.declaration, "Goto Declaration")
    map("gD", vim.lsp.buf.definition, "Goto Definition")
    map("gr", builtin.lsp_references, "List All References")
    map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
    map("<leader>rn", vim.lsp.buf.rename, "Rename all references")
    map("<leader>fm", vim.lsp.buf.format, "Format")
end

M.tele = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fc', function()
        builtin.grep_string({
            search_dirs = { '.' },
            path_display = { 'smart' },
            only_sort_text = true,
            word_match = "-w",
            search = '',
        })
    end, {})
end

M.tree = function()
    vim.keymap.set("n", "<leader>tr", vim.cmd.NvimTreeToggle)
end

M.cmp = function(cmp)
    return cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<C-e>"] = cmp.mapping.abort()
    })
end

return M

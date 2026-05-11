local M = {}
M.general = function()
    vim.keymap.set("n", "<C-t>", "<Nop>")
    vim.keymap.set("n", "<C-t>n", vim.cmd.tabnew)
    vim.keymap.set("n", "<C-t>h", vim.cmd.tabprev)
    vim.keymap.set("n", "<C-t>l", vim.cmd.tabnext)

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

    -- local builtin = require('telescope.builtin')
    map("<leader>d", vim.diagnostic.open_float, "Open Diagnostic Float")
    -- map("<leader>D", builtin.diagnostics, "Show All Diagnostics")
    map("H", vim.lsp.buf.hover, "Hover Documentation")
    -- map("gd", vim.lsp.buf.declaration, "Goto Declaration")
    -- map("gD", vim.lsp.buf.definition, "Goto Definition")
    -- map("gr", builtin.lsp_references, "List All References")
    map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
    map("<leader>rn", vim.lsp.buf.rename, "Rename all references")
    map("<leader>fm", vim.lsp.buf.format, "Format")
end
M.snacks = function()
    local Snacks = require("snacks")
    return {
        { "<leader>ff", function() Snacks.picker.smart() end,                 desc = "Smart Find Files" },
        { "<leader>,",  function() Snacks.picker.buffers() end,               desc = "Buffers" },
        { "<leader>fc", function() Snacks.picker.grep() end,                  desc = "Grep (Find Code)" },
        { "<leader>fl", function() Snacks.picker.lines() end,                 desc = "Grep (Find Code)" },
        { "gd",         function() Snacks.picker.lsp_declarations() end,      desc = "Goto Definition" },
        { "gD",         function() Snacks.picker.lsp_definitions() end,        desc = "Goto Declaration" },
        { "gr",         function() Snacks.picker.lsp_references() end,        nowait = true,                    desc = "References" },
        { "<leader>D",  function() Snacks.picker.diagnostics_buffer() end,    desc = "Diagnostics" },
        { "gy",         function() Snacks.picker.lsp_type_definitions() end,  desc = "Goto T[y]pe Definition" },
        { "<leader>ss", function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols" },
        { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
        { "]]",         function() Snacks.words.jump(vim.v.count1) end,       desc = "Next Reference",          mode = { "n" } },
        { "[[",         function() Snacks.words.jump(-vim.v.count1) end,      desc = "Prev Reference",          mode = { "n" } },
        { "[s",         function() Snacks.scope.jump() end,                   desc = "Jump to Top of Scope",    mode = { "n" } },
        { "]s",         function() Snacks.scope.jump({ bottom = true }) end,  desc = "Jump to Bottom of Scope", mode = { "n" } },
        {
            "<leader>tt",
            function()
                Snacks.terminal.toggle(nil, {
                    win = {
                        position = "float"
                    }
                })
            end,
            desc = "Toggle Terminal",
            mode = { "n", "t" }
        },
    }
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

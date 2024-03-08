
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.termguicolors = true
vim.o.colorcolumn = "120"
vim.g.mapleader = "\\"

-- line numbering
-- absolute in normal mode
-- relative in insert and visual
vim.o.number = true
vim.o.relativenumber = true

local autocmd = vim.api.nvim_create_autocmd
autocmd({"InsertEnter"}, {
    callback = function()
        vim.o.relativenumber = false
    end
})
autocmd({"InsertLeave"}, {
    callback = function()
        vim.o.relativenumber = true
    end
})

-- keybinds
-- tab control
vim.keymap.set("n", "<C-t>n", "<cmd>tabnew<CR>")
vim.keymap.set("n", "<C-t>h", "<cmd>tabp<CR>")
vim.keymap.set("n", "<C-t>l", "<cmd>tabn<CR>")

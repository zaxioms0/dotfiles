vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.termguicolors = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.colorcolumn = "120"
vim.o.wrap = false
vim.g.mapleader = "\\"
vim.o.number = true
vim.o.winborder = 'rounded'
-- line numbering
-- absolute in insert mode
-- relative in normal and visual
-- vim.o.relativenumber = true
--
-- local autocmd = vim.api.nvim_create_autocmd
-- autocmd({"InsertEnter"}, {
--     callback = function()
--         vim.o.relativenumber = false
--     end
-- })
-- autocmd({"InsertLeave"}, {
--     callback = function()
--         vim.o.relativenumber = true
--     end
-- })

-- keybinds
require("config.keymaps").general()
require("config.resize").setup()

vim.filetype.add({
    extension = {
        fun = "sml",
        sig = "sml"
    },
})

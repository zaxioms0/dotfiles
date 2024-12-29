vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.termguicolors = true
vim.o.splitright = true
vim.o.colorcolumn = "120"
vim.wo.wrap = false
vim.g.mapleader = "\\"

-- line numbering
-- absolute in insert mode
-- relative in normal and visual
vim.o.number = true
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
-- tab control
vim.keymap.set("n", "<C-t>n", "<cmd>tabnew<CR>")
vim.keymap.set("n", "<C-t>h", "<cmd>tabp<CR>")
vim.keymap.set("n", "<C-t>l", "<cmd>tabn<CR>")

-- fat finger protection
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('WQ', 'wq', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_create_user_command('Wqa', 'wqa', {})
vim.api.nvim_create_user_command('Q', 'q', {})

vim.filetype.add({
    extension = {
        fun = "sml",
        sig = "sml"
    },
})

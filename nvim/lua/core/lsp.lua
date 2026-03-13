local lsp_dir = vim.fn.stdpath("config") .. "/lsp"
local servers = {}
for _, file in ipairs(vim.fn.readdir(lsp_dir)) do
    table.insert(servers,file:sub(1, -5))
end
vim.lsp.enable(servers)

vim.diagnostic.config({
    -- virtual_lines = true,
    -- virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        -- numhl = {
        --     [vim.diagnostic.severity.ERROR] = "ErrorMsg",
        --     [vim.diagnostic.severity.WARN] = "WarningMsg",
        -- },
    },
})

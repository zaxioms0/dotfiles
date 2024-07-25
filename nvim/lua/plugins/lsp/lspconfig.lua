return {
    "neovim/nvim-lspconfig",
    event = {"BufReadPre", "BufNewFile"},
    dependencies = {
        "hrsh7th/nvim-cmp"
    },
    config = function() 
        local lspconfig = require("lspconfig")

        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local keymap = vim.keymap
        local opts = {noremap = true, silent = true}
        local on_attach = function(client, bufnr)

            opts.desc = "Show LSP References"
            keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
            keymap.set("n", "gt", vim.lsp.buf.definition, opts)
            keymap.set("n", "gT", "<cmd> tab split | lua vim.lsp.buf.definition() <CR>", opts)

            opts.desc = "smart rename"
            keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>")

            keymap.set("n", "<leader>d", vim.diagnostic.open_float)
            keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>")

            keymap.set("n", "H", vim.lsp.buf.hover)
            vim.keymap.set({"n", "v"}, "<leader>fm", vim.lsp.buf.format)

            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
            
            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics, {
                    virtual_text = false
                }
            )
        end

        local capabilities = cmp_nvim_lsp.default_capabilities()

        lspconfig.clangd.setup {
            capabilities = capabilities,
            on_attach = on_attach
        }

        -- lspconfig.pylsp.setup {
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        --     settings = {
        --         pylsp = {
        --             plugins = {
        --                 pycodestyle = {
        --                     maxLineLength = 120,
        --                     ignore = {"E203", "W503"},
        --                 },
        --                 mccabe = {
        --                     enabled = false,
        --                 },
        --                 black = { 
        --                     enabled = true,
        --                     line_length = 120
        --                 }
        --             }
        --         }
        --     }
        -- }
        --
        lspconfig.pyright.setup {
            capabilities = capabilities,
            on_attach = on_attach,
        }

        lspconfig.rust_analyzer.setup {
            capabilities = capabilities,
            on_attach = on_attach
        }
    end
}

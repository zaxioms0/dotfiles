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
            keymap.set("n", "gT", "<cmd>Telescope lsp_type_definitions<CR>", opts)

            opts.desc = "smart rename"
            keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>")

            keymap.set("n", "<leader>d", vim.diagnostic.open_float)
            keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>")

            keymap.set("n", "H", vim.lsp.buf.hover)
            vim.keymap.set({"n", "v"}, "<leader>fm", vim.lsp.buf.format)

            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
        end
        
        local capabilities = cmp_nvim_lsp.default_capabilities()

        lspconfig.clangd.setup {
            capabilities = capabilities,
            on_attach = on_attach
        }

        lspconfig.pylyzer.setup {
            capabilities = capabilities,
            on_attach = on_attach,
            handlers = {
                ['textDocument/publishDiagnostics'] = function() end
            }
        }

        vim.g.rustaceanvim = function()
            return {
                -- other rustacean settings. --
                server = {
                on_attach = function()
                    on_attach()
                    vim.keymap.set("n", "<leader>ca", function() vim.cmd.RustLsp { "codeAction" } end, { buffer = bufnr })

                -- other settings. -- 
                end
                }
            }
        end
    end
}

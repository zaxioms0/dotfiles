return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        local configs = require 'nvim-treesitter.configs'
        configs.setup {
            highlight = { enable = true },
            ensure_installed = {
                "c",
                "rust",
                "ocaml",
                "python",
                "vimdoc",
                "luadoc",
                "vim",
                "lua",
                "markdown"
            },
            indent = { enable = false },
        }
    end
}

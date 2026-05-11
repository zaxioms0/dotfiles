return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ':TSUpdate',
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "lua", "vim", "vimdoc", "c", "cpp", "python", "rust", "asm", "ocaml", "markdown", "markdown_inline" },
            auto_install = true,
            highlight = {
                enable = true,
            },
        })
    end
}
-- return {}

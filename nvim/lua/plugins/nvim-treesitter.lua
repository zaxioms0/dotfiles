return {
    "nvim-treesitter/nvim-treesitter",
    branch="master",
    lazy=false,
    build = ':TSUpdate',
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "lua", "vim", "vimdoc", "c", "cpp", "python", "rust", "asm", "ocaml" },
            auto_install = true,
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        })
    end
}
-- return {}

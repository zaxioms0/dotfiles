return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = true },
        dashboard = { enabled = false },
        indent = {
            enabled = true,
            animate = {
                enabled = false,
            },
        },
        input = { enabled = true },
        picker = {
            enabled = true,
        },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scope = {
            enabled = true,
            keys = {
                ---@type table<string, snacks.scope.TextObject|{desc?:string}|false>
                textobject = {
                    is = {
                        min_size = 2, -- minimum size of the scope
                        edge = false, -- inner scope
                        cursor = false,
                        treesitter = { blocks = { enabled = true } },
                        desc = "inner scope",
                    },
                }
            }
        },
        words = {
            enabled = true,
            notify_jump = false
        },
    },
    keys = require("config.keymaps").snacks,
    config = function(_, opts)
        require("snacks").setup(opts)
        vim.schedule(function()
            -- float window color config
            vim.api.nvim_set_hl(0, "SnacksPickerListTitle", { link = "DraculaCyan" })
            vim.api.nvim_set_hl(0, "SnacksPickerBufType", { link = "DraculaCyan" })
            vim.api.nvim_set_hl(0, "FloatTitle", { link = "DraculaCyan" })
            vim.api.nvim_set_hl(0, "SnacksPickerMatch", { link = "DraculaPurple" })
            vim.api.nvim_set_hl(0, "SnacksPickerDir", { link = "DraculaComment" })
            vim.api.nvim_set_hl(0, "SnacksPickerBorder", { link = "DraculaPurple" })
            vim.api.nvim_set_hl(0, "SnacksPickerTitle", { link = "DraculaCyan" })
        end)
    end,
}

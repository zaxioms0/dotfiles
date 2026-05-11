return {
    "rmagatti/auto-session",
    lazy = false,
    opts = {
        suppressed_dirs = { "~/", "~/Code", "~/Downloads", "/" },
        pre_save_cmds = {
            function()
                for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
                    if vim.api.nvim_buf_is_loaded(bufnr) then
                        local wins = vim.fn.win_findbuf(bufnr)
                        if #wins == 0 then
                            vim.api.nvim_buf_delete(bufnr, { force = false })
                        end
                    else
                        vim.api.nvim_buf_delete(bufnr, { force = false })
                    end
                end
            end,
        },

    },
}

return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')

        function fuzzyFindFiles()
            builtin.grep_string({
                search_dirs = { '.' },
                path_display = { 'smart' },
                only_sort_text = true,
                word_match = "-w",
                search = '',
            })
        end

        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fc', '<cmd>lua fuzzyFindFiles{}<cr>', {})
    end
}

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local utils = require('telescope.utils')

require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ['<ESC>'] = actions.close,
            },
        },
    },
})

vim.g.mapleader = ' '
vim.keymap.set(
    'n',
    '<leader>fd',
    function()
        builtin.find_files({ cwd = utils.buffer_dir() })
    end,
    {}
)
vim.keymap.set(
    'n',
    '<leader><TAB>',
    function()
        builtin.buffers({ sort_mru = true, ignore_current_buffer = true })
    end,
    {}
)
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fp', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

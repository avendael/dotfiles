local keymap = vim.keymap

vim.g.mapleader = ' '

keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

keymap.set('n', '<leader>.', vim.cmd.Ex)
keymap.set('n', 'J', 'mzJ`z')

-- Keep cursor centered
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')
keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Replace word at cursor
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Window navigation
keymap.set('n', '<leader>ws', '<C-w>s')
keymap.set('n', '<leader>wv', '<C-w>v')
keymap.set('n', '<leader>wh', '<C-w>h')
keymap.set('n', '<leader>wj', '<C-w>j')
keymap.set('n', '<leader>wk', '<C-w>k')
keymap.set('n', '<leader>wl', '<C-w>l')
keymap.set('n', '<leader>wx', '<C-w>x')
keymap.set('n', '<leader>wc', '<C-w>c')
keymap.set('n', '<leader>wo', '<C-w>o')

-- Diff
if vim.api.nvim_win_get_option(0, 'diff') then
    vim.keymap.set('n', '<leader>1', ':diffget //1<CR>')
    vim.keymap.set('n', '<leader>2', ':diffget //2<CR>')
    vim.keymap.set('n', '<leader>3', ':diffget //3<CR>')
end

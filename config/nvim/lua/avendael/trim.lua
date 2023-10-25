-- Trim trailing whitespace and trailing blank lines on save
local command = vim.api.nvim_create_user_command

local function trim_trailing_whitespace()
    local pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd [[silent keepjumps keeppatterns %s/\s\+$//e]]
    vim.api.nvim_win_set_cursor(0, pos)
end

local function trim_trailing_lines()
    local last_line = vim.api.nvim_buf_line_count(0)
    local last_nonblank_line = vim.fn.prevnonblank(last_line)
    if last_nonblank_line < last_line then
        vim.api.nvim_buf_set_lines(0, last_nonblank_line, last_line, true, {})
    end
end

local function trim()
    if not vim.o.binary and vim.o.filetype ~= 'diff' then
        trim_trailing_lines()
        trim_trailing_whitespace()
    end
end

command('TrimWhitespace', trim_trailing_whitespace, {})
command('TrimTrailingLines', trim_trailing_lines, {})
vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup('trim_on_save', { clear = true }),
    callback = trim,
})

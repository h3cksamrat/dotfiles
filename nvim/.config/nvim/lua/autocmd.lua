local A = vim.api
local fn = vim.fn
local cmd = vim.cmd

local num_au = A.nvim_create_augroup('SAMRAT', { clear = true })
-- Highlight region on yank
A.nvim_create_autocmd('TextYankPost', {
	group = num_au,
	callback = function() vim.highlight.on_yank({ higroup = 'Visual' }) end,
})

function trim_trailing_whitespace()
    local pos = A.nvim_win_get_cursor(0)
    cmd [[silent keepjumps keeppatterns %s/\s\+$//e]]
    A.nvim_win_set_cursor(0, pos)
end

function trim_trailing_lines()
    local last_line = A.nvim_buf_line_count(0)
    local last_nonblank_line = fn.prevnonblank(last_line)
    if last_line > 0 and last_nonblank_line ~= last_line then
        A.nvim_buf_set_lines(0, last_nonblank_line, -1, true, {})
    end
end

local trimWhiteSpace = function()
    if not vim.o.binary and vim.o.filetype ~= 'diff' then
        trim_trailing_lines()
        trim_trailing_whitespace()
    end
end

local whitespace_au = A.nvim_create_augroup('WHITESPACE_SAMRAT', { clear = true })
A.nvim_create_autocmd('BufWritePre', {
  group = whitespace_au,
  pattern = "*",
  callback = trimWhiteSpace
})

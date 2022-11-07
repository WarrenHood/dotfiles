local function map(m, k, v)
	vim.keymap.set(m, k, v, {silent = true})
end


-- Save and Quit
map('n', '<C-Q>', ':wq<CR>')
map('i', '<C-Q>', '<ESC>:wq<CR>')

-- Save
map('n', '<C-S>', ':w<CR>')
map('i', '<C-S>', '<ESC>:w<CR>')



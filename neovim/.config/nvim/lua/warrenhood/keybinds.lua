local function map(m, k, v)
	vim.keymap.set(m, k, v, {silent = true})
end


-- Save and Quit
map('n', '<C-Q>', ':wq<CR>')
map('i', '<C-Q>', '<ESC>:wq<CR>')

-- Save
map('n', '<C-S>', ':w<CR>')
map('i', '<C-S>', '<ESC>:w<CR>')

-- Telescope
local telescope_builtin = require('telescope.builtin')
map('n', '<leader>ff', telescope_builtin.find_files)
map('n', '<leader>fg', telescope_builtin.live_grep)
map('n', '<leader>fb', telescope_builtin.buffers)
map('n', '<leader>fh', telescope_builtin.help_tags)

-- NvimTree Toggle (File Explorer)
map('n', '<C-B>', ':NvimTreeToggle<CR>')

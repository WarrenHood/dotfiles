local function map(m, k, v, opts)
    opts = opts or {}
    if not opts['silent'] then
        opts['silent'] = true
    end
	vim.keymap.set(m, k, v, opts)
end


-- Save and Quit
map('n', '<C-Q>', ':wq<CR>')
map('i', '<C-Q>', '<ESC>:wq<CR>')

-- Save
map('n', '<C-S>', ':w<CR>')
map('i', '<C-S>', '<ESC>:w<CR>')

-- Telescope
local telescope_builtin = require('telescope.builtin')
map('n', '<leader>ff', telescope_builtin.find_files, { desc = 'Find Files' })
map('n', '<leader>fg', telescope_builtin.live_grep, { desc =  'Live Grep'})
map('n', '<leader>fb', telescope_builtin.buffers, { desc = 'Find Buffers'})
map('n', '<leader>fh', telescope_builtin.help_tags, { desc = 'Help Tags' })

-- NvimTree Toggle (File Explorer)
map('n', '<C-B>', ':NvimTreeToggle<CR>')

-- ToggleTerm
map('n', '<C-t>', ':ToggleTerm<CR>')
map('t', '<C-t>', '<C-\\><C-n>:ToggleTerm<CR>')

-- Pane navigation
map('n', '<C-h>', ':wincmd h<CR>')
map('n', '<C-j>', ':wincmd j<CR>')
map('n', '<C-k>', ':wincmd k<CR>')
map('n', '<C-l>', ':wincmd l<CR>')

map('t', '<C-h>', '<C-\\><C-n>:wincmd h<CR>')
map('t', '<C-j>', '<C-\\><C-n>:wincmd j<CR>')
map('t', '<C-k>', '<C-\\><C-n>:wincmd k<CR>')
map('t', '<C-l>', '<C-\\><C-n>:wincmd l<CR>')

-- Pane management
map('n', '<leader>sv', ':vsplit<CR>', { desc = 'Split Vertical' })
map('n', '<leader>sh', ':split<CR>', { desc = 'Split Horizontal' })

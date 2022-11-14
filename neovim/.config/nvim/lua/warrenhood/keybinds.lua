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
map('n', '<S-t>', ':ToggleTerm<CR>')
map('t', '<S-t>', '<C-\\><C-n>:ToggleTerm<CR>')

--[[ -- Pane navigation
map('n', '<C-h>', ':wincmd h<CR>')
map('n', '<C-j>', ':wincmd j<CR>')
map('n', '<C-k>', ':wincmd k<CR>')
map('n', '<C-l>', ':wincmd l<CR>')

map('t', '<C-h>', '<C-\\><C-n>:wincmd h<CR>')
map('t', '<C-j>', '<C-\\><C-n>:wincmd j<CR>')
map('t', '<C-k>', '<C-\\><C-n>:wincmd k<CR>')
map('t', '<C-l>', '<C-\\><C-n>:wincmd l<CR>') ]]

-- Pane management
map('n', '<leader>sv', ':vsplit<CR>', { desc = 'Split Vertical' })
map('n', '<leader>sh', ':split<CR>', { desc = 'Split Horizontal' })


-- Debugging
map("n", "<F4>", ":lua require('dapui').toggle()<CR>")
map("n", "<F5>", ":lua require('dap').toggle_breakpoint()<CR>")
map("n", "<F9>", ":lua require('dap').continue()<CR>")

map("n", "<F1>", ":lua require('dap').step_over()<CR>")
map("n", "<F2>", ":lua require('dap').step_into()<CR>")
map("n", "<F3>", ":lua require('dap').step_out()<CR>")


map("n", "<Leader>dsc", ":lua require('dap').continue()<CR>")
map("n", "<Leader>dsv", ":lua require('dap').step_over()<CR>")
map("n", "<Leader>dsi", ":lua require('dap').step_into()<CR>")
map("n", "<Leader>dso", ":lua require('dap').step_out()<CR>")


map("n", "<Leader>dhh", ":lua require('dap.ui.variables').hover()<CR>")
map("v", "<Leader>dhv", ":lua require('dap.ui.variables').visual_hover()<CR>")


map("n", "<Leader>duh", ":lua require('dap.ui.widgets').hover()<CR>")
map("n", "<Leader>duf", ":lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>")


map("n", "<Leader>dro", ":lua require('dap').repl.open()<CR>")
map("n", "<Leader>drl", ":lua require('dap').repl.run_last()<CR>")

map("n", "<Leader>dbc", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
map("n", "<Leader>dbm", ":lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: '))<CR>")
map("n", "<Leader>dbt", ":lua require('dap').toggle_breakpoint()<CR>")


map("n", "<Leader>dc", ":lua require('dap.ui.variables').scopes()<CR>")
map("n", "<Leader>di", ":lua require('dapui').toggle()<CR>")


-- luasnip
vim.cmd[[
" Use Tab to expand and jump through snippets
imap <silent><expr> <C-k> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
smap <silent><expr> <C-k> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <C-j> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <C-j> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]]

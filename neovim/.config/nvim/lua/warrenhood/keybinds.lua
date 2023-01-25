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
map('n', '<leader>fg', telescope_builtin.live_grep, { desc = 'Live Grep' })
map('n', '<leader>fb', telescope_builtin.buffers, { desc = 'Find Buffers' })
map('n', '<leader>fh', telescope_builtin.help_tags, { desc = 'Help Tags' })

-- NvimTree Toggle (File Explorer)
map('n', '<C-B>', ':NvimTreeToggle<CR>')

-- ToggleTerm
map('n', '<C-t>', ':ToggleTerm<CR>')
map('t', '<C-t>', '<C-\\><C-n>:ToggleTerm<CR>')

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
vim.cmd [[
" Use Tab to expand and jump through snippets
imap <silent><expr> <C-k> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
smap <silent><expr> <C-k> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <C-j> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <C-j> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]]

-- GUI (Neovide
-- Toggle fullscreen in Neovide with Alt + Enter)
if vim.g.neovide then
    map({ "n", "i", "t" }, "<A-CR>", function()
        vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
    end)
end


-- barbar
local barbar_opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', barbar_opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', barbar_opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', barbar_opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', barbar_opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', barbar_opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', barbar_opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', barbar_opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', barbar_opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', barbar_opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', barbar_opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', barbar_opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', barbar_opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', barbar_opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', barbar_opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', barbar_opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', barbar_opts)
-- Wipeout buffer
--                 :BufferWipeout

-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', barbar_opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', barbar_opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', barbar_opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', barbar_opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', barbar_opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used


-- Disable arrow keys
local arrows = {'<Up>', '<Down>', '<Left>', '<Right>'}
for i=1,#arrows do
    map('n', arrows[i], function () end)
    map('i', arrows[i], function () end)
end

-- Format file
vim.cmd "silent! command! Format lua vim.lsp.buf.format()"

-- Open dapui
vim.cmd "silent! command! DapUIOpen lua require('dapui').open()"

-- Close dapui
vim.cmd "silent! command! DapUIClose lua require('dapui').close()"

-- Toggle dapui
vim.cmd "silent! command! DapUIToggle lua require('dapui').toggle()"

-- Edit config
vim.cmd "silent! command! ConfigOpen cd ~/.config/nvim"

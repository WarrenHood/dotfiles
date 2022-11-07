local o = vim.o
local g = vim.g

-- General stuff
o.number = true
o.relativenumber = true

o.tabstop = 2 
o.shiftwidth = 0
o.softtabstop = -1

-- Make clipboard work with neovim
o.clipboard = 'unnamedplus'

-- Case insensitive search
o.ignorecase = true
o.smartcase = true

-- Enable mouse
o.mouse = 'a'

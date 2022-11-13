local o = vim.o
local g = vim.g

-- General stuff
o.number = true
o.relativenumber = true
o.autoindent = true

o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.smartindent = true

o.expandtab = true

-- Make clipboard work with neovim
o.clipboard = 'unnamedplus'

-- Case insensitive search
o.ignorecase = true
o.smartcase = true

-- Enable mouse
o.mouse = 'a'

-- Enable termguicolors
o.termguicolors = true

-- Use space for leader key
g.mapleader = " "

-- Disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Timeout length (Time in milliseconds to wait for a mapped sequence to complete.)
o.timeoutlen = 500


-- leader
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
vim.opt.number = true
vim.opt.relativenumber = true

-- colors
vim.opt.termguicolors = true

-- configure tabs
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = true

-- clear all occurrences
vim.keymap.set('n', '<leader><leader>', '<CMD>nohl<CR>')

-- system clipboard
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>y', '"+yy')
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('v', '<leader>p', '"+p')

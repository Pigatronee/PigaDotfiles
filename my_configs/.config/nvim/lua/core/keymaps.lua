vim.g.mapleader = " "
vim.g.maplocalleader= " "

vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.laststatus = 2 
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- Tabs and spaces stuff
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Window navigation
-- Move between windows with Ctrl + Arrow keys
vim.keymap.set('n', '<A-Left>',  '<C-w>h')
vim.keymap.set('n', '<A-Down>',  '<C-w>j')
vim.keymap.set('n', '<A-Up>',    '<C-w>k')
vim.keymap.set('n', '<A-Right>', '<C-w>l')


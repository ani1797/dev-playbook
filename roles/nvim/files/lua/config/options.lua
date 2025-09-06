-- Neovim options for UI and editing behavior
-- Loads before plugins and keymaps

local opt = vim.opt

-- Show absolute line numbers
opt.number = true
-- Show relative line numbers
opt.relativenumber = true
-- Set tabstop, shiftwidth, and expandtab for 2-space tabs
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true


vim.o.signcolumn = 'yes'
vim.o.wrap = false
vim.o.hlsearch = false
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.mouse = 'nvi'
vim.o.swapfile = false
vim.o.completeopt = 'menu,menuone,noinsert'

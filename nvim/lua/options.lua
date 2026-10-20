vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- vim.g.have_nerd_font = false

vim.opt.cmdheight = 0

vim.opt.number = true
vim.opt.relativenumber = true

-- vim.opt.mouse = 'a' -- uncomment to enable mouse support

vim.opt.showmode = false -- Dont show current mode, statusline already shows it

-- Sync clipboard between OS and Neovim
vim.schedule(function() vim.opt.clipboard = 'unnamedplus' end)

vim.opt.breakindent = true

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 250
vim.opt.timeoutlen = 500

-- configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- on substitution commands show a preview window (try with :%s)
vim.opt.inccommand = 'split'

vim.opt.cursorline = true
vim.opt.scrolloff = 10

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})

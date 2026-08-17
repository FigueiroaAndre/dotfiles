-- NOTE: INSTALL 'lazy.nvim' PLUGIN MANAGER ###
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- NOTE: CONFIGURE PLUGINS ###
require('lazy').setup {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Autoclosing tags
  'windwp/nvim-ts-autotag',
  require 'plugins.autopairs',

  -- Git integration: shows git changes in the sign column
  -- require 'plugins.gitsigns',
  'tpope/vim-fugitive',

  -- Displays available keybindings in a popup
  require 'plugins.which-key',

  -- Fuzzy finder for files, buffers, and more
  require 'plugins.telescope',

  -- Enhanced Lua development experience
  require 'plugins.lazydev',

  -- LSP configuration for language server support
  require 'plugins.nvim-lspconfig',

  -- Formatting and linting integration
  require 'plugins.conform',

  -- Completion engine for code suggestions
  require 'plugins.blink-cmp',

  -- Highlight and manage TODO comments
  require 'plugins.todo-comments',

  -- Collection of small, useful Neovim plugins
  require 'plugins.mini',

  -- Treesitter-based syntax highlighting and code navigation
  require 'plugins.nvim-treesitter',

  -- Modern UI notifications and command line enhancements
  require 'plugins.noice',

  -- File explorer sidebar for Neovim
  require 'plugins.neo-tree',

  -- color schemes for Neovim
  require 'plugins.colortheme',
}

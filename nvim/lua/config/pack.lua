-- NOTE: NATIVE PLUGIN MANAGER (vim.pack, Neovim 0.12+) ###
-- Plugins are installed to `stdpath('data')/site/pack/core/opt` and pinned in
-- `nvim-pack-lock.json` (keep it under version control).
--   Update:  :lua vim.pack.update()   (review, then :write to apply or :quit to discard)
--   Remove:  delete the spec below, :restart, then :lua vim.pack.del { 'plugin-name' }
local gh = function(repo) return 'https://github.com/' .. repo end

-- NOTE: BUILD HOOKS ###
-- Must be registered before `vim.pack.add()` so they also run on first install
vim.api.nvim_create_autocmd('PackChanged', {
  group = vim.api.nvim_create_augroup('pack-build-hooks', { clear = true }),
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if kind ~= 'install' and kind ~= 'update' then return end

    if name == 'telescope-fzf-native.nvim' then
      local res = vim.system({ 'make' }, { cwd = ev.data.path }):wait()
      if res.code ~= 0 then vim.notify('telescope-fzf-native build failed:\n' .. res.stderr, vim.log.levels.ERROR) end
    end

    -- Parsers are installed by `plugins/nvim-treesitter.lua`; only refresh them on update
    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then vim.cmd.packadd 'nvim-treesitter' end
      vim.cmd 'TSUpdate'
    end
  end,
})

-- NOTE: INSTALL PLUGINS ###
local specs = {
  -- color schemes for Neovim
  { src = gh 'catppuccin/nvim', name = 'catppuccin' },

  -- Detect tabstop and shiftwidth automatically
  gh 'tpope/vim-sleuth',

  -- Autoclosing tags and pairs
  gh 'windwp/nvim-ts-autotag',
  gh 'windwp/nvim-autopairs',

  -- Git integration
  gh 'tpope/vim-fugitive',

  -- Displays available keybindings in a popup
  gh 'folke/which-key.nvim',

  -- Shared dependencies
  gh 'nvim-lua/plenary.nvim',
  gh 'MunifTanjim/nui.nvim',
  gh 'nvim-tree/nvim-web-devicons',

  -- Fuzzy finder for files, buffers, and more
  gh 'nvim-telescope/telescope.nvim',
  gh 'nvim-telescope/telescope-ui-select.nvim',

  -- Enhanced Lua development experience
  gh 'folke/lazydev.nvim',

  -- LSP configuration for language server support
  gh 'mason-org/mason.nvim',
  gh 'mason-org/mason-lspconfig.nvim',
  gh 'WhoIsSethDaniel/mason-tool-installer.nvim',
  gh 'j-hui/fidget.nvim',
  gh 'neovim/nvim-lspconfig',

  -- Formatting and linting integration
  gh 'stevearc/conform.nvim',

  -- Completion engine for code suggestions (release tag => pre-built fuzzy binary)
  { src = gh 'saghen/blink.cmp', version = vim.version.range '1.*' },
  gh 'rafamadriz/friendly-snippets',

  -- Highlight and manage TODO comments
  gh 'folke/todo-comments.nvim',

  -- Collection of small, useful Neovim plugins
  { src = gh 'nvim-mini/mini.nvim', version = vim.version.range '*' },

  -- Treesitter-based syntax highlighting and code navigation
  { src = gh 'nvim-treesitter/nvim-treesitter', version = 'main' },

  -- Modern UI notifications and command line enhancements
  gh 'folke/noice.nvim',
  gh 'rcarriga/nvim-notify',

  -- File explorer sidebar for Neovim
  { src = gh 'nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
}

-- Native fzf sorter for telescope (needs `make` to build)
if vim.fn.executable 'make' == 1 then table.insert(specs, gh 'nvim-telescope/telescope-fzf-native.nvim') end

vim.pack.add(specs)

-- NOTE: CONFIGURE PLUGINS ###
require 'plugins.colortheme'
require('nvim-ts-autotag').setup()
require 'plugins.autopairs'
require 'plugins.which-key'
require 'plugins.telescope'
require 'plugins.lazydev'
require 'plugins.blink-cmp'
require 'plugins.nvim-lspconfig'
require 'plugins.conform'
require 'plugins.todo-comments'
require 'plugins.mini'
require 'plugins.nvim-treesitter'
require 'plugins.noice'
require 'plugins.neo-tree'

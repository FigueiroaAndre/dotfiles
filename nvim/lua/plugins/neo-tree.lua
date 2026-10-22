-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

require('neo-tree').setup {
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
    },
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
}

vim.keymap.set('n', '<leader>bb', ':Neotree reveal=true position=right toggle=true<CR>', { desc = 'NeoTree reveal', silent = true })
vim.keymap.set('n', '<leader>bo', ':Neotree reveal=true position=right<CR>', { desc = 'NeoTree reveal', silent = true })

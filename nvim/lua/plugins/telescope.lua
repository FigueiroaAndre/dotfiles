require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      'node_modules/',
      'coverage/',
      'bin/',
      'obj/',
      '.git/',
      '.angular/',
      '.venv/',
      '.dist/',
      '__pycache__',
    },
    mappings = {
      i = {
        ['<C-y>'] = function(prompt_bufnr)
          local entry = require('telescope.actions.state').get_selected_entry()
          local filepath = entry.path or entry.filename
          vim.fn.setreg('+', filepath)
          require('telescope.actions').close(prompt_bufnr)
        end,
        ['<C-i>'] = function(prompt_bufnr)
          local entry = require('telescope.actions.state').get_selected_entry()
          local filepath = entry.path or entry.filename
          require('telescope.actions').close(prompt_bufnr)
          vim.api.nvim_put({ filepath }, 'c', true, true)
        end,
      },
    },
  },
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown(),
    },
  },
}
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')
local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', '<cmd>Telescope find_files hidden=true no_ignore=true<CR>', { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader>s/', function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[S]earch [/] in Open Files' })
vim.keymap.set('n', '<leader>sn', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })

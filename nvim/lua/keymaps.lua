-- NOTE: Some mappings are defined in the plugin configuration files.

local map = function(keys, func, desc, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, func, { desc = desc })
end

-- Toggle Text Wrap
map('<leader>tw', '<cmd>set invwrap<CR>', '[T]oggle text [W]rap')

-- Remove search highlight when pressing ESC in Normal Mode
-- Remove search highlight when pressing ESC in Normal Mode
map('<Esc>', '<cmd>nohlsearch<CR>', 'Remove search highlight')

-- Diagnostic keymaps
map('<leader>dp', vim.diagnostic.goto_prev, 'Go to [P]revious [D]iagnostic message')
map('<leader>dn', vim.diagnostic.goto_next, 'Go to [N]ext [D]iagnostic message')
map('<leader>de', vim.diagnostic.open_float, 'Show [D]iagnostic [E]rror messages')
map('<leader>dq', vim.diagnostic.setloclist, 'Open [D]iagnostic [Q]uickfix list')

-- Split keymaps
-- Split keymaps
map('<leader>-', '<cmd>split<CR>', 'Split Horizontally')
map('<leader>|', '<cmd>vsplit<CR>', 'Split Vertically')
map('<c-left>', '<cmd>vertical resize -1<CR>', 'Reduce window width')
map('<c-right>', '<cmd>vertical resize +1<CR>', 'Grow window width')
map('<c-up>', '<cmd>horizontal resize +1<CR>', 'Grow window height')
map('<c-down>', '<cmd>horizontal resize -1<CR>', 'Reduce window height')

-- Exit terminal mode (may not work in tmux)
map('<Esc><Esc>', '<C-\\><C-n>', 'Exit terminal mode', 't')

-- Move line arrow/below
map('<up>', '<cmd>m -2"<CR>', '')
map('<down>', '<cmd>m +1"<CR>', '')

-- Window Navigation
map('<C-h>', '<C-w><C-h>', 'Move focus to the left window')
map('<C-l>', '<C-w><C-l>', 'Move focus to the right window')
map('<C-j>', '<C-w><C-j>', 'Move focus to the lower window')
map('<C-k>', '<C-w><C-k>', 'Move focus to the upper window')

-- Telescope (EXTRAS)
map('<leader>st', '<cmd>TodoTelescope<CR>', '[S]earch for [T]odo comments')

-- Git
-- map('<leader>gtb', '<cmd>Gitsigns toggle_current_line_blame<CR>', 'Git [T]oggle [B]lame')
-- map('<leader>gtd', '<cmd>Gitsigns toggle_deleted<CR>', 'Git [T]oggle [D]eleted lines')

map('<leader>gd', '<cmd>Gvdiffsplit<CR>', '[G]it [D]iff')
-- map('<leader>gp', '<cmd>Gitsigns nav_hunk prev<CR>', 'Jump [P]revieus Hunk')
-- map('<leader>gn', '<cmd>Gitsigns nav_hunk next<CR>', 'Jump [N]ext Hunk')
-- map('<leader>gH', '<cmd>Gitsigns stage_hunk<CR>', '[G]it [H]unk stage')
-- map('<leader>gU', '<cmd>Gitsigns undo_stage_hunk<CR>', '[G]it [U]ndo Hunk stage')

map('<leader>gs', '<cmd>Git<CR>', '[G]it [S]tatus')
-- map('<leader>ga', '<cmd>Gwrite<CR>', 'Git [A]dd (Stage current file)')
-- map('<leader>gc', '<cmd>Gvdiffsplit!<CR>', 'Split view for [G]it [C]onflicts')
map('<leader>gl', '<cmd>Git log --oneline<CR>', '[G]it [L]og Oneline')
-- map('<leader>gL', '<cmd>Git log<CR>', '[G]it [L]og')
-- map('<leader>gb', '<cmd>Telescope git_branches<CR>', 'Git [B]ranches')

-- Dismiss Noice Notification
map('<leader>nd', '<cmd>NoiceDismiss<CR>', '[D]ismiss [N]otifications')

-- Show Noice Notification history
map('<leader>ns', '<cmd>Noice<CR>', '[S]how [N]otifications')

-- Markdown preview via leaf (TUI)
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('leaf-markdown-preview', { clear = true }),
  pattern = 'markdown',
  callback = function(event)
    local map_leaf = function(keys, split_cmd, desc)
      vim.keymap.set('n', keys, function()
        local file = vim.fn.shellescape(vim.fn.expand '%')
        vim.cmd((split_cmd and split_cmd .. ' | ' or '') .. 'terminal leaf ' .. file)
        vim.cmd 'startinsert'
      end, { buffer = event.buf, desc = desc })
    end

    -- [M]ark[d]own preview, [S]plit: open leaf in a new vertical split
    map_leaf('<leader>mds', 'vsplit', '[M]ark[d]own preview, [S]plit (leaf)')

    -- [M]ark[d]own preview, [F]ocus: leaf takes over the current window
    map_leaf('<leader>mdf', nil, '[M]ark[d]own preview, [F]ocus (leaf)')
  end,
})

-- Format
map(
  '<leader>f',
  function()
    require('conform').format {
      lsp_format = 'fallback',
      async = false,
      timeout_ms = 500,
    }
  end,
  '[F]ormat file or range',
  { 'n', 'v' }
)

-- Uses `nui.nvim`, and `nvim-notify` for the notification view
-- (if not available, noice falls back to `mini`)
require('noice').setup {
  routes = {
    -- jdtls reports "Validate documents"/"Publish Diagnostics" progress on every keystroke
    {
      filter = {
        event = 'lsp',
        kind = 'progress',
        cond = function(message)
          local client = vim.tbl_get(message.opts, 'progress', 'client')
          return client == 'jdtls'
        end,
      },
      opts = { skip = true },
    },
  },
}

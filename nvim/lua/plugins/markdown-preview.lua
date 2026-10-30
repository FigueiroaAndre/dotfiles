-- Keep the browser tab open when leaving the markdown buffer (default is to close it)
vim.g.mkdp_auto_close = 0

-- `:MarkdownPreview` is buffer-local to markdown files, so map the key there only
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('markdown-preview-keymap', { clear = true }),
  pattern = 'markdown',
  callback = function(ev)
    vim.keymap.set('n', '<leader>pp', '<cmd>MarkdownPreview<CR>', { buffer = ev.buf, desc = 'Markdown [P]review [P]lay' })
    vim.keymap.set('n', '<leader>pd', '<cmd>MarkdownPreviewStop<CR>', { buffer = ev.buf, desc = 'Markdown [P]review [D]own' })
  end,
})

-- `:MarkdownPreview` is buffer-local to markdown files, so map the key there only
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('markdown-preview-keymap', { clear = true }),
  pattern = 'markdown',
  callback = function(ev)
    vim.keymap.set('n', '<leader>p', '<cmd>MarkdownPreview<CR>', { buffer = ev.buf, desc = 'Markdown [P]review' })
  end,
})

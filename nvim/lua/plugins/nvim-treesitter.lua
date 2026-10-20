-- NOTE: this targets the `main` branch of nvim-treesitter, which no longer reads
-- `opts.ensure_installed`/`highlight`/`indent`. Parsers are installed with `.install()`
-- and highlighting/indent are started per filetype.
return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    -- supported values:
    -- https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md
    local parsers = {
      'bash',
      'c',
      'diff',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'vim',
      'vimdoc',
      'c_sharp',
      'json',
      'python',
      'javascript',
      'typescript',
      'tsx',
      'angular',
      'scss',
      'css',
    }
    require('nvim-treesitter').install(parsers)

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('treesitter-start', { clear = true }),
      callback = function(event)
        local lang = vim.treesitter.language.get_lang(event.match)
        if not lang then return end
        -- install on demand (replaces `auto_install`), then start once available
        if not pcall(vim.treesitter.start, event.buf, lang) then
          if vim.list_contains(require('nvim-treesitter').get_available(), lang) then
            require('nvim-treesitter').install(lang):await(function()
              if vim.api.nvim_buf_is_valid(event.buf) then pcall(vim.treesitter.start, event.buf, lang) end
            end)
          end
          return
        end
        vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}

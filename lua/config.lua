local chat_env = require 'creds'

require("codecompanion").setup({
  strategies = {
    chat = {
      adapter = "status200",
    },
    inline = {
      adapter = "status200",
    },
    cmd = {
      adapter = "status200",
    }
  },
  adapters = {
    status200 = function()
      return require("codecompanion.adapters").extend("openai_compatible", {
        env = chat_env,
        schema = {
          model = {
            default = "anthropic/claude-3.7-sonnet:beta"
          }
        },
      })
    end,
  },
})

require('go').setup({
  -- Enable gopls
  lsp_cfg = {
    capabilities = capabilities,
  },
  -- Configure key mappings
  lsp_keymaps = true, -- Set to true to use default LSP keymaps
})


require('telescope').setup {
  defaults = {
    -- File ignore patterns
    file_ignore_patterns = {
      "node_modules",
      ".git/",
      "target/",
      "vendor/",
      "js-vendor/",
      "%.png$", "%.jpg$", "%.jpeg$", "%.gif$", "%.ico$",
      "%.pdf$", "%.zip$", "%.tar$", "%.gz$", "%.bz2$", "%.xz$",
      "%.bin$", "%.exe$", "%.dll$", "%.so$", "%.pyc$",
      "%.class$", "%.o$", "%.a$", "%.obj$",
    },
  }
}

require('render-markdown').setup({
  file_types = { "markdown", "codecompanion" }
})

local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Set up lspconfig.
require 'lspconfig'.zls.setup{
  capabilities = capabilities
}

local lspconfig = require("lspconfig")

-- Example: Python
lspconfig.pyright.setup({})

-- Example: Go
lspconfig.gopls.setup({})

-- Example: Lua (neovim config itself)
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
    },
  },
})


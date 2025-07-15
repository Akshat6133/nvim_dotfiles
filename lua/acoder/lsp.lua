local lspconfig = require("lspconfig")
local mason = require('mason').setup()
require('mason-lspconfig').setup({
-- ensure_installed = {'pyright',  'lua_ls'},
--})
--
---- Example: Python
--lspconfig.pyright.setup({})
--
---- Example: Go
--lspconfig.gopls.setup({})
--
---- Example: Lua (neovim config itself)
--lspconfig.lua_ls.setup({
--  settings = {
--    Lua = {
--      diagnostics = { globals = { "vim" } },
--    },
--  },
})


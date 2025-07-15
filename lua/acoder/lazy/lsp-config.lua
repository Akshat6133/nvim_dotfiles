return 
-- somewhere inside your Lazy setup
{
  "neovim/nvim-lspconfig",
  config = function()
    require("acoder.lsp") -- or wherever your LSP config is
  end,
}


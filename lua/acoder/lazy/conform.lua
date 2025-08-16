--return {
--  "stevearc/conform.nvim",
--  event = { "BufWritePre" }, -- lazy-load on format trigger
--  config = function()
--    require("conform").setup({
----      format_on_save = {
----        lsp_fallback = true,
----        timeout_ms = 500,
----      },
--      formatters_by_ft = {
--        lua = { "stylua" },
--        python = { "black" },
--      },
--    })
--
--    -- Optional keymap to manually format
--    vim.keymap.set("n", "<leader>f", function()
--      require("conform").format({ async = true, lsp_fallback = true })
--    end, { desc = "Format buffer" })
--  end,
--}

return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                go = { "gofmt" },
				python = {"black"},
            }
        })
    vim.keymap.set("n", "<leader>f", function()
      require("conform").format({ async = true, lsp_fallback = true })
    end, { desc = "Format buffer" })
    end,
}


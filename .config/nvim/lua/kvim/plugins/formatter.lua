return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "black" },
        -- Use a sub-list to run only the first available formatter
        javascript = { "prettierd", "prettier" },
        c = { "clangd_format" },
        cpp = { "clangd_format" },
        typescript = { "prettierd", "prettier" },
        typescriptreact = { "prettierd", "prettier" },
        css = { "prettierd", "prettier" },
        json = { "fixjson" },
      },

      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })
  end,
}

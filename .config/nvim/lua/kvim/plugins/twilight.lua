-- Lua
return {
  {
    "folke/twilight.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    config = function()
      local keymap = vim.keymap
      keymap.set("n", "<leader>tw", "<cmd>Twilight<CR>")
    end,
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    config = function()
      local keymap = vim.keymap
      keymap.set("n", "<leader>tz", "<cmd>ZenMode<CR>")
    end,
  },
}
-- https://github.com/folke/twilight.nvim?tab=readme-ov-file

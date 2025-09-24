return {
  "smjonas/inc-rename.nvim",
  config = function()
    require("inc_rename").setup()
    vim.keymap.set("n", "<leader><F2>", function()
      return ":IncRename " .. vim.fn.expand("<cword>")
    end, { expr = true, desc = "rename symbol under cursor" })
  end,
}

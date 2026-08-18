-- Review the working tree in the editor before accepting agent changes.

-- True on/off: closes an open view no matter which tab it lives in.
local function toggle_diffview()
  local ok, lib = pcall(require, "diffview.lib")
  if not ok then
    vim.cmd("DiffviewOpen")
    return
  end

  for _, view in ipairs(lib.views) do
    if view.tabpage and vim.api.nvim_tabpage_is_valid(view.tabpage) then
      vim.api.nvim_set_current_tabpage(view.tabpage)
      vim.cmd("DiffviewClose")
      return
    end
  end

  vim.cmd("DiffviewOpen")
end

return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewToggleFiles" },
  keys = {
    { "<leader>dd", toggle_diffview, desc = "Diff: toggle working tree vs HEAD" },
    { "<leader>dc", "<cmd>DiffviewClose<cr>", desc = "Diff: close" },
    { "<leader>dh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diff: history of this file" },
    { "<leader>dH", "<cmd>DiffviewFileHistory<cr>", desc = "Diff: history of repo" },
    { "<leader>dm", "<cmd>DiffviewOpen origin/main...HEAD<cr>", desc = "Diff: branch vs origin/main" },
  },
  opts = {
    enhanced_diff_hl = true,
    view = {
      default = { layout = "diff2_horizontal" },
      merge_tool = { layout = "diff3_horizontal", disable_diagnostics = true },
      file_history = { layout = "diff2_horizontal" },
    },
    file_panel = {
      listing_style = "tree",
      win_config = { position = "left", width = 32 },
    },
    keymaps = {
      view = {
        { "n", "<leader>dc", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
      },
      file_panel = {
        { "n", "<leader>dc", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
      },
    },
  },
}

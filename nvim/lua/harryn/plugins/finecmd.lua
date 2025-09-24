return {
  'VonHeikemen/fine-cmdline.nvim',
  dependencies = {'MunifTanjim/nui.nvim'},
  config = function()
    local keymap = vim.keymap
    vim.api.nvim_set_keymap('n', '<leader><CR>', '<cmd>FineCmdline<CR>', {noremap = true, desc="Floating CMD"})
  end
}

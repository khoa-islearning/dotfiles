return {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
-- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    -- KEYMAP
    local keymap = vim.keymap
    keymap.set('n', '<leader>tf', builtin.find_files, {desc = "find files"})
    keymap.set('n', '<leader>tg', builtin.live_grep, {desc = "live grep by string"})
--     keymap.set('n', '<leader>ts', function()
--       builtin.grep_string({search = vim.fn.input("telescope, find string: ")})
--     end
--     )
  end,
}

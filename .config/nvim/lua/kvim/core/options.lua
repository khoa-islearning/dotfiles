local opt = vim.opt

-- turn on warp line
opt.wrap = false

-- line numbers
opt.relativenumber = false
opt.number = true

-- tab & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true -- expand tabs to spaces
opt.autoindent = true -- copy indent from prev line

-- search settings
opt.ignorecase = true -- ignorecase when searching
opt.smartcase = true -- if mixed case, use case-sensitive

-- cursore line
opt.cursorline = false

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- conceal
opt.conceallevel = 2

-- use terminal background instead of theme background
local function clear_bg()
  vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" })
end
vim.api.nvim_create_autocmd("ColorScheme", { callback = clear_bg })
vim.api.nvim_create_autocmd("VimEnter", { callback = clear_bg })

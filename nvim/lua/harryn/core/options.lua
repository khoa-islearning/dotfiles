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

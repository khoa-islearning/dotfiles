-- set leader key
vim.g.mapleader = " "

local keymap = vim.keymap

-- General keymaps

-- Exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- window mangement
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- move lines
keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" }) -- move line up
keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" }) -- move line down
keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" }) -- move line up
keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" }) -- move line down
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up" }) -- move line up
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down" }) -- move line down

-- copy line up/down
keymap.set("n", "<C-K>", "yyp", { desc = "Clone line" })
keymap.set("i", "<C-K>", "<Esc>yypi", { desc = "Clone line" })

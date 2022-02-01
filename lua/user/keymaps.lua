local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Map leader to space
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic
keymap("n", "r", ":redo<CR>", opts)
keymap("n", "<leader>so", ":so %<CR>", opts)

keymap("n", "-", "<C-W>-", opts)
keymap("n", "+", "<C-W>+", opts)
keymap("n", "<", "<C-W><", opts)
keymap("n", ">", "<C-W>>", opts)

keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>x", ":xa<CR>", opts)
keymap("n", "<leader>h", ":wincmd h<CR>", opts)
keymap("n", "<leader>j", ":wincmd j<CR>", opts)
keymap("n", "<leader>k", ":wincmd k<CR>", opts)
keymap("n", "<leader>l", ":wincmd l<CR>", opts)
keymap("n", "<leader>=", ":wincmd =<CR>", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("t", "<Esc>", "<C-\\><C-N>", opts)

-- Project tree
keymap("n", "<leader>pt", ":Lex 20<CR>", opts)

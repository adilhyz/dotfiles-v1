local keymap = vim.keymap.set
local builtin = require("telescope.builtin")

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Quit Neovim
keymap("n", "<leader>q", ":q<cr>", { desc = "Quit Neovim", remap = true })

-- Save current file
keymap("n", "<C-s>", ":w<cr>", { desc = "Save file", remap = true })

-- Find File
keymap("n", "<C-p>", function()
    builtin.find_files({ hidden = true, follow = true })
end, { desc = "Find files" })

-- Increment/decrement
keymap("n", "+", "<C-x>", { desc = "Increment numbers", noremap = true })
keymap("n", "-", "<C-z>", { desc = "Decrement numbers", noremap = true })

-- Select all
keymap("n", "<C-a>", "gg<S-v>G", { desc = "Select all", noremap = true })

-- Replace Text
keymap("n", "<C-h>", ":%s/<Left>/<Left>/g", { desc = "Replace text (global)" })
keymap("n", "<C-d>", "*N", { desc = "Select next occurrence (VSCode-like)" })

-- Indenting
keymap("v", "<S-Left>", "<gv", { desc = "Indenting", silent = true, noremap = true })
keymap("v", "<S-Right>", ">gv", { desc = "Indenting", silent = true, noremap = true })

-- window management
keymap("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap("n", "<leader>sx", ":close<CR>") -- close current split window

-- New tab
keymap("n", "te", ":tabedit")
keymap("n", "<leader>tt", ":tabnew<CR>") -- open new tab
keymap("n", "<leader>tq", ":tabclose<CR>") -- close current tab
keymap("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- Git cli (fugitive)
keymap("n", "<C-.>", ":Git add .", { desc = "Git add all", noremap = true })
keymap("n", "<C-,>", ":Git commit -m '<Left>'", { desc = "Git commit", noremap = true})
keymap("n", "<C-/>", ":Git push origin master", { desc = "Git push", noremap = true })

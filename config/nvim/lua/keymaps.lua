local keymap = vim.keymap.set
local exec = vim.cmd.exec
local cmd = vim.cmd
-- local builtin = require("telescope.builtin")
-- local builtin = require("plugins.telescope")
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local function duplicate(direction)
	local mode = vim.fn.mode()
	local actions = {
		["v"] = { down = "normal! y`>p", up = "normal! y`<P" },
		["V"] = { down = "normal! y`>p", up = "normal! y`<P" },
		["default"] = { down = "t .", up = "t -1" },
	}
	local act = actions[mode] or actions["default"]
	cmd(act[direction])
end

-- Quit Neovim
keymap("n", "<leader>q", ":q<cr>", { desc = "Quit Neovim", remap = true })
keymap("n", "<C-q>", "<cmd>quit<CR>", { noremap = true, silent = true })
keymap("v", "<C-q>", "<cmd>quit<CR>", { noremap = true, silent = true })
keymap("i", "<C-q>", "<cmd>quit<CR>", { noremap = true, silent = true })
keymap("c", "<C-q>", "<cmd>quit<CR>", { noremap = true, silent = true })
keymap("i", "<RightMouse>", "<cmd>popup! PopUp<cr>", { noremap = true, silent = true })
keymap("v", "<RightMouse>", "<C-\\><C-g>gv<cmd>popup! PopUp<cr>", { noremap = true, silent = true })

-- Menu Neovim
keymap({ "n", "v" }, "<RightMouse>", function()
	require('menu.utils').delete_old_menus()
	exec '"normal! \\<RightMouse>"'
	local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
	local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

	require("menu").open(options, { mouse = true })
end, {})

-- Find File
keymap("n", "<C-p>", function()
	require("telescope.builtin").find_files({ hidden = true, follow = true })
end, { desc = "Find files" })

-- Duplicate line (Ctrl+Shift+Up/Down)
keymap({ "n", "i", "v" }, "<C-S-Up>", "<Esc>yyP`^a", { noremap = true, silent = true, desc = "Duplicate line up" })
keymap({ "n", "i", "v" }, "<C-S-Down>", function()
	duplicate("down")
end, { silent = true, desc = "Duplicate line down" })
keymap({ "n", "i", "v" }, "<C-S-Up>", function()
	duplicate("up")
end, { silent = true, desc = "Duplicate line up" })


-- For Normal mode MAINTENENCE
keymap("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })

-- For Visual mode (MAINTENENCE)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- Comment code
keymap("n", "<C-/>", "gcc", { desc = "toggle comment", remap = true })
keymap("v", "<C-/>", "gc", { desc = "toggle comment", remap = true })
keymap("i", "<C-/>", "<ESC>gc", { desc = "toggle comment", remap = true })

-- Increment/decrement
-- keymap("n", "+", "<C-x>", { desc = "Increment numbers", noremap = true })
-- keymap("n", "-", "<C-z>", { desc = "Decrement numbers", noremap = true })

-- Save current file (Ctrl+s)
keymap("n", "<C-s>", ":w<cr>", { desc = "Save file", remap = true })

-- Select all (Ctrl+A)
keymap("n", "<C-a>", "gg<S-v>G", { desc = "Select all", noremap = true })

-- Mapping for copy (ctrl+c)
keymap('n', '<C-c>', '"+y', { noremap = true, silent = true })
keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })
keymap('i', '<C-c>', '<ESC>"+y', { noremap = true, silent = true })
keymap('c', '<C-c>', '<C-c>"+y', { noremap = true, silent = true })

-- Mapping for paste (CTRL V)
keymap('n', '<C-v>', '"+p', { noremap = true, silent = true })
keymap('v', '<C-v>', '"+p', { noremap = true, silent = true })
keymap('i', '<C-v>', '<ESC>"+pa', { noremap = true, silent = true })
keymap('c', '<C-v>', '<C-c>"+p', { noremap = true, silent = true })

-- Mapping to cut (ctrl+x)
keymap('n', '<C-x>', '"+x', { noremap = true, silent = true })
keymap('v', '<C-x>', '"+x', { noremap = true, silent = true })
keymap('i', '<C-x>', '<ESC>"+x', { noremap = true, silent = true })
keymap('c', '<C-x>', '<C-c>"+x', { noremap = true, silent = true })

-- Mapping for Undo (Ctrl+Z)
keymap('', '<C-z>', '<cmd>undo<CR>', { noremap = true, silent = true })
keymap('i', '<C-z>', '<cmd>undo<CR>', { noremap = true, silent = true })

-- Mapping for redo (Ctrl+y)
keymap('', '<C-y>', '<cmd>redo<CR>', { noremap = true, silent = true })
keymap('i', '<C-y>', '<cmd>redo<CR>', { noremap = true, silent = true })

-- Mapping to select text in insertion mode
keymap('i', '<S-Left>', '<C-o>v', { noremap = true, silent = true })
keymap('i', '<S-Right>', '<C-o>ve', { noremap = true, silent = true })
keymap('i', '<S-Up>', '<C-o>v<Up>', { noremap = true, silent = true, desc = 'Select up' })
keymap('i', '<S-Down>', '<C-o>v<Down>', { noremap = true, silent = true, desc = 'Select down' })
keymap('i', '<S-Home>', '<C-o>v0', { noremap = true, silent = true, desc = 'Select to line start' })
keymap('i', '<S-End>', '<C-o>v$', { noremap = true, silent = true, desc = 'Select to line end' })
keymap('i', '<S-PageUp>', '<C-o>v<C-u>', { noremap = true, silent = true, desc = 'Select page up' })
keymap('i', '<S-PageDown>', '<C-o>v<C-d>', { noremap = true, silent = true, desc = 'Select page down' })

-- Replace Text
keymap("n", "<C-h>", ":%s/<Left>/<Left>/g", { desc = "Replace text (global)" })
keymap("n", "<C-d>", "*N", { desc = "Select next occurrence" })

-- Tab Key
keymap("v", "<Tab>", ">gv", { desc = "Indenting", silent = true, noremap = true })
keymap("v", "<S-Tab>", "<gv", { desc = "Indenting", silent = true, noremap = true })

-- window management split
keymap("n", "<leader>sv", "<C-w>v")
keymap("n", "<leader>sh", "<C-w>s")
keymap("n", "<leader>se", "<C-w>=")
keymap("n", "<leader>sx", ":close<CR>")

-- New tab
keymap("n", "te", ":tabedit")
keymap("n", "<leader>tt", ":tabnew<CR>")
keymap("n", "<leader>tq", ":tabclose<CR>")
keymap("n", "<leader>tn", ":tabn<CR>")
keymap("n", "<leader>tp", ":tabp<CR>")

-- nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Barbar
keymap("n", "<Tab>", ":BufferNext<CR>", { desc = "Move to next tab", noremap = true })
keymap("n", "<S-Tab>", ":BufferPrevious<CR>", { desc = "Move to previous tab", noremap = true })
keymap("n", "<leader>x", ":BufferClose<CR>", { desc = "Buffer close", noremap = true })
keymap("n", "<A-p>", ":BufferPin<CR>", { desc = "Pin buffer", noremap = true })

-- Git cli (fugitive)
keymap("n", "<C-.>", ":Git add .", { desc = "Git add all", noremap = true })
keymap("n", "<C-,>", ":Git commit -m '<Left>'", { desc = "Git commit", noremap = true})
keymap("n", "<C-;>", ":Git push origin master", { desc = "Git push", noremap = true })

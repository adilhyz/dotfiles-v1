local opt = vim.opt
local g = vim.g
local schedule = vim.schedule

opt.mouse = "a"
g.have_nerd_font = true
opt.relativenumber = true
opt.number = true
opt.autoindent = true
opt.wrap = true
opt.breakindent = true
opt.undofile = true

-- tabs & indentation
opt.expandtab = false
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.autoindent = true

-- Line wrapping
opt.wrap = false

-- Search setting
opt.ignorecase = true
opt.smartcase = true

-- Cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard 
schedule(function()
  opt.clipboard = 'unnamedplus'
end)

-- Splitt Windows
opt.splitright = true
opt.splitbelow = true
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.inccommand = 'split'
opt.scrolloff = 10

opt.confirm = true
opt.iskeyword:append("-")

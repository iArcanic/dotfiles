vim.g.mapleader = " "

-- Encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.scriptencoding = "utf-8"

-- UI
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.title = true
vim.opt.laststatus = 3 -- Global statusline
vim.opt.cmdheight = 0 -- Minimal command line height
vim.opt.cursorline = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.termguicolors = true

-- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.inccommand = "split"

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Scrolling & Cursor
vim.opt.scrolloff = 8 -- Keep 8 lines visible when scrolling
vim.opt.sidescrolloff = 8
vim.opt.splitkeep = "cursor"

-- Wrapping & Formatting
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.formatoptions:append("r") -- Add asterisks in block comments

-- File Navigation
vim.opt.path:append("**") -- Recursive file search
vim.opt.wildignore:append("*/node_modules/*")

-- Performance
vim.opt.updatetime = 250 -- Faster UI response
vim.opt.timeoutlen = 500 -- Reduce key timeout delay

return {}

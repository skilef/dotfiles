local opt = vim.opt

-- Set highlight on search
opt.hlsearch = true

-- Show line numbers
opt.number = true

-- Show relative line numbers
opt.relativenumber = true

-- Disable mouse
opt.mouse = ""

-- Wrapped lines will be indented
opt.breakindent = true

-- Save undo history after closing the buffer
opt.undofile = true

-- Ignore case on search
opt.ignorecase = true

-- But if I search with some upper case letter, it means I want an exact match
opt.smartcase = true

-- Decrease update time
opt.updatetime = 250

-- Always show the sign column (to the left of the line numbers)
opt.signcolumn = 'yes'

-- Integrate the system clipboard with NeoVim
opt.clipboard = 'unnamedplus'

-- On auto-complete, show a menu even for one result and do not select the first result automatically
opt.completeopt = 'menuone,noselect'

-- <space> is the leader key
vim.g.mapleader = ' '


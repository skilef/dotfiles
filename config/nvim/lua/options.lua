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
-- opt.completeopt = 'menuone,noselect'

-- Tab is written in spaces
opt.expandtab = true

-- Tab width is 4
opt.tabstop = 4

-- Indent width is 4
opt.shiftwidth = 4

-- Smart indentation on a newline
opt.smartindent = true

-- Show whitespace characters
opt.list = true

-- <space> is the leader key
vim.g.mapleader = ' '


-- Diagnostic signs
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local keymap = vim.keymap.set

-- Insert --
keymap("i", "jj", "<Esc>", {noremap=false})

-- Normal --
keymap("n", "<leader>h", ":nohlsearch<cr>", { silent = true, desc = "Remove search highlight" }) -- Remove search highlight
keymap("n", "<leader>q", ":q<cr>", { silent = true, desc = "Quit" })                             -- Quit
keymap("n", "<leader>w", ":w<cr>", { silent = true, desc = "Save" })                             -- Write
keymap("n", "x", "\"_x", { silent = true, desc = "Delete without yanking" })                     -- Delete without yanking

keymap("n", "<leader>o", "o<Esc>", { silent = true, desc = "New line below" })                   -- New line below
keymap("n", "<leader>O", "O<Esc>", { silent = true, desc = "New line above" })                   -- New line above

keymap('n', '<leader>gg', '<cmd>LazyGit<CR>')

keymap("n", "<C-n>", "<cmd>Neotree toggle<CR>", { silent = true, desc = "Toggle file tree" })

-- Better window navigation
-- navigate buffers
keymap("n", "<tab>", ":bnext<cr>", { silent = true, desc = "Next buffer" })           -- Next buffer
keymap("n", "<s-tab>", ":bprevious<cr>", { silent = true, desc = "Previous buffer" }) -- Previous buffer

-- move text up and down
keymap("n", "<a-j>", ":m .+1<cr>==", { silent = true, desc = "Move line down" }) -- Alt-j
keymap("n", "<a-k>", ":m .-2<cr>==", { silent = true, desc = "Move line up" })   -- Alt-k

-- visual --
-- stay in indent mode
keymap("v", "<", "<gv", { silent = true, desc = "Left Indentation" })  -- Left Indentation
keymap("v", ">", ">gv", { silent = true, desc = "Right Indentation" }) -- Right Indentation

-- move text up and down
keymap("v", "<a-j>", ":m '>+1<cr>gv=gv", { silent = true, desc = "Move line down" }) -- Alt-j
keymap("v", "<a-k>", ":m '<-2<cr>gv=gv", { silent = true, desc = "Move line up" })   -- Alt-k


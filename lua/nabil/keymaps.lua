local options = { noremap = true, silent = true }

local keymap = vim.keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", options)
keymap.set("n", "<leader>nv", ":so %<CR>", options)

-- window split and movement
keymap.set("n", "<C-v>", ":vsplit<cr>", options)
keymap.set("n", "<C-h>", ":split<cr>", options)

keymap.set("n", "<C-h>", "<C-w>h", options)
keymap.set("n", "<C-j>", "<C-w>j", options)
keymap.set("n", "<C-k>", "<C-w>k", options)
keymap.set("n", "<C-l>", "<C-w>l", options)
-- telescope
-- keymap.set('n', '<leader>ff', telescope.find_files, options)
-- keymap.set('n', '<leader>fg', telescope.git_files, options)
-- keymap.set('n', '<leader>fs', telescope.live_grep, options)

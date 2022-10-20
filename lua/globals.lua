
-- line numbers, columns etc.
vim.o.number = true
vim.o.relativenumber = true

-- Key Mappings
vim.g.mapleader = " "
key_opts = { noremap = true }

-- Map F1 to Esc as well, since we often hit it by mistake
vim.api.nvim_set_keymap('n', '<f1>', '<esc>', key_opts)

-- Remove ex-mode hotkey
vim.api.nvim_set_keymap('n', 'Q', '<nop>', key_opts)

-- Window pane navigation
vim.api.nvim_set_keymap('n', '<leader>q', ':quit<cr>', key_opts)
vim.api.nvim_set_keymap('n', '<leader>Q', ':qa!<cr>', key_opts)

vim.api.nvim_set_keymap('n', '<c-j>', '<c-w>j', key_opts)
vim.api.nvim_set_keymap('n', '<c-k>', '<c-w>k', key_opts)
vim.api.nvim_set_keymap('n', '<c-l>', '<c-w>l', key_opts)
vim.api.nvim_set_keymap('n', '<c-h>', '<c-w>h', key_opts)

-- Window Pane size
-- Maximize current window split
vim.api.nvim_set_keymap('n', '<c-o>', '<c-w>_ <c-w>|', key_opts)
-- Getting back to normal is simple enough with <c-w>=
-- So I'm not mapping a shortcut for that

-- Make j/k work nicely for wrapped lines
vim.api.nvim_set_keymap('n', 'j', 'gj', key_opts)
vim.api.nvim_set_keymap('n', 'k', 'gk', key_opts)

-- Easier tab navigation
vim.api.nvim_set_keymap('n', '<leader>n', ':tabprevious<cr>', key_opts)
vim.api.nvim_set_keymap('n', '<leader>m', ':tabnext<cr>', key_opts)

-- Bind keys for nohl
vim.api.nvim_set_keymap('n', '<c-n>', ':nohl<cr>', key_opts)
vim.api.nvim_set_keymap('i', '<c-n>', ':nohl<cr>', key_opts)
vim.api.nvim_set_keymap('v', '<c-n>', ':nohl<cr>', key_opts)

-- Code Indentation
vim.api.nvim_set_keymap('n', '<', '<gv', key_opts)
vim.api.nvim_set_keymap('n', '>', '>gv', key_opts)


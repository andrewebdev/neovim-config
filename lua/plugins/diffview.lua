-- Empty just now. can add some configs here later

-- Set up diffview keybinds
local key_opts = { noremap = true }

vim.api.nvim_set_keymap('n', '<leader>gd', ':DiffviewOpen<cr>', key_opts)
vim.api.nvim_set_keymap('n', '<leader>gD', ':DiffviewOpen master<cr>', key_opts)

local neogit = require('neogit')

neogit.setup {
  integrations = {
    diffview = true
  }
}

-- Set up neogit keybinds
local key_opts = { noremap = true }

vim.api.nvim_set_keymap('n', '<leader>gg', ':Neogit<cr>', key_opts)
vim.api.nvim_set_keymap('n', '<leader>gl', ':Neogit log<cr>', key_opts)
vim.api.nvim_set_keymap('n', '<leader>gp', ':Neogit push<cr>', key_opts)
vim.api.nvim_set_keymap('n', '<leader>gg', ':Neogit<cr>', key_opts)

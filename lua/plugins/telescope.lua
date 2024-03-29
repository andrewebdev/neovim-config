
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}

require('telescope').load_extension('fzf')


-- Telescope Specific Keybinds
local opts = { noremap = true }

-- Find files using Telescope command-line sugar.
vim.api.nvim_set_keymap('n', '<leader><space>', ':Telescope<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>p', ':Telescope find_files<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<cr>', opts)

-- Using Lua functions
-- vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require('telescope.builtin').find_files()<cr>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>lua require('telescope.builtin').live_grep()<cr>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>lua require('telescope.builtin').buffers()<cr>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require('telescope.builtin').help_tags()<cr>', opts)

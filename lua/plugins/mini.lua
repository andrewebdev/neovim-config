
-- Mini is a collection of small useful plugins

-- enhance the "around" and "inside" motions, auto pairs and smart surround
-- pairs
require('mini.ai').setup()
require('mini.pairs').setup()
require('mini.surround').setup()

-- Auto completion magic
-- require('mini.completion').setup()
-- NOTE: Cannot really use the above, since we a have a couple of other plugins
-- that depend on nvim-cmp

-- Clean indent scoping where you are
require('mini.indentscope').setup()

-- Statusline
require('mini.statusline').setup()

-- Trailing whitespace
require('mini.trailspace').setup()
-- TODO: Trim whitespace whenever a file is saved

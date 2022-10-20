local lspconfig = require'lspconfig'
local cmp = require'cmp'

local function custom_on_attach(client)
  print('Attaching to ' .. client.name)
  cmp.on_attach(client)
end

local default_config = {
  on_attach = custom_on_attach,
}

-- setup language servers here
lspconfig.tsserver.setup(default_config)

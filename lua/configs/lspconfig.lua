-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE - default server setups
local servers = { "html", "cssls", "jdtls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- credit to https://github.com/neovim/nvim-lspconfig/issues/500
local util = require "lspconfig/util"
local path = util.path

local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
  end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs { "*", ".*" } do
    local match = vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
    if match ~= "" then
      return path.join(path.dirname(match), "bin", "python")
    end
  end

  -- Fallback to system Python.
  return "python3"
end

lspconfig.pyright.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  before_init = function(_, config)
    config.settings.python.pythonPath = get_python_path(config.root_dir)
  end,
}

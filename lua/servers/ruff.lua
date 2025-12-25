-- servers/ruff.lua
return {
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    "ruff.toml",
    ".ruff.toml",
    "setup.py",
    "setup.cfg",
    ".git",
  },
  init_options = {
    settings = {
      args = {},
    },
  },
  on_attach = function(client, bufnr)
    -- Disable hover in favor of basedpyright
    client.server_capabilities.hoverProvider = false

    -- Call the shared on_attach
    require("utils.lsp").on_attach(client, bufnr)
  end,
}

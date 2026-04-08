-- lua/pack.lua

-- ─────────────────────────────────────────────────────────────
-- Auto build / update hooks
-- ─────────────────────────────────────────────────────────────
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local spec = ev.data.spec

    -- Treesitter: update parsers
    if spec.name == "nvim-treesitter" and ev.data.kind == "update" then
      if not ev.data.active then
        vim.cmd("packadd nvim-treesitter")
      end
      vim.cmd("TSUpdate")
    end

    -- telescope fzf native: build
    if spec.name == "telescope-fzf-native.nvim"
      and (ev.data.kind == "install" or ev.data.kind == "update")
    then
      vim.system({ "make" }, { cwd = spec.path })
    end
  end,
})

-- ─────────────────────────────────────────────────────────────
-- Normalize specs
-- ─────────────────────────────────────────────────────────────
local function normalize(spec)
  -- string → { src = "..." }
  if type(spec) == "string" then
    spec = { src = spec }
  end

  -- single spec → list
  if spec.src then
    spec.name = spec.name or spec.src:match(".*/(.*)")
    return { spec }
  end

  -- list of specs
  for _, s in ipairs(spec) do
    s.name = s.name or s.src:match(".*/(.*)")
  end

  return spec
end

-- ─────────────────────────────────────────────────────────────
-- Load plugin specs
-- ─────────────────────────────────────────────────────────────
local specs = {}
local plugins = {}

for fname, ftype in vim.fs.dir(vim.fn.stdpath("config") .. "/lua/plugins") do
  if ftype == "file" and fname:match("%.lua$") then
    local modname = "plugins." .. fname:gsub("%.lua$", "")
    local plug = require(modname)

    if plug and plug.spec then
      local normalized = normalize(plug.spec)

      for _, s in ipairs(normalized) do
        table.insert(specs, s)
        plugins[s.name] = plug
      end
    else
      vim.notify("plugins/" .. fname .. " missing .spec field", vim.log.levels.WARN)
    end
  end
end

-- ─────────────────────────────────────────────────────────────
-- Install plugins
-- ─────────────────────────────────────────────────────────────
vim.pack.add(specs)

-- ─────────────────────────────────────────────────────────────
-- Load plugins (CRITICAL FIX)
-- ─────────────────────────────────────────────────────────────
for _, spec in ipairs(specs) do
  vim.cmd("packadd " .. spec.name)
end

-- Optional built-ins
vim.cmd("packadd cfilter")
vim.cmd("packadd nvim.undotree")

-- ─────────────────────────────────────────────────────────────
-- Run setup()
-- ─────────────────────────────────────────────────────────────
for name, plug in pairs(plugins) do
  if plug.setup then
    local ok, err = pcall(plug.setup)
    if not ok then
      vim.notify("Error in " .. name .. " setup: " .. err, vim.log.levels.ERROR)
    end
  end
end

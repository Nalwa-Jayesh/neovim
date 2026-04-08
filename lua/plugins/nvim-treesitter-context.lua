return {
  spec = {
    src = "https://github.com/nvim-treesitter/nvim-treesitter-context",
  },

  setup = function()
    local ok, ts_context = pcall(require, "treesitter-context")
    if not ok then return end

    ts_context.setup({
      enable = true,
      multiwindow = false,
      max_lines = 0,
      min_window_height = 0,
      line_numbers = true,
      multiline_threshold = 20,
      trim_scope = "outer",
      mode = "cursor",
      separator = nil,
      zindex = 20,
      on_attach = nil,
    })
  end,
}

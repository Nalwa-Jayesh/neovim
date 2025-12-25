return {
  "benomahony/uv.nvim",
  -- Optional filetype to lazy load when you open a python file
  ft = { "python" },
  dependencies = { "nvim-telescope/telescope.nvim" },
  opts = {
    picker_integration = true,
  },
}

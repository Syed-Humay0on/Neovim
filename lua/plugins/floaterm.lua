return {
  {
    "nvzone/floaterm",
    dependencies = "nvzone/volt",
    opts = {
      border = false,
      size = { h = 60, w = 70 },
      mappings = { sidebar = nil, term = nil },
      terminals = {
        { name = "Terminal" },
        { name = "Neofetch", cmd = "neofetch" },
      },
    },
    keys = {
      { "<leader>ft", "<cmd>FloatermToggle<CR>", desc = "Toggle Floaterm" },
    },
    cmd = "FloatermToggle",
  },
}


return {
  "2kabhishek/nerdy.nvim",
  dependencies = {
    "folke/snacks.nvim",
    "nvim-telescope/telescope.nvim", -- explicitly ensure this is installed
  },
  opts = { ui = "telescope" },
  cmd = { "Nerdy", "NerdyRecents" },
  keys = {
    { "<leader>fn", "<cmd>Nerdy<CR>", desc = "Browse nerd icons" },
    { "<leader>fr", "<cmd>NerdyRecents<CR>", desc = "Browse recent nerd icons" },
  },
}

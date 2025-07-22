return {
  "2kabhishek/nerdy.nvim",
  dependencies = {
    "folke/snacks.nvim",
    -- "nvim-telescope/telescope.nvim", -- explicitly ensure this is installed
    "ibhagwan/fzf-lua",
  },
  opts = {
    ui = "FzfLua",
    max_recents = 30, -- Configure recent icons limit
    add_default_keybindings = true, -- Add default keybindings
    use_new_command = true, -- Enable new command system
  },
  cmd = { "Nerdy", "NerdyRecents" },
  keys = {
    { "<leader>fn", "<cmd>Nerdy<CR>", desc = "Browse nerd icons" },
  },
}

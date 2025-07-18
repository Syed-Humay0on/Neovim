return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    require("fzf-lua").setup {}
  end,
  opts = {},
  -- -- keys = {
  --   {
  --     "<leader><leader>",
  --     function()
  --       require("fzf-lua").files()
  --     end,
  --     desc = "Find Files in project directory",
  --   },
  -- },
}

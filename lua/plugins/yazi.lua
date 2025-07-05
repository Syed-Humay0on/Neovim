return
{
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>y",
      "<cmd>Yazi<CR>",
      desc = "Open Yazi at current file",
    },
    {
      "<leader>cw",
      "<cmd>Yazi cwd<cr>",
      desc = "Open Yazi at working directory",
    },
    {
      "<C-Up>",
      "<cmd>Yazi toggle<CR>",
      desc = "Toggle last Yazi session",
    },
  },
  opts = {
    open_for_directories = false,
    keymaps = {
      show_help = "<F1>",
    },
  },
  init = function()
    vim.g.loaded_netrwPlugin = 1 -- Optional, if replacing netrw
  end,
}

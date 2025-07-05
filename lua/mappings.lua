require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
vim.keymap.set(
  "n",
  "<leader>k",
  function()
    require("kubectl").toggle({ tab = true })
  end,
  { desc = "Toggle Kubectl", noremap = true, silent = true }
)

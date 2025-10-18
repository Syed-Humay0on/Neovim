require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Wrapped Keymaps for Kubectl
vim.keymap.set("n", "<leader>k", function()
  local ok, kubectl = pcall(require, "kubectl")
  if ok then
    kubectl.toggle { tab = false }
  else
    vim.notify("kubectl.nvim not loaded yet", vim.log.levels.WARN)
  end
end, { desc = "Toggle Kubectl", noremap = true, silent = true })
--
-- vim.keymap.set("n", "<leader>k", function()
--   require("kubectl").toggle { tab = false }
-- end, { desc = "Toggle Kubectl", noremap = true, silent = true })

-- vim.keymap.set("n", "<leader>m", function()
--   require("mongo-nvim.pickers").document_picker()
-- end, { desc = "Mongo: Pick Document" })

vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianSearch<CR>", { desc = "Search Obsidian notes" })
vim.keymap.set("n", "<leader>dt", function() require("dap").toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dc", function() require("dap").continue() end, { desc = "Continue Debugging" })
vim.keymap.set("n", "<leader>dr", function() require("dap").repl.toggle() end, { desc = "Toggle REPL" })
vim.keymap.set("n", "<leader>dx", function() require("dap").terminate() end, { desc = "Terminate Debug" })

-- vim.keymap.set("n", "<leader>z", "<cmd>FzfLua files<CR>", { desc = "Fuzzy Search Files" })

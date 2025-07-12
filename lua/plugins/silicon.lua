return
{
  "narutoxy/silicon.lua",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("silicon").setup({})

    -- 🔧 Custom keybinds (no <Leader>)
    vim.keymap.set("v", "<M-s>", function() silicon.visualise_api({}) end, { desc = "Silicon: selection to image" })
    vim.keymap.set("v", "<M-S>", function() silicon.visualise_api({ to_clip = true, show_buf = true }) end,
      { desc = "Silicon: selection + buffer to clipboard" })

    vim.keymap.set("n", "<M-s>", function() silicon.visualise_api({ to_clip = true, visible = true }) end,
      { desc = "Silicon: visible buffer to clipboard" })
    vim.keymap.set("n", "<M-S>", function() silicon.visualise_api({ to_clip = true }) end,
      { desc = "Silicon: current line to clipboard" })
  end
}

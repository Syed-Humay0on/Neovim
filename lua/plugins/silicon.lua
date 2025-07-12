return {
  "narutoxy/silicon.lua",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local silicon = require("silicon")
    silicon.setup({})

    -- 🖼 Default keymaps
    -- Generate image of lines in a visual selection
    vim.keymap.set("v", "<Leader>s", function()
      silicon.visualise_api({})
    end, { desc = "Silicon: visual selection" })

    -- Generate image of a whole buffer, with lines in a visual selection highlighted
    vim.keymap.set("v", "<Leader>bs", function()
      silicon.visualise_api({ to_clip = true, show_buf = true })
    end, { desc = "Silicon: buffer + selection to clipboard" })

    -- Generate visible portion of a buffer
    vim.keymap.set("n", "<Leader>s", function()
      silicon.visualise_api({ to_clip = true, visible = true })
    end, { desc = "Silicon: visible buffer to clipboard" })

    -- Generate current buffer line in normal mode
    vim.keymap.set("n", "<Leader>s", function()
      silicon.visualise_api({ to_clip = true })
    end, { desc = "Silicon: current line to clipboard" })
  end,
}


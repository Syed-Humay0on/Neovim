return {
  "michaelrommel/nvim-silicon",
  lazy = true,
  cmd = "Silicon",
  main = "nvim-silicon",
  init = function()
    local wk = require ("which-key")
    wk.add({
      mode = {"v"},
      {"<leader>s", group = "Silicon"},
      {"<leader>sc", function() require("nvim-silicon").clip() end, desc = "copy code screenshot to clipboard"},
      {"<leader>sf", function() require("nvim-silicon").file() end, desc = "Save code screenshot as file"},
      {"<leader>ss", function() require("nvim-silicon").shoot() end, desc = "Create code screenshot"},
    })
  end,
  opts = {
    -- Configuration here, or leave empty to use defaults
    theme = "Nord",
    background = "#444a73",
    line_offset = function(args)
      return args.line1
    end,
  },
}

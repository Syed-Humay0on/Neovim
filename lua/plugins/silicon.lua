return {
  "michaelrommel/nvim-silicon",
  lazy = true,
  cmd = "Silicon",
  main = "nvim-silicon",
  init = function()
    local wk = require "which-key"
    wk.add {
      mode = { "v" },
      { "<leader>s", group = "Silicon" },
      {
        "<leader>sc",
        function()
          require("nvim-silicon").clip()
        end,
        desc = "Copy code screenshot to clipboard",
      },
      {
        "<leader>sf",
        function()
          require("nvim-silicon").file()
        end,
        desc = "Save code screenshot as file",
      },
      {
        "<leader>ss",
        function()
          require("nvim-silicon").shoot()
        end,
        desc = "Create code screenshot",
      },
    }
  end,
  opts = {
    -- Enable this to avoid conflicts with silicon's config file
    disable_defaults = true,

    -- Your existing settings
    theme = "Nord",
    background = "#444a73",
    line_offset = function(args)
      return args.line1
    end,

    -- Custom output function that creates directory if needed
    output = function()
      -- Define target directory
      local dir = "./CodeShots"

      -- Create directory if it doesn't exist (works on Linux/Unix)
      if vim.fn.isdirectory(dir) == 0 then
        vim.fn.mkdir(dir, "p")
      end

      -- Generate unique filename with timestamp
      local filename = os.date "%Y-%m-%d_%H-%M-%S" .. "_code.png"

      -- Return full path
      return dir .. "/" .. filename
    end,
  },
}

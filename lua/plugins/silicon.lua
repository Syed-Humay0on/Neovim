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
    disable_defaults = true,
    theme = "Nord",
    background = "#444a73",

    -- Add language auto-detection
    language = function()
      local buf = vim.api.nvim_get_current_buf()
      local filetype = vim.bo[buf].filetype
      if filetype and filetype ~= "" then
        return filetype
      end
      local filename = vim.api.nvim_buf_get_name(buf)
      return vim.fn.fnamemodify(filename, ":e")
    end,

    output = function()
      local dir = "./CodeShots"
      if vim.fn.isdirectory(dir) == 0 then
        vim.fn.mkdir(dir, "p")
      end
      return dir .. "/" .. os.date "%Y-%m-%d_%H-%M-%S" .. "_code.png"
    end,
  },
}

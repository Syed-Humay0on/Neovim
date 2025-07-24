
return {
  {
    "R-nvim/R.nvim",
    lazy = false, -- Load immediately
    config = function()
      ---@class RUserOptions
      local opts = {
        hook = {
          on_filetype = function()
            vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", {})
            vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", {})
          end,
        },
        R_args = { "--quiet", "--no-save" },
        min_editor_width = 72,
        rconsole_width = 78,
        objbr_mappings = {
          c = "class",
          ["<localleader>gg"] = "head({object}, n = 15)",
          v = function()
            require("r.browser").toggle_view()
          end,
        },
        disable_cmds = {
          "RClearConsole",
          "RCustomStart",
          "RSPlot",
          "RSaveClose",
        },
        auto_start = vim.env.R_AUTO_START == "true" and "on startup" or nil,
        objbr_auto_start = vim.env.R_AUTO_START == "true" and true or nil,
      }

      require("r").setup(opts)
    end,
  },
}


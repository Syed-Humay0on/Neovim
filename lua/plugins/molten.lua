      return
      {
        "benlubas/molten-nvim",     -- Required: Code execution
        build = ":UpdateRemotePlugins",
        init = function()
          -- 🩵 FIX: Ensure correct rplugin manifest path for Molten
          vim.env.NVIM_RPLUGIN_MANIFEST = vim.fn.expand("~/.local/share/nvim/rplugin.vim")

          -- Optional: You can also explicitly set python3 host here for Molten
          if vim.fn.executable(vim.g.python3_host_prog or "") == 0 then
            vim.g.python3_host_prog = vim.fn.expand("$HOME/uv_env/bin/python")
          end

          -- Optional: Personal Molten preferences
          vim.g.molten_use_border_highlights = true
        end,
      }

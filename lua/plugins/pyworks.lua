return {
  {
    "jeryldev/pyworks.nvim",
    dependencies = {
      {
        "GCBallesteros/jupytext.nvim",
        config = true, -- Ensures jupytext.setup() is called!
      },
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
      },
      -- "3rd/image.nvim", -- Optional: For displaying images inline
    },
    config = function()
      require("pyworks").setup({
        python = {
          use_uv = true, -- Use uv for faster package installation
        },
        image_backend = "kitty", -- or "ueberzug" if using other terminals
      })
    end,
    lazy = false,   -- Load immediately
    priority = 100, -- Load early
  },
}

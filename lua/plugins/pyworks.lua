return {
  {
    "jeryldev/pyworks.nvim",
    dependencies = {

      "GCBallesteros/jupytext.nvim",
      config = true, -- Ensures jupytext.setup() is called!
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

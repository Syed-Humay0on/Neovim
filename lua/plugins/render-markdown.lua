return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    -- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    -- @type render.md.UserConfig
    ft = { "markdown" },
    opts = {
      indent = {
        enable = true, -- enable rendering indent guides
        char = "│", -- character to use (can also be "⎸", "╎", etc.)
        highlight = "LineNr", -- highlight group (or create your own)
        priority = 90, -- extmark priority (higher = on top of others)
      },
    },
  },
}

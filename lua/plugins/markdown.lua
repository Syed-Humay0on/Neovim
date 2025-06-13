return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  {
    "brianhuster/live-preview.nvim",
    dependencies = {
      -- You can choose one of the following pickers
      "nvim-telescope/telescope.nvim",
      "ibhagwan/fzf-lua",
      -- "echasnovski/mini.pick",
    },
    config = function()
      require("live-preview").setup {
        browser = "default", -- or "firefox", "chromium", "google-chrome", etc.
        port = 5500,
        sync_scroll = true,
      }
    end,
  },
}

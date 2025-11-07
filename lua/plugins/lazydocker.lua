return {
  "crnvl96/lazydocker.nvim",
  cmd = { "LazyDocker" }, -- optional: if plugin defines this
  keys = {
    {
      "<leader>ld",
      function()
        require("lazydocker").toggle({ engine = "docker" })
      end,
      mode = { "n", "t" },
      desc = "LazyDocker (docker)",
    },
    {
      "<leader>lp",
      function()
        require("lazydocker").toggle({ engine = "podman" })
      end,
      mode = { "n", "t" },
      desc = "LazyDocker (podman)",
    },
  },
  config = function()
    require("lazydocker").setup {
      window = {
        settings = {
          width = 1.0,
          height = 1.0,
          border = "rounded",
          relative = "editor",
        },
      },
    }
  end,
}

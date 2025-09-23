return 
{
  "kiyoon/jupynium.nvim",
  build = "pip install .",
  dependencies = { "rcarriga/nvim-notify", "stevearc/dressing.nvim" },
  config = function()
    require("jupynium").setup({
      python_host = "python3", -- let it use your conda env python
    })
  end,
}


return {
  "kiyoon/jupynium.nvim",
  build = "pip install -e .",
  dependencies = {
    "rcarriga/nvim-notify",
    "stevearc/dressing.nvim",
  },
  config = function()
    local python_path = vim.fn.exepath("python")
    vim.g.python3_host_prog = python_path

    require("jupynium").setup({
      python_host = "/home/proto/miniconda3/envs/jupyter_env/bin/python",
      jupyter_command = "jupyter",
      default_notebook_URL = "localhost:8888/nbclassic", -- <- key fix
    })
  end,
}

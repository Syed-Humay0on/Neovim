return
{
  "kiyoon/jupynium.nvim",
  build = "pip install .",
  dependencies = { "rcarriga/nvim-notify", "stevearc/dressing.nvim" },
  config = function()
     -- Get the correct python path dynamically
    local python_path = vim.fn.exepath("python")  -- Works on Linux, macOS, Windows (including WSL)

        -- Tell Neovim to use the same Python for all Python-based plugins
    vim.g.python3_host_prog = python_path

    require("jupynium").setup({
      python_host = python_path,
      jupyter_command = "jupyter", -- assumes it's in your PATH
      -- Optional: add this if you want logs to debug issues
      -- log_level = "info",
    })
  end,
}


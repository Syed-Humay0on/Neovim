vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.relativenumber = true
vim.opt.rtp:prepend(lazypath)
vim.opt.wildignorecase = true
vim.opt.wildmode = { "longest:full", "full" }


local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  -- { "nvim-treesitter/nvim-treesitter", branch = "master", lazy = false, build = ":TSUpdate" },
  -- ✅ Clean and modern
-- in your lazy.nvim setup file (e.g., plugins.lua)
{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "lua", "typescript", "elixir", "dockerfile", "yaml", "markdown", "markdown_inline"
      },
      sync_install = false,
      ignore_install = {},
      auto_install = true,
      modules = {},
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown" },
      },
    }
  end,
  lazy = false,  -- or true if you prefer lazy-loading, but then config is needed
},



  {
    "b0o/schemastore.nvim",
    lazy = true,
  },
  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

-- auto HTML
vim.o.autowriteall = true
vim.api.nvim_create_autocmd({ "InsertLeavePre", "TextChanged", "TextChangedP" }, {
  pattern = "*.html",
  callback = function()
    vim.cmd "silent! write"
  end,
})

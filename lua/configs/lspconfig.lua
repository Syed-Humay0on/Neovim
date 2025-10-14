-- ~/.config/nvim/lua/configs/lspconfig.lua
-- ✅ Modern Neovim 0.11+ + NvChad LSP setup
-- See :h vim.lsp.config and :h vim.lsp.enable

-- Load NvChad default LSP behavior (on_attach, capabilities, etc.)
require("nvchad.configs.lspconfig").defaults()

-- Custom per-language LSP configurations (optional but powerful)
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.config("pyright", {
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
      },
    },
  },
})

vim.lsp.config("yamlls", {
  settings = {
    yaml = {
      keyOrdering = false,
      format = { enable = true },
      validate = true,
    },
  },
})

vim.lsp.config("jsonls", {
  settings = {
    json = {
      validate = { enable = true },
      schemas = require("schemastore").json.schemas(),
    },
  },
})

-- Enable all language servers you want
vim.lsp.enable({
  "html",
  "cssls",
  "ts_ls",
  "lua_ls",
  "pyright",
  "gopls",
  "rust_analyzer",
  "bashls",
  "dockerls",
  "yamlls",
  "jsonls",
  "clangd",
  "texlab",
  "marksman",
})

-- 📝 Notes:
-- - To see docs for these new APIs, run :h vim.lsp.config and :h vim.lsp.enable
-- - You no longer need require("lspconfig")[server].setup()
-- - NvChad auto-handles common defaults like keymaps & capabilities

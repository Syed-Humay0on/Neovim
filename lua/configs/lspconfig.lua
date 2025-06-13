-- require("nvchad.configs.lspconfig").defaults()
--
-- local servers = { "html", "cssls" }
-- vim.lsp.enable(servers)
--
-- read :h vim.lsp.config for changing options of lsp servers
local on_attach = require("nvchad.configs.lspconfig").on_attach
-- local capabilities = require("nvchad.configs.lspconfig").capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require "lspconfig"

-- Setup ElixirLS
lspconfig.elixirls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { vim.fn.stdpath "data" .. "/mason/packages/elixir-ls/language_server.sh" },
  settings = {
    elixirLS = {
      dialyzerEnabled = true,
      fetchDeps = false,
    },
  },
}

-- Setup php LSP
lspconfig.intelephense.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  -- cmd = { "intelephense", "--stdio" },
  filetypes = { "php" },
  -- root_dir = lspconfig.util.root_pattern("composer.json", ".git"),
  root_dir = function()
    return vim.loop.cwd()
  end,
  settings = {
    intelephense = {
      environment = {
        includePaths = {}, -- optional: add external folders here
      },
    },
  },
}
--setup javascript/typescript
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = require("lspconfig/util").root_pattern("package.json", "tsconfig.json", ".git"),
}

lspconfig.eslint.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Setup for Lua Language servers
lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Setup other LSPs
local servers = { "html", "cssls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

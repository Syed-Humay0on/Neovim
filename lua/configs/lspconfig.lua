-- require("nvchad.configs.lspconfig").defaults()
--
-- local servers = { "html", "cssls" }
-- vim.lsp.enable(servers)
--
-- read :h vim.lsp.config for changing options of lsp servers 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require("lspconfig")

-- Setup ElixirLS
lspconfig.elixirls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { vim.fn.stdpath("data") .. "/mason/packages/elixir-ls/language_server.sh" },
  settings = {
    elixirLS = {
      dialyzerEnabled = true,
      fetchDeps = false,
    },
  },
})

--setup javascript/typescript
lspconfig.ts_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = require("lspconfig/util").root_pattern("package.json", "tsconfig.json", ".git"),
})

lspconfig.eslint.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Setup other LSPs
local servers = { "html", "cssls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end


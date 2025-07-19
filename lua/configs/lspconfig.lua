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
local schemastore = require "schemastore"

-- Setup ElixirLS
lspconfig.elixirls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { vim.fn.stdpath "data" .. "/mason/packages/elixir-ls/language_server.sh" },
  filetypes = { "elixir", "eelixir", "heex" },
  root_dir = require("lspconfig.util").root_pattern("mix.exs", ".git"),
  settings = {
    elixirLS = {
      dialyzerEnabled = true,
      fetchDeps = false,
    },
  },
}

-- GoLang languge server
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

-- Ruby lsp using solargraph
lspconfig.solargraph.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "solargraph", "stdio" },
  filetypes = { "ruby" },
  root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
  settings = {
    solargraph = {
      diagnostics = true,
      formatting = true,
    },
  },
}

-- Rust lsp using rust_analyzer
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_dir = lspconfig.util.root_pattern("Cargo.toml", "rust-project.json", ".git"),
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      checkOnSave = {
        command = "clippy",
      },
    },
  },
}

--zig lsp using zig Language Server
lspconfig.zls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "zls" },
  filetypes = { "zig" },
  root_dir = lspconfig.util.root_pattern("build.zig", ".git"),
}

-- Terraform Language Server
lspconfig.terraformls.setup {
  cmd = { "terraform-ls", "serve" },
  filetypes = { "terraform", "tf", "hcl" },
  root_dir = lspconfig.util.root_pattern(".terraform", ".git", "main.tf"),
  settings = {},
}

-- LaTeX LSP: texlab
lspconfig.texlab.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "tex", "bib" },
  root_dir = lspconfig.util.root_pattern(".latexmkrc", ".git", "*.tex"),
  settings = {
    texlab = {
      build = {
        executable = "latexmk",
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
        onSave = true,
        forwardSearchAfter = true,
      },
      forwardSearch = {
        executable = "zathura", -- or your PDF viewer, like "okular" or "evince"
        args = { "--synctex-forward", "%l:1:%f", "%p" },
      },
      chktex = {
        onOpenAndSave = true,
        onEdit = false,
      },
    },
  },
}

-- Dockerfile
lspconfig.dockerls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "Dockerfile", "dockerfile" },
  root_dir = lspconfig.util.root_pattern("Dockerfile", ".git"),
}

-- DockerCompose
lspconfig.docker_compose_language_service.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "yaml", "yml" },
  root_dir = lspconfig.util.root_pattern("docker-compose.yml", "compose.yaml", ".git"),
  settings = {
    dockerComposeLanguageService = {
      enable = true,
    },
  },
}

-- YAML Language Server
lspconfig.yamlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = schemastore.yaml.schemas(),
      validate = true,
      completion = true,
      hover = true,
    },
  },
}

-- GitHub Actions Language Server
-- lspconfig.gha_ls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "yaml", "yml" },
--   root_dir = lspconfig.util.root_pattern ".github/workflows",
-- }

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
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
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

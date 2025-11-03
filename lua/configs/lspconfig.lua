-- file: lua/configs/lspconfig.lua
require("nvchad.configs.lspconfig").defaults()
local ok_blink, blink = pcall(require, "blink.cmp")
local capabilities = ok_blink and blink.get_lsp_capabilities()
    or vim.lsp.protocol.make_client_capabilities()

vim.lsp.config("*", {
  capabilities = capabilities,
  -- kalau mau: on_init = function(client) ... end,
})
-- Helper root_dir default

-- Daftar server dengan konfigurasi khusus
local servers = {
  html = {},
  cssls = {},
  bashls = {},
  htmx = {},
  gopls = {},
  tailwindcss = {
    filetypes = {
      "typescriptreact", "javascriptreact",
      "html", "htmx", "templ", "blade", "gohtml", "gohtmltmpl",
      "css", "less", "postcss", "sass", "scss",
    },
  },
  templ = {},
  phpactor = {},
  clangd = {},
  prismals = {},
  lemminx = {},
  oxlint = {
    cmd = { "oxc_language_server" },
    filetypes = {
      "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx",
    },
    root_markers = { ".git", "package.json" }
  },

  ts_ls = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
      "javascript", "javascriptreact", "javascript.jsx",
      "typescript", "typescriptreact", "typescript.tsx",
    },
    root_markers = { "package.json", "tsconfig.json", ".git" },
    settings = {
      typescript = {
        preferences = {
          importModuleSpecifier = "relative",
          importModuleSpecifierPreference = "relative",
          importModuleSpecifierEnding = "minimal",
          preferTypeOnlyAutoImports = true,
          includeCompletionsForModuleExports = true,
          includeCompletionsWithInsertTextCompletions = true,
        },
        suggest = {
          autoImports = true,
        },
      },
      javascript = {
        preferences = {
          importModuleSpecifier = "relative",
          importModuleSpecifierPreference = "relative",
          importModuleSpecifierEnding = "minimal",
          preferTypeOnlyAutoImports = true,
        },
        suggest = { autoImports = true },
      },
    }
  },

  pyright = {
    settings = {
      python = { analysis = { autoSearchPaths = true, typeCheckingMode = "basic" } },
    },
  },

  lua_ls = {
  },

  rust_analyzer = {
    on_attach = function(_, bufnr)
      if vim.lsp.inlay_hint and vim.lsp.inlay_hint.enable then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end
    end,
  },
}

-- Terapkan konfigurasi dan aktifkan server (API 0.11)
for name, cfg in pairs(servers) do
  cfg.capabilities = vim.tbl_deep_extend("force", capabilities, cfg.capabilities or {})
  vim.lsp.config(name, cfg)
  vim.lsp.enable(name)
end

-- Atur root marker global default (fallback)
vim.lsp.config("*", { root_markers = { ".git" } })
vim.lsp.set_log_level("debug")

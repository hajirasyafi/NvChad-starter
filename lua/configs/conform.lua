local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "oxlint", "prettier" },
    typescript = { "oxlint", "prettier" },
    javascriptreact = { "oxlint", "prettier" },
    typescriptreact = { "oxlint", "prettier" },
    go = { "oxlint", "prettier" },
    templ = { "prettier" },
    json = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
  },
  format_on_save = {
    timeout_ms = 2000,
    lsp_format = "fallback",
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
}

return options

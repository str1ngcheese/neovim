local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    go = { "gofumpt", "goimports" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    c = { "clang-format" },
    python = { "isort", "black" },
    -- rust = { "rustfmt" },
  },

  -- vim.api.nvim_create_autocmd("BufWritePre", {
  --   pattern = "*",
  --   callback = function(args)
  --     require("conform").format({ bufnr = args.buf })
  --   end,
  -- }),

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options

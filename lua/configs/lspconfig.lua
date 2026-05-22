require("nvchad.configs.lspconfig").defaults()

vim.lsp.config["ts_ls"] = {
  settings = {
    typescript = { format = { enable = false } },
    javascript = { format = { enable = false } },
  },
}

local servers = { "html", "cssls", "ts_ls", "eslint", "clangd" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 

require("nvchad.configs.lspconfig").defaults()

vim.lsp.config["ts_ls"] = {
  settings = {
    typescript = { format = { enable = false } },
    javascript = { format = { enable = false } },
  },
}

--local clangd = "C:/Program Files/LLVM/bin/clangd.exe"
local clangd = vim.env.clangd

if value then
  vim.notify("clangd env var = " .. value, vim.log.levels.INFO)

  vim.lsp.config["clangd"] = {
    cmd = {
      clangd,
      "--background-index",
      "--clang-tidy",
    },
  }
else
  vim.notify("clangd env var is not set", vim.log.levels.WARN)
end

local servers = {
  "html",
  "cssls",
  "ts_ls",
  "eslint",
  "clangd",
  "rust_analyzer",
}

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

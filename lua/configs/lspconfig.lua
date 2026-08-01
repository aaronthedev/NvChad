require("nvchad.configs.lspconfig").defaults()

vim.lsp.config["ts_ls"] = {
  settings = {
    typescript = { format = { enable = false } },
    javascript = { format = { enable = false } },
  },
}

local clangd = "C:/Program Files/LLVM/bin/clangd.exe"

if not vim.uv.fs_stat(clangd) then
  vim.notify("clangd not found: " .. clangd, vim.log.levels.ERROR)
  return
end

vim.lsp.config["clangd"] = {
  cmd = {
    clangd,
    "--background-index",
    "--clang-tidy",
  },
}

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

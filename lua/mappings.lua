require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

--map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
map("n", "gr", vim.lsp.buf.references, { desc = "Find References" })

map("n", "gd", function()
  local api = require("UnrealDev.api")
  if api.goto_definition then
    api.goto_definition({ has_bang = false })
  else
    vim.lsp.buf.definition()
  end
end, { desc = "UE Go to Definition" })

--map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Find in Files" })
--map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })

map("n", "<leader>ca", vim.lsp.buf.code_action, {
  desc = "Code Actions"
})

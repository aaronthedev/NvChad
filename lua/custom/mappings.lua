local M = {}

M.general = {
  n = {
    ["<leader>rr"] = {
      function()
        local file = vim.fn.expand("%:p")
        local out = vim.fn.expand("%:p:r")

        vim.cmd(

          "TermExec cmd='clang++ -std=c++20 -O0 -g "

          .. file

          .. " -o "

          .. out

          .. " && "

          .. out

          .. "'"

        )
      end,
      "Build & Run C++ file",
    },
  },
}

return M

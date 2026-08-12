return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    { "<leader>t", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
  },
  opts = function()
    local opts = {
      size = 20,
      direction = "float",
    }

    local os_name = vim.uv.os_uname().sysname

    if vim.fn.has("win32") == 1 then
      if vim.fn.executable("powershell") == 1 then
        opts.shell = "powershell"
      else
        vim.notify("PowerShell not found", vim.log.levels.ERROR)
      end
    end

    vim.schedule(function()
      vim.notify(
        "OS: " .. os_name ..
        "\nToggleTerm shell: " .. (opts.shell or vim.o.shell)
      )
    end)

    return opts
  end,
}

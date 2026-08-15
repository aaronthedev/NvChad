local Terminal = require("toggleterm.terminal").Terminal

vim.api.nvim_create_user_command("PS", function(opts)
  local script = vim.fn.getcwd() .. "/" .. opts.args

  local ps = Terminal:new({
    cmd = string.format(
      'powershell -NoProfile -ExecutionPolicy Bypass -File "%s"',
      script
    ),

    dir = vim.fn.getcwd(),

    direction = "float",
    close_on_exit = false,
  })

  ps:toggle()
end, {
  nargs = 1,
  complete = "file",
})

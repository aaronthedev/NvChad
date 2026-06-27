return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      enabled = true,
      render_modes = { "n", "c", "t" },
    },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = { "markdown", "markdown_inline" },
      },
    },
  },
}

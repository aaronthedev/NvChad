return {
  {
    "taku25/UnrealDev.nvim",
    ft = { "cpp", "c" },
    cmd = { "UDEV" },
    dependencies = {
      {
        "taku25/UNL.nvim",
        lazy = false,
        build = "cargo build --release --manifest-path scanner/Cargo.toml",
        build_timeout = 300000,
      },
      {
        "taku25/UEP.nvim",
        opts = { engine_path = "/home/aaron/TremEn" },
      },
      {
        "taku25/UBT.nvim",
        opts = { engine_path = "/home/aaron/TremEn" },
      },
      "taku25/UCM.nvim",
      "taku25/USH.nvim",
      "taku25/ULG.nvim",
      {
        "taku25/UNX.nvim",
        dependencies = {
          "MunifTanjim/nui.nvim",
          "nvim-tree/nvim-web-devicons",
        },
      },
      { "taku25/USX.nvim", lazy = false },
      "nvim-telescope/telescope.nvim",
      "j-hui/fidget.nvim",
      {
        "romus204/tree-sitter-manager.nvim",
        opts = {
          ensure_installed = { "cpp", "ushader", "verse" },
          highlight = { "cpp", "ushader", "verse" },
          border = "rounded",
          languages = {
            cpp = {
              install_info = {
                url = "https://github.com/taku25/tree-sitter-unreal-cpp",
                revision = "e2b94d3bd3ce359ff732116cc21f34ecbecfca50",
                use_repo_queries = true,
              },
              requires = { "c" },
            },
            ushader = {
              install_info = {
                url = "https://github.com/taku25/tree-sitter-unreal-shader",
                use_repo_queries = true,
              },
            },
            verse = {
              install_info = {
                url = "https://github.com/taku25/tree-sitter-verse",
                use_repo_queries = true,
              },
            },
          },
        },
        config = function(_, opts)
          vim.filetype.add({
            extension = {
              verse = "verse",
              usf = "ushader",
              ush = "ushader",
            },
          })
          require("tree-sitter-manager").setup(opts)
          local group = vim.api.nvim_create_augroup("MyTreesitter", { clear = true })
          vim.api.nvim_create_autocmd("FileType", {
            group = group,
            pattern = opts.highlight,
            callback = function(args)
              vim.treesitter.start(args.buf)
            end,
          })
        end,
      },
    },
    config = function()
      require("UnrealDev").setup({
        setup_modules = {
          UBT = true,
          UEP = true,
          ULG = true,
          USH = true,
          UCM = true,
          UEA = true,
          UNX = true,
        },
      })
    end,
  },
}

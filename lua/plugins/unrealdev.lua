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
        opts = { engine_path = "/E:/UE_4.27" },
      },
      {
        "taku25/UBT.nvim",
        opts = { engine_path = "/E:/UE_4.27" },
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
          ensure_installed = {
            "cpp",
            "ushader",
            "verse",
          },

          highlight = {
            "cpp",
            "ushader",
            "verse",
          },

          border = "rounded",

          languages = {
            cpp = {
              install_info = {
                url = "https://github.com/taku25/tree-sitter-cpp",
                use_repo_queries = true,
              },
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
          ---------------------------------------------------------------------------
          -- Neovim 0.11 compatibility shim for tree-sitter-manager.nvim
          ---------------------------------------------------------------------------

          vim.list = vim.list or {}

          if not vim.list.unique then
            vim.list.unique = function(items)
              local result = {}
              local seen = {}

              for _, item in ipairs(items) do
                if not seen[item] then
                  seen[item] = true
                  result[#result + 1] = item
                end
              end

              return result
            end
          end

          ---------------------------------------------------------------------------
          -- Unreal-related file types
          ---------------------------------------------------------------------------

          vim.filetype.add {
            extension = {
              verse = "verse",
              usf = "ushader",
              ush = "ushader",
            },
          }

          ---------------------------------------------------------------------------
          -- Tree-sitter manager
          ---------------------------------------------------------------------------

          require("tree-sitter-manager").setup(opts)

          ---------------------------------------------------------------------------
          -- Enable Tree-sitter highlighting
          ---------------------------------------------------------------------------

          local group = vim.api.nvim_create_augroup("UnrealTreesitter", { clear = true })

          vim.api.nvim_create_autocmd("FileType", {
            group = group,
            pattern = opts.highlight,

            callback = function(args)
              local ok, err = pcall(vim.treesitter.start, args.buf)

              if not ok then
                vim.schedule(function()
                  vim.notify(
                    ("Failed to start Tree-sitter for '%s': %s"):format(vim.bo[args.buf].filetype, tostring(err)),
                    vim.log.levels.WARN
                  )
                end)
              end
            end,
          })
        end,
      },
    },
    config = function()
      require("UnrealDev").setup {
        setup_modules = {
          UBT = true,
          UEP = true,
          ULG = true,
          USH = true,
          UCM = true,
          UEA = true,
          UNX = true,
        },
      }
    end,
  },
}

return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^6", -- Recommended
    lazy = false, -- This plugin is already lazy
    -- config = function()
    --   local mason_registry = require "mason-registry"
    --   local codelldb = mason_registry.get_package "codelldb"
    --   local extension_path = codelldb:get_install_path() .. "/extension/"
    --   local codelldb_path = extension_path .. "adapter/codelldb"
    --   local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
    --   local cfg = require "rustaceanvim.config"
    --
    --   vim.g.rustaceanvim = {
    --     dap = {
    --       adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
    --     },
    --   }
    -- end,
  },

  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap, dapui = require "dap", require "dapui"
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require("dapui").setup()
    end,
  },

  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    -- require('nvim-ts-autotag').setup({
    --   opts = {
    --     -- Defaults
    --     enable_close = true, -- Auto close tags
    --     enable_rename = true, -- Auto rename pairs of tags
    --     enable_close_on_slash = false -- Auto close on trailing </
    --   },
    --   -- Also override individual filetype configs, these take priority.
    --   -- Empty by default, useful if one of the "opts" global settings
    --   -- doesn't work well in a specific filetype
    --   per_filetype = {
    --     ["html"] = {
    --       enable_close = true
    --     }
    --   }
    -- })
  },

  -- {
  --   "S1M0N38/love2d.nvim",
  --   cmd = "LoveRun",
  --   opts = { },
  --   keys = {
  --     { "<leader>l", ft = "lua", desc = "LÖVE" },
  --     { "<leader>ll", "<cmd>LoveRun<cr>", ft = "lua", desc = "Run LÖVE" },
  --     { "<leader>ls", "<cmd>LoveStop<cr>", ft = "lua", desc = "Stop LÖVE" },
  --   },
  -- },

  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = function()
      require("crates").setup {
        completion = {
          cmp = {
            enabled = true,
          },
        },
      }
      require("cmp").setup.buffer {
        sources = { { name = "crates" } },
      }
    end,
  },

  {
    "HiPhish/rainbow-delimiters.nvim",

    Lazy = true,
    event = "BufRead",
    config = function()
      -- This module contains a number of default definitions
      local rainbow_delimiters = require "rainbow-delimiters"

      ---@type rainbow_delimiters.config
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        priority = {
          [""] = 110,
          lua = 210,
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "hyprlang",
        "go",
        "python",
        "bash",
        -- "js",
      },
    },
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
}

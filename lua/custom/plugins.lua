local plugins = {
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.dap"
      require("core.utils").load_mappings("dap")
    end
  },
{
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    -- dependencies = "mfussenegger/nvim-dap",
    -- config = function()
    --   local dap = require("dap")
    --   local dapui = require("dapui")
    --   require("dapui").setup()
    --   dap.listeners.after.event_initialized["dapui_config"] = function()
    --     dapui.open()
    --   end
    --   dap.listeners.before.event_terminated["dapui_config"] = function()
    --     dapui.close()
    --   end
    --   dap.listeners.before.event_exited["dapui_config"] = function()
    --     dapui.close()
    --   end
    -- end
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "mypy",
        "ruff",
        "pyright",
        "typescript-language-server",
        "js-debug-adapter",
        "rust-analyzer",
        "clangd",
        "clang-format",
      },
    },
    lazy = false,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
     vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require "custom.configs.rust-tools"
    end,
    config = function (_, opts)
      require('rust-tools').setup(opts)
    end,
  },
  {
    'saecki/crates.nvim',
    ft = {"rust", "toml"},
    config = function (_, opts)
      local crates = require('crates')
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function ()
      local M = require "plugins.configs.cmp"
      table.insert(M.sources, {name = "crates"})
      return M
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
 {
  "neovim/nvim-lspconfig",

   dependencies = {
     "jose-elias-alvarez/null-ls.nvim",
      event = "VeryLazy",
     config = function()
       return require "custom.configs.null-ls"
     end,
   },
   config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
   end,
},
}
return plugins


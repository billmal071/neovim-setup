return {

  ["simrat39/rust-tools.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.configs.rust-tools"
    end,
  },

  ["saecki/crates.nvim"] = {
    event = { "BufRead Cargo.toml" },
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("crates").setup()
    end,
  },

  ["hrsh7th/cmp-vsnip"] = {},

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.configs.null-ls"
    end,
  },

  ["windwp/nvim-ts-autotag"] = {
    config = function()
      require("nvim-ts-autotag").setup {}
    end,
  },

  ["glepnir/lspsaga.nvim"] = {
    branch = "main",
    config = function()
      require("lspsaga").setup {}
    end,
    requires = { { "nvim-tree/nvim-web-devicons" } },
  },

  ["prisma/vim-prisma"] = {},

  ["pantharshit00/coc-prisma"] = {
    after = "vim-prisma",
    requires = { { "prisma/vim-prisma" } },
  },

  ["wakatime/vim-wakatime"] = {},

  ["neoclide/coc-java"] = {},

  ["mfussenegger/nvim-jdtls"] = {
    ft = "java",
    after = "coc-java",
  },

  ["akinsho/git-conflict.nvim"] = {
    config = function()
      require "custom.plugins.configs.git-conflict"
    end,
  },

  -- ["tanvirtin/vgit.nvim"] = {
  --   after = "plenary.nvim",
  --   requires = { { "nvim-lua/plenary.nvim" } },
  --   config = function()
  --     require("vgit").setup {}
  --   end,
  -- },

  ["junegunn/rainbow_parentheses.vim"] = {},

  ["mrjones2014/nvim-ts-rainbow"] = {},

  ["codota/tabnine-nvim"] = {
    run = "./dl_binaries.sh",
    config = function()
      require "custom.plugins.configs.tabnine"
    end,
  },

  ["mfussenegger/nvim-dap"] = {},

  ["rcarriga/nvim-dap-ui"] = {
    requires = { { "mfussenegger/nvim-dap" } },
  },

  ["ray-x/go.nvim"] = {
    config = function()
      require "custom.plugins.configs.ray-go"
    end,
  },

  ["ray-x/guihua.lua"] = {},

  ["metakirby5/codi.vim"] = {},

  ["simrat39/inlay-hints.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.configs.hints"
    end,
  },

  ["hashivim/vim-terraform"] = {},

    {
    "folke/trouble.nvim",
    config = function()
      require "custom.trouble"
    end,
  },

  {
    "stevearc/aerial.nvim",
    config = function()
      require("aerial").setup {}
    end,
    lazy = false,
  },

  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require "custom.dapui"
    end,
  },

  {
    -- Better looking -- folding
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = function()
      require "custom.ufo"
    end,
    lazy = false,
  },

  {
    -- Popup notifications
    "rcarriga/nvim-notify",
    lazy = false,
  },

  -- load it after nvim-lspconfig cuz we lazy loaded lspconfig
}

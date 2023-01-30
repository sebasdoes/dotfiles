-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Common dependencies
  use "nvim-lua/plenary.nvim"
  -- Lazy loading:
  -- Load on specific commands
  -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
  -- use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)

  -- Post-install/update hook with neovim command
  use { 'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require("config.treesitter").setup()
    end,
  }

  -- You can alias plugin names
  -- Catppuccin
  use { "catppuccin/nvim", as = "catppuccin",
    config = function()
      require("config.catppuccin").setup()
    end,
  }

  -- nvim-tree
  use {
    'nvim-tree/nvim-tree.lua',
    as = "nvim-tree",
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    cmd = { "NvimTreeToggle", "NvimTreeClose" },
    config = function()
      require('config.nvimtree')
    end,
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- which-key
  use {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
      require("config.whichkey").setup()
    end,
  }

  -- status line
  use {
    "nvim-lualine/lualine.nvim",
    after = "nvim-treesitter",
    config = function()
      require("config.lualine").setup()
    end,
    requires = { "nvim-web-devicons" },
  }
  use {
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter",
    module = "nvim-gps",
    config = function()
      require("nvim-gps").setup()
    end,
  }

  -- telescope

  -- gitsigns
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require("gitsigns").setup()
    end,
  }

  -- tabs
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons',
    config = function ()
      require("config.bufferline").setup()
    end,
  }

  -- LSP / null-ls
  use {
    'neovim/nvim-lspconfig',
    config = function ()
      require("config.lspconfig")
    end,
  }

  use {
    "jose-elias-alvarez/null-ls.nvim",
    config = function ()
      require("config.null_ls")
    end,
    requires = { "nvim-lua/plenary.nvim" },
  }

  -- Tabs
  use {
    'romgrk/barbar.nvim',
    config = function ()
      require("config.barbar")
    end,
    wants = 'nvim-web-devicons'
  }
end)

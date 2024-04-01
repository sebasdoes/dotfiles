return {
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require("configs.null-ls")
        end,
      },
      {
        "williamboman/mason.nvim",
        config = function(_, opts)
          dofile(vim.g.base46_cache .. "mason")
          require("mason").setup(opts)
          vim.api.nvim_create_user_command("MasonInstallAll", function()
            vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
          end, {})
          require("configs.lspconfig") -- Load in lsp config
        end,
      },
      "williamboman/mason-lspconfig.nvim"
    },
    config = function()
       require("nvchad.configs.lspconfig").defaults()
       require "configs.lspconfig"
    end,
  },
}

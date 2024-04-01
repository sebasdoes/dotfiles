return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "c",
        "markdown",
        "markdown_inline",
        "python",
      },
      indent = {
        enable = true
      }
    },
  },
}

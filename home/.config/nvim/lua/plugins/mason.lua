return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "deno",

        -- ansible & yaml
        "yamllint",
        "yamlfmt",
        "ansible-language-server",
        "ansible-lint",

        -- python
        "pyright",
        "black",
        "pylint",

        "markdownlint"
      }
    }
  }
}

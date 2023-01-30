local null_ls = require("null-ls")

-- code action sources
local code_actions = null_ls.builtins.code_actions

-- diagnostic sources
local diagnostics = null_ls.builtins.diagnostics

-- formatting sources
local formatting = null_ls.builtins.formatting

-- hover sources
local hover = null_ls.builtins.hover

-- completion sources
local completion = null_ls.builtins.completion

null_ls.setup({ 
  sources = {
    formatting.stylua,
    diagnostics.eslint,
    completion.spell,
    code_actions.gitsigns,
    diagnostics.pylint.with({
        extra_args = { "--disable=all", "--enable=E,C,W", "--disable=C0330", "--disable=C0114,C0115,C0116" },
    }),
    formatting.black,
  } 
})

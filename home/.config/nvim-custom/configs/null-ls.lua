local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins
local d = b.diagnostics
local f = b.formatting

local sources = {
  -- python
  d.pylint.with({
    prefer_local = ".venv/bin",
  }),
  d.semgrep.with({
    args = { "--config", "p/gitlab-bandit", "-q", "--json", "$FILENAME" },
    method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
  }),
  f.black.with({
    prefer_local = ".venv/bin",
  }),
}


null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    -- vim.lsp.buf.formatting_sync()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end, 
}


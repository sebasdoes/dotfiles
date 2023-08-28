---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>f"] = {"<cmd>lua vim.diagnostic.open_float()<CR>", "enter Telescope diagnostics mode", opts = { noremap = true, silent = true } },
    ["<leader>dd"] = {"<cmd>Telescope diagnostics<CR>", "enter Telescope diagnostics mode", opts = { noremap = true, silent = true } },
    ["<leader>'"] = {"ciw\"\"<ESC>P<CR>", "enter Telescope diagnostics mode", opts = { noremap = true, silent = true } },
  },
}

-- more keybinds!

return M

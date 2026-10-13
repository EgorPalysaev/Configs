require("config.lazy")
require("config.options")

vim.opt.clipboard = "unnamedplus" -- use the system clipboard for yanks/pastes
vim.opt.mouse = "a"               -- allow mouse interaction in Neovim

vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})

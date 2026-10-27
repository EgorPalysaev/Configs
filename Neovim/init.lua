
------------- Clipboard
vim.opt.mouse = "a"               -- allow mouse interaction in Neovim
vim.opt.clipboard = "unnamedplus" -- use the system clipboard for yanks/pastes


------------- Keybinds
vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})


------------- Line number
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4


------------- Map leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


------------- Colorsheme
vim.pack.add { { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } }
vim.cmd.colorscheme "catppuccin-nvim"


------------- Lualine
vim.pack.add({
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
})

require('lualine').setup ()


------------- Neo-tree
vim.pack.add({
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
    version = vim.version.range('3')
  },
  -- dependencies
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  -- optional, but recommended
  "https://github.com/nvim-tree/nvim-web-devicons",
})

require('neo-tree').setup({})


------------- Telescope
vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
})

require("telescope").setup({})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Search text' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


------------- Treesitter
vim.pack.add({
    {
	src = "https://github.com/nvim-treesitter/nvim-treesitter",
	version = "main",
    },
})

require("nvim-treesitter").setup({})
require("nvim-treesitter").install({ "lua", "vim", "vimdoc", "bash", "c", "cpp", "markdown" })

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "lua", "vim", "vimdoc", "bash", "c", "cpp", "markdown" },
    callback = function()
        vim.treesitter.start()
    end,
})



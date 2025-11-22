vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.termguicolors = true

require("config.lazy")
require("config.commands")
require("options.keymaps")
require("options.options")

-- Colorscheme
vim.cmd.colorscheme("one_monokai")

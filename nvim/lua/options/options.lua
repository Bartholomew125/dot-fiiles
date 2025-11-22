-- Line numbers
vim.o.relativenumber = true
vim.o.nu = true

-- Indentation
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

-- Clipboard integration
vim.o.clipboard = "unnamedplus"

-- Display 80 character column, and limit text width to that column.
vim.o.colorcolumn = "80"
vim.o.textwidth = 80

-- Remove underlines from diagnostic messages
vim.diagnostic.config({
    underline = false
})

-- Set signcolumn to static
vim.o.signcolumn = "yes"

vim.o.scrolloff = 20



vim.g.have_nerd_font = true
vim.o.mouse = 'a'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.confirm = true
vim.o.updatetime = 100

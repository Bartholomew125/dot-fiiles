local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

function _lazygit_toggle()
    lazygit:toggle()
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "asm", "s" },
  callback = function()
    vim.bo.commentstring = "# %s"
  end,
})

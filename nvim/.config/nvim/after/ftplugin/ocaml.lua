vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

require('nvim-autopairs').remove_rule("'")

-- Shortcut for pipeline operator
vim.keymap.set('i', '<D-\\>', '|>', {desc = "Insert '|>' (pipeline operator)"})

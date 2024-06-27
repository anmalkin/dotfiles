--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("amalkin")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=4 sw=2 et

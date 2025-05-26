-- Shortcuts for executing lua commands
vim.keymap.set('n', '<Leader>x', ':.lua<cr>', { desc = "Execute current line (lua)" })
vim.keymap.set('v', '<Leader>x', ':lua<cr>', { desc = "Execute highlighted text (lua)" })

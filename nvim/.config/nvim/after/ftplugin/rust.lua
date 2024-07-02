local cs = vim.bo.commentstring
vim.bo.commentstring = cs:gsub('(%S)%%s', '%1 %%s'):gsub('%%s(%S)', '%%s %1')

-- Easy insertion of double ::
vim.keymap.set('i', '<C-;>', '::')

-- --- Change color column to 100 to align with rust formatting guidelines
vim.o.colorcolumn = '100'

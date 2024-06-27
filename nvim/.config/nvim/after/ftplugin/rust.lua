vim.api.nvim_create_autocmd({ 'FileType' }, {
  desc = 'Force commentstring to include spaces',
  -- group = ...,
  callback = function(event)
    local cs = vim.bo[event.buf].commentstring
    vim.bo[event.buf].commentstring = cs:gsub('(%S)%%s', '%1 %%s'):gsub('%%s(%S)', '%%s %1')
  end,
})

-- Easy insertion of double ::
vim.keymap.set('i', '<C-;>', '::')

--- Change color column to 100 to align with rust formatting guidelines
vim.api.nvim_create_autocmd('Filetype',
    { pattern = 'rust', command = 'set colorcolumn=100' })

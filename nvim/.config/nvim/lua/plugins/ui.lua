return {

    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = false,
                theme = 'everforest',
                component_separators = '|',
                section_separators = '',
            },
            tabline = {
                lualine_a = { 'buffers' },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { 'tabs' },
            }
        },
    },

}

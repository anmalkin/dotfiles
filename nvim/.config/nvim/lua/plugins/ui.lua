return {

  {
    "neanias/everforest-nvim",
    lazy = false,
    name = "everforest",
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme everforest]])
    end
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        theme = 'auto',
        icons_enabled = false,
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

  { 'rrethy/vim-illuminate' },

}

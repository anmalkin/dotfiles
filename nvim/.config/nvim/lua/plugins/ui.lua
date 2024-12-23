vim.api.nvim_create_user_command("LualineTheme", function()
  local theme = vim.fn.input("Theme: ")
  require('lualine').setup({ options = { theme = theme } })
end, {})

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
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    opts = {
      variant = "moon",
      dark_variant = "moon",
      styles = {
        transparency = true
      }
    },
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

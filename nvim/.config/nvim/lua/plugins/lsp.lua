return {
  {
    "j-hui/fidget.nvim",
    opts = {
      progress = {
        ignore_empty_message = true
      },
    },
  },

  {
    'neovim/nvim-lspconfig',
  },

  {
    "folke/lazydev.nvim",
    name = "lazydev",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}

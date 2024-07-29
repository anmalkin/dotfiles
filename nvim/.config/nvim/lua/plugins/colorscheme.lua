return {

    {
        "neanias/everforest-nvim",
        lazy = false,
        name = "everforest",
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme everforest]])
        end,
    },

}

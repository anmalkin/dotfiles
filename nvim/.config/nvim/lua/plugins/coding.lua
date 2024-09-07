return {
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            -- Adds LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'lazydev',

            -- Snippet Engine & its associated nvim-cmp source
            'luasnip',
            'mrcjkb/haskell-snippets.nvim',
            "rafamadriz/friendly-snippets",
        },
        config = function()
            local cmp = require 'cmp'
            local luasnip = require 'luasnip'
            require('luasnip.loaders.from_vscode').lazy_load()
            luasnip.config.setup {}

            cmp.setup {
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                completion = {
                    completeopt = 'menu,menuone,noselect',
                },
                mapping = cmp.mapping.preset.insert {
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<D-n>'] = cmp.mapping.select_next_item(),
                    ['<D-p>'] = cmp.mapping.select_prev_item(),
                    ['<Tab>'] = cmp.mapping.select_next_item(),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<D-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<D-f>'] = cmp.mapping.scroll_docs(4),
                    ['<CR>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false,
                    },
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'path' },
                    { name = 'buffer' },
                },
            }
        end
    },

    {
        'L3MON4D3/LuaSnip',
        dependencies = { 'saadparwaiz1/cmp_luasnip' },
        name = "luasnip",
        opts = {},
        keys = {
            { mode = { "i", "s" }, "<C-k>", function() require("luasnip").jump(1) end,  { silent = true } },
            { mode = { "i", "s" }, "<C-j>", function() require("luasnip").jump(-1) end, { silent = true } },
            { mode = { "i", "s" }, "<D-k>", function() require("luasnip").jump(1) end,  { silent = true } },
            { mode = { "i", "s" }, "<D-j>", function() require("luasnip").jump(-1) end, { silent = true } },
        }
    },

    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                -- Add languages to be installed here that you want installed for treesitter
                ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'haskell' },
                sync_install = false,
                auto_install = false,
                ignore_install = {},
                modules = {},

                highlight = { enable = true },
                indent = { enable = true },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = '<c-space>',
                        node_incremental = '<c-space>',
                        scope_incremental = '<c-s>',
                        node_decremental = '<Tab>',
                    },
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ['aa'] = '@parameter.outer',
                            ['ia'] = '@parameter.inner',
                            ['af'] = '@function.outer',
                            ['if'] = '@function.inner',
                            ['ac'] = '@class.outer',
                            ['ic'] = '@class.inner',
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_next_start = {
                            [']m'] = '@function.outer',
                            [']]'] = '@class.outer',
                        },
                        goto_next_end = {
                            [']M'] = '@function.outer',
                            [']['] = '@class.outer',
                        },
                        goto_previous_start = {
                            ['[m'] = '@function.outer',
                            ['[['] = '@class.outer',
                        },
                        goto_previous_end = {
                            ['[M'] = '@function.outer',
                            ['[]'] = '@class.outer',
                        },
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            ['<leader>a'] = '@parameter.inner',
                        },
                        swap_previous = {
                            ['<leader>A'] = '@parameter.inner',
                        },
                    },
                },
            }
        end,
    },

    {
        "folke/todo-comments.nvim",
        event = "InsertEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        opts = {},
    },

    {
        "ggandor/leap.nvim",
        lazy = false,
        config = function()
            require('leap').add_default_mappings()
        end,
    },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = function()
            require('nvim-autopairs').setup({
                enable_check_bracket_line = false,
                ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
                enable_bracket_in_quote = false,
            })

            local npairs = require("nvim-autopairs")
            local rule = require("nvim-autopairs.rule")
            local cond = require("nvim-autopairs.conds")

            npairs.add_rules({
                rule("|", "|", { "rust" })
                    :with_move(cond.after_regex("|")),
                rule("<", ">")
                    :with_pair(cond.before_regex("%a+"))
                    :with_move(function(opts)
                        return opts.char == ">"
                    end),
            })
        end,
    },

}

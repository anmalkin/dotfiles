return {

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
        keys = function()
            local harpoon = require("harpoon")
            return
            {
                { "<leader>p", function() harpoon:list():add() end,     { desc = "Add to Harpoon list" } },
                { "<C-e>", function() harpoon.ui:toggle_quick_menu(require("harpoon"):list()) end,
                    { desc = "Toggle Harpoon menu" } },
                { "<C-j>",     function() harpoon:list():select(1) end, { desc = "Select 1 from Harpoon list" } },
                { "<C-k>",     function() harpoon:list():select(2) end, { desc = "Select 2 from Harpoon list" } },
                { "<C-l>",     function() harpoon:list():select(3) end, { desc = "Select 3 from Harpoon list" } },
                { "<C-;>",     function() harpoon:list():select(4) end, { desc = "Select 4 from Harpoon list" } },
                -- MacOS versions
                { "<D-a>",     function() harpoon:list():add() end,     { desc = "Add to Harpoon list" } },
                { "<D-e>", function() harpoon.ui:toggle_quick_menu(require("harpoon"):list()) end,
                    { desc = "Toggle Harpoon menu" } },
                { "<D-j>", function() harpoon:list():select(1) end, { desc = "Select 1 from Harpoon list" } },
                { "<D-k>", function() harpoon:list():select(2) end, { desc = "Select 2 from Harpoon list" } },
                { "<D-l>", function() harpoon:list():select(3) end, { desc = "Select 3 from Harpoon list" } },
                { "<D-;>", function() harpoon:list():select(4) end, { desc = "Select 4 from Harpoon list" } },
            }
        end
    },

    {
        'stevearc/oil.nvim',
        lazy = false,
        opts = {
            keymaps = {
                ["<D-c>"] = "actions.close",
            },
        },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "<leader>o", "<cmd>Oil<CR>", { desc = 'Open Oil' } },
            { "<D-o>",     "<cmd>Oil<CR>", { desc = 'Open Oil' } },
        }
    },

    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        opts = {
            defaults = {
                mappings = {
                    i = {
                        ['<C-u>'] = false,
                        ['<C-d>'] = false,
                        ['<D-n>'] = "move_selection_next",
                        ['<D-p>'] = "move_selection_previous",
                    },
                },
            },
        },
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- Fuzzy Finder Algorithm which requires local dependencies to be built.
            -- Only load if `make` is available. Make sure you have the system
            -- requirements installed.
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
        keys = {
            { '<leader>?',       require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' } },
            { '<leader><space>', require('telescope.builtin').buffers,  { desc = '[ ] Find existing buffers' } },
            { '<leader>/', function()
                -- You can pass additional configuration to telescope to change theme, layout, etc.
                require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end, { desc = '[/] Fuzzily search in current buffer' } },
            { '<C-p>',      require('telescope.builtin').git_files,   { desc = 'Search [G]it [F]iles' } },
            { '<D-p>',      require('telescope.builtin').git_files,   { desc = 'Search [G]it [F]iles' } },
            { '<leader>sf', require('telescope.builtin').find_files,  { desc = 'Search [F]iles' } },
            { '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' } },
        }
    },

    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup({
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', ']g', function()
                        if vim.wo.diff then return ']c' end
                        vim.schedule(function() gs.next_hunk() end)
                        return '<Ignore>'
                    end, {
                        expr = true,
                        desc = 'Next hunk'
                    })

                    map('n', '[g', function()
                        if vim.wo.diff then return '[c' end
                        vim.schedule(function() gs.prev_hunk() end)
                        return '<Ignore>'
                    end, {
                        expr = true,
                        desc = 'Previous hunk'
                    })

                    -- Actions
                    map('n', '<leader>gs', gs.stage_hunk, { desc = "[S]tage hunk" })
                    map('n', '<leader>gr', gs.reset_hunk, { desc = "[R]eset hunk" })
                    map('n', '<leader>gu', gs.undo_stage_hunk, { desc = "[U]ndo stage hunk" })
                    map('n', '<leader>gp', gs.preview_hunk, { desc = "[P]review hunk" })
                    -- Text object
                    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                end
            })

            local function diff_source()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                    return {
                        added = gitsigns.added,
                        modified = gitsigns.changed,
                        removed = gitsigns.removed
                    }
                end
            end

            require 'lualine'.setup {
                sections = {
                    lualine_b = { { 'diff', source = diff_source }, },
                }
            }
        end
    },

}

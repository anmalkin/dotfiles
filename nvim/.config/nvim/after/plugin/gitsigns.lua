-- Gitsigns setup
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
        end, { expr = true })

        map('n', '[g', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, { expr = true })

        -- Actions
        map('n', '<leader>gs', gs.stage_hunk, { desc = "[S]tage hunk" })
        map('n', '<leader>gr', gs.reset_hunk, { desc = "[R]eset hunk" })
        map('n', '<leader>gu', gs.undo_stage_hunk, { desc = "[U]ndo stage hunk" })
        map('n', '<leader>gp', gs.preview_hunk, { desc = "[P]review hunk" } )
        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
})

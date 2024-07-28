require("oil").setup({
    keymaps = {
        ["<D-c>"] = "actions.close",
    },
})

-- Open oil
vim.keymap.set("n", "<leader>o", "<cmd>Oil<CR>", { desc = 'Open Oil' })
vim.keymap.set("n", "<D-o>", "<cmd>Oil<CR>", { desc = 'Open Oil' })

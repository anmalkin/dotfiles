local harpoon = require("harpoon")

harpoon:setup({})

vim.keymap.set("n", "<leader>p", function() harpoon:list():add() end, { desc = "Add to Harpoon list" })
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    { desc = "Toggle Harpoon menu" })
vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end, { desc = "Select 1 from Harpoon list" })
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end, { desc = "Select 2 from Harpoon list" })
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end, { desc = "Select 3 from Harpoon list" })
vim.keymap.set("n", "<C-;>", function() harpoon:list():select(4) end, { desc = "Select 4 from Harpoon list" })

-- MacOS versions
vim.keymap.set("n", "<leader>p", function() harpoon:list():add() end, { desc = "Add to Harpoon list" })
vim.keymap.set("n", "<D-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    { desc = "Toggle Harpoon menu" })
vim.keymap.set("n", "<D-j>", function() harpoon:list():select(1) end, { desc = "Select 1 from Harpoon list" })
vim.keymap.set("n", "<D-k>", function() harpoon:list():select(2) end, { desc = "Select 2 from Harpoon list" })
vim.keymap.set("n", "<D-l>", function() harpoon:list():select(3) end, { desc = "Select 3 from Harpoon list" })
vim.keymap.set("n", "<D-;>", function() harpoon:list():select(4) end, { desc = "Select 4 from Harpoon list" })

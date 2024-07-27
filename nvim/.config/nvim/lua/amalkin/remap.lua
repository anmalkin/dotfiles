-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Move lines up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Keep cursor in place as you move up and down
vim.keymap.set('n', '<C-d>', "<C-d>zz")
vim.keymap.set('n', '<C-u>', "<C-u>zz")
vim.keymap.set('n', 'n', "nzzzv")
vim.keymap.set('n', 'N', "Nzzzv")

-- Worst place in the universe -Primeagen
vim.keymap.set("n", "Q", "<nop>")

-- Easy insertion of trailing ; and ,
vim.keymap.set("i", ";;", "<Esc>A;<Esc>", { desc = "Insert trailing ';' (semicolon)"})
vim.keymap.set("i", ",,", "<Esc>A,<Esc>", { desc = "Insert trailing ',' (comma)"})

-- make missing : less annoying
vim.keymap.set('n', ';', ':')

-- Move between windows
vim.keymap.set('n', '<leader>h', '<C-w>h')
vim.keymap.set('n', '<leader>j', '<C-w>j')
vim.keymap.set('n', '<leader>k', '<C-w>k')
vim.keymap.set('n', '<leader>l', '<C-w>l')

-- Move between buffers
vim.keymap.set("n", "L", ":bnext<cr>", { desc = 'Move to next buffer' })
vim.keymap.set("n", "H", ":bprevious<cr>", { desc = 'Move to prevous buffer' })

-- Delete buffer without closing window
vim.keymap.set('n', "<C-q>", '<cmd>bp<bar>sp<bar>bn<bar>bd<CR>')

-- Disable arrow keys
vim.keymap.set({ 'n', 'i' }, "<Up>", "<nop>")
vim.keymap.set({ 'n', 'i' }, "<Down>", "<nop>")
vim.keymap.set({ 'n', 'i' }, "<Left>", "<nop>")
vim.keymap.set({ 'n', 'i' }, "<Right>", "<nop>")

-- Exit terminal
vim.keymap.set({ 't' }, "<Esc>", "<C-Bslash><C-n>")

-- MacOS command keybindings
vim.keymap.set('n', '<D-d>', "<C-d>zz")
vim.keymap.set('n', '<D-u>', "<C-u>zz")
vim.keymap.set('v', '<D-u>', "<C-u>")
vim.keymap.set('v', '<D-d>', "<C-d>")
vim.keymap.set('n', '<D-w>', '<C-w>')
vim.keymap.set('n', '<D-r>', '<C-r>')
vim.keymap.set('n', '<D-s>', '<cmd>wa<Enter>')
vim.keymap.set('n', '<D-w><D-d>', vim.diagnostic.open_float)
vim.keymap.set('n', '<D-w>d', vim.diagnostic.open_float)
vim.keymap.set('n', "<D-q>", '<cmd>bp<bar>sp<bar>bn<bar>bd<CR>')

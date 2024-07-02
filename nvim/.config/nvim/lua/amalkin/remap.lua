-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Move lines up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Keep cursor in place as you move up and down
vim.keymap.set('n', '<D-d>', "<C-d>zz")
vim.keymap.set('n', '<D-u>', "<C-u>zz")
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
vim.keymap.set('n', "<C-q>", ':bp<bar>sp<bar>bn<bar>bd<CR>')

-- Disable arrow keys
vim.keymap.set({ 'n', 'i' }, "<Up>", "<nop>")
vim.keymap.set({ 'n', 'i' }, "<Down>", "<nop>")
vim.keymap.set({ 'n', 'i' }, "<Left>", "<nop>")
vim.keymap.set({ 'n', 'i' }, "<Right>", "<nop>")

-- Exit terminal
vim.keymap.set({ 't' }, "<Esc>", "<C-Bslash><C-n>")

-- Open a terminal at the bottom of the screen with a fixed height.
vim.keymap.set("n", ",st", function()
  vim.cmd.new()
  vim.cmd.wincmd "J"
  vim.api.nvim_win_set_height(0, 12)
  vim.wo.winfixheight = true
  vim.cmd.term()
end)

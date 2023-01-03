local keymap = vim.keymap
vim.g.mapleader = ' '
keymap.set('n', '<leader>pv', vim.cmd.Ex)
keymap.set('n', '<leader>w', '<cmd>write<cr>', {desc = 'save'})
keymap.set({'n', 'x'}, 'x', '"_x')
keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')

-- window keymap
keymap.set('n', '<leader>sv', "<C-w>v")
keymap.set('n', '<leader>sh', "<C-w>s")
keymap.set('n', '<leader>se', "<C-w>=")
keymap.set('n', '<leader>sx', ":close<CR>")


keymap.set('n', '<leader>to', ":tabnew<CR>")
keymap.set('n', '<leader>tx', ":tabclose<CR>")
keymap.set('n', '<leader>tn', ":tabn<CR>")
keymap.set('n', '<leader>tp', ":tabp<CR>")
keymap.set('n', '<leader>y', "\"+y")
keymap.set('v', '<leader>y', "\"+y")
keymap.set('n', '<leader>Y', "\"+Y")
keymap.set("i", "<C-c>", "<Esc>")

















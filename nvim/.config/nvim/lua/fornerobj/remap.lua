vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Clear search highlights with <Esc>
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open diagnostics' })

-- Surround highlighted text with parentheses or quotes
vim.keymap.set('v', '<leader>s(', 'xi()<Esc>P', { desc = 'Surround selection with parentheses' })
vim.keymap.set('v', '<leader>s\'', 'xi\'\'<Esc>P', { desc = 'Surround selection with parentheses' })
vim.keymap.set('v', '<leader>s\"', 'xi\"\"<Esc>P', { desc = 'Surround selection with parentheses' })

-- open a terminal in a vertical split
vim.keymap.set('n', '<leader>vt', function()
  vim.cmd("set splitright")
  vim.cmd('vsplit')
  vim.cmd('terminal')
end, { desc = 'Open terminal in a vertical split on the right' })

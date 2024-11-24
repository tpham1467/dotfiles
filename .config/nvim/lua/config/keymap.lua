vim.g.mapleader = " "

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- save document
vim.keymap.set("n", "<C-s>", vim.cmd.w, { desc = "Save Buffer", silent = true })
vim.keymap.set("i", "<C-s>", vim.cmd.w, { desc = "Save Buffer", silent = true })
vim.keymap.set("v", "<C-s>", vim.cmd.w, { desc = "Save Buffer", silent = true })


-- Split navigation and management
vim.keymap.set('n', '<leader>bb', ':bprev<CR>', { desc = 'Goto Previous Buffer', silent = true })
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = 'Goto Next Buffer', silent = true })
vim.keymap.set('n', '<C-left>', ':bprev<CR>', { desc = 'Goto Previous Buffer', silent = true })
vim.keymap.set('n', '<C-right>', ':bnext<CR>', { desc = 'Goto Next Buffer', silent = true })

vim.keymap.set('n', '<leader>bd', ':bprev<CR>:bdelete #<CR>', { desc = 'Close Current Buffer' })
vim.keymap.set('n', '<leader>bD', "<cmd>:%bd<CR>", { desc = 'Close All Buffers' })
vim.keymap.set('n', '<leader>bC', "<cmd>%bd|e#|bd#<CR>", { desc = 'Close All Buffers But This' })
vim.keymap.set('n', '<leader>br', "<cmd>:e!<CR>", { desc = 'Reload Buffer' })


-- Move between splits
vim.keymap.set({ 'n', }, '<C-h>', ':wincmd h<CR>', { desc = 'Goto Left Buffer', silent = true })
vim.keymap.set({ 'n', }, '<C-l>', ':wincmd l<CR>', { desc = 'Goto Right Buffer', silent = true })
vim.keymap.set({ 'n', }, '<C-j>', ':wincmd j<CR>', { desc = 'Goto Below Buffer', silent = true })
vim.keymap.set({ 'n', }, '<C-k>', ':wincmd k<CR>', { desc = 'Goto Above Buffer', silent = true })

vim.keymap.set('t', '<C-h>', '[[<Cmd>wincmd h<CR>]]', { desc = 'Goto Left Buffer', silent = true, buffer = 0 })
vim.keymap.set('t', '<C-l>', '[[<Cmd>wincmd l<CR>]]', { desc = 'Goto Right Buffer', silent = true, buffer = 0 })
vim.keymap.set('t', '<C-j>', '[[<Cmd>wincmd j<CR>]]', { desc = 'Goto Below Buffer', silent = true, buffer = 0 })
vim.keymap.set('t', '<C-k>', '[[<Cmd>wincmd k<CR>]]', { desc = 'Goto Above Buffer', silent = true, buffer = 0 })

-- Reise splits
-- vim.keymap.set({ 'n', 't' }, '<S-Left>', ':vertical-resize +1<CR>', { silent = true })
-- vim.keymap.set({ 'n', 't' }, '<S-Right>', ':vertical-resize -1<CR>', { silent = true })
vim.keymap.set({ 'n', 't' }, '<S-Left>', ':vertical res +1^M<CR>', { silent = true })
vim.keymap.set({ 'n', 't' }, '<S-Right>', ':vertical res -1^M<CR>', { silent = true })
vim.keymap.set({ 'n', 't' }, '<C-Up>', ':resize -1<CR>', { silent = true })
vim.keymap.set({ 'n', 't' }, '<C-Down>', ':resize +1<CR>', { silent = true })
vim.keymap.set({ 'n' }, '<S-l>', '10zl', { desc = "Scroll To The Right", silent = true })
vim.keymap.set({ 'n' }, '<S-h>', '10zh', { desc = "Scroll To The Left", silent = true })





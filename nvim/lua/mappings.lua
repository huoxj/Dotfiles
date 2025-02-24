local kmset = vim.keymap.set

-- ==========
-- neo-tree
-- ==========
kmset('n', '<C-b>', '<cmd>Neotree toggle<CR>', { desc = 'Toggle file tree' }) 

-- ==========
-- Telescope
-- ==========
kmset('n', 'ff', '<cmd>Telescope find_files<CR>', { desc = 'Telescope find files' })
kmset('n', 'fg', '<cmd>Telescope live_grep<CR>', { desc = 'Telescope live grep' })
kmset('n', 'fb', '<cmd>Telescope buffers<CR>', { desc = 'Telescope buffers' })
kmset('n', 'fh', '<cmd>Telescope help_tags<CR>', { desc = 'Telescope help tags' })

-- ==========
-- BufferLine
-- ==========
-- Buffer jumping
kmset('n', '<leader>1', '<cmd>lua require("bufferline").go_to(1, true)<CR>')
kmset('n', '<leader>2', '<cmd>lua require("bufferline").go_to(2, true)<CR>')
kmset('n', '<leader>3', '<cmd>lua require("bufferline").go_to(3, true)<CR>')
kmset('n', '<leader>4', '<cmd>lua require("bufferline").go_to(4, true)<CR>')
kmset('n', '<leader>5', '<cmd>lua require("bufferline").go_to(5, true)<CR>')
kmset('n', '<leader>6', '<cmd>lua require("bufferline").go_to(6, true)<CR>')
kmset('n', '<leader>7', '<cmd>lua require("bufferline").go_to(7, true)<CR>')
kmset('n', '<leader>8', '<cmd>lua require("bufferline").go_to(8, true)<CR>')
kmset('n', '<leader>9', '<cmd>lua require("bufferline").go_to(9, true)<CR>')
-- Buffer switching
kmset('n', '<leader>]', '<cmd>BufferLineCycleNext<CR>')
kmset('n', '<leader>[', '<cmd>BufferLineCyclePrev<CR>')
-- Close current buffer
kmset('n', '<leader>w','<cmd>Bdelete! %<CR>')

-- ==========
-- Toggleterm
-- ==========
-- Moving inside and outside term
local tt_opts = {buffer = 0}
kmset('t', 'jj', [[<C-\><C-n>]], tt_opts)

-- ==========
-- LSP
-- ==========
kmset('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')
kmset('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
kmset('n', '<S-A-f>', ':lua vim.lsp.buf.format()<CR>')

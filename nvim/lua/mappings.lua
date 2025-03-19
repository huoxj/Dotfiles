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
kmset('n', 'fl', '<cmd>Telescope current_buffer_fuzzy_find<CR>', { desc = 'Telescope current buffer fuzzy find' })
kmset('n', 'fb', '<cmd>Telescope buffers<CR>', { desc = 'Telescope buffers' })
kmset('n', 'fh', '<cmd>Telescope help_tags<CR>', { desc = 'Telescope help tags' })
kmset('n', 'fkm', '<cmd>Telescope keymaps<CR>', { desc = 'Telescope keymaps' })

-- ==========
-- BufferLine
-- ==========
-- Buffer jumping
kmset('n', '<A-1>', '<cmd>lua require("bufferline").go_to(1, true)<CR>')
kmset('n', '<A-2>', '<cmd>lua require("bufferline").go_to(2, true)<CR>')
kmset('n', '<A-3>', '<cmd>lua require("bufferline").go_to(3, true)<CR>')
kmset('n', '<A-4>', '<cmd>lua require("bufferline").go_to(4, true)<CR>')
kmset('n', '<A-5>', '<cmd>lua require("bufferline").go_to(5, true)<CR>')
kmset('n', '<A-6>', '<cmd>lua require("bufferline").go_to(6, true)<CR>')
kmset('n', '<A-7>', '<cmd>lua require("bufferline").go_to(7, true)<CR>')
kmset('n', '<A-8>', '<cmd>lua require("bufferline").go_to(8, true)<CR>')
kmset('n', '<A-9>', '<cmd>lua require("bufferline").go_to(9, true)<CR>')
-- Buffer switching
kmset('n', '<A-]>', '<cmd>BufferLineCycleNext<CR>')
kmset('n', '<A-[>', '<cmd>BufferLineCyclePrev<CR>')
-- Close current buffer
kmset('n', '<leader>w','<cmd>Bdelete! %<CR>')

-- ==========
-- Toggleterm
-- ==========
-- Moving inside and outside term
kmset("t", "jd", "<C-\\><C-n>", {noremap = true, silent = true})
kmset("t", "jl", "<Cmd> wincmd l<CR>", {noremap = true, silent = true})
kmset("t", "jh", "<Cmd> wincmd h<CR>", {noremap = true, silent = true})
kmset("t", "jj", "<Cmd> wincmd j<CR>", {noremap = true, silent = true})
kmset("t", "jk", "<Cmd> wincmd k<CR>", {noremap = true, silent = true})

-- ==========
-- LSP
-- ==========
kmset('n', '<leader>rn', '<cmd>Lspsaga rename<CR>')
kmset('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
kmset('n', '<S-A-f>', function()
    vim.cmd('normal! gg=G')
    vim.lsp.buf.format({ async = true })
end, ({ noremap = true, silent = true })
)
-- Lspsaga
kmset('n', 'K', '<cmd>Lspsaga hover_doc<CR>')

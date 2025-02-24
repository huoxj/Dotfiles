-- Vimrc
vim.cmd.source(vim.fn.stdpath("config") .. "/vimrc")

-- Plugin mappings
require("mappings")

-- Lazy-nvim 
require("lazynvim-init")

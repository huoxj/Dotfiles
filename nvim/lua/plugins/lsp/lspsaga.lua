return {
    'nvimdev/lspsaga.nvim',
    event = 'LspAttach',
    config = function()
        require('lspsaga').setup({
            diagnostic = {
                enable = false
            },
            symbol_in_winbar = {
                enable = false,
                folder_level = 0,
            }
        })

    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    }
}

return {
    'navarasu/onedark.nvim',
    config = function()
        require('onedark').setup({
            style = 'warmer',
            code_style = {
                comments = 'italic',
                keywords = 'none',
                functions = 'none',
                strings = 'none',
                variables = 'none'
            }
        })

        vim.cmd('colorscheme onedark')
    end,
}

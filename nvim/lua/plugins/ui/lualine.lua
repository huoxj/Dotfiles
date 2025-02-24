return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function (_, opts)
        vim.opt.cmdheight = 0
        require('lualine').setup({
        })
    end,
}

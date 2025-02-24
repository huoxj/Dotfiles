return {
    'akinsho/bufferline.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        "moll/vim-bbye"
    },
    opts = {},
    lazy = false,
    config = function()
        require('bufferline').setup({
            options = {
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "Sidebar",
                        highlight = "Directory",
                        separator = true,
                        text_align = "left"
                    }
                },
                close_command = "Bdelete! %d",
                right_mouse_command = "Bdelete! %d"
            }
        })
    end,
}

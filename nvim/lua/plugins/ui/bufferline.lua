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
                numbers = function(opts)
                    return string.format("%s", opts.ordinal)
                end,
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
                right_mouse_command = "Bdelete! %d",
                custom_filter = function(buf_number, buf_nums)
                    local ft = vim.bo[buf_number].filetype
                    -- Do not override
                    if ft == "toggleterm" or ft == "trouble" or ft == "help" or ft == "qf" then
                        return false
                    end
                    return true
                end,
            },
        })
    end,
}

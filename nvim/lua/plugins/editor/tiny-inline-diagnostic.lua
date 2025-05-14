return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
        require('tiny-inline-diagnostic').setup({
            present = "powerline",
            multilines = {
                enabled = true,
                always_show = true
            }

        })
        vim.diagnostic.config({ virtual_text = false })
    end
}

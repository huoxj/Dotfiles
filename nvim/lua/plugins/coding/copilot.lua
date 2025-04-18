return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
        debug = true,
        suggestion = {
            auto_trigger = true,
            debounce = 75,
            keymap = {
                accept = "<M-CR>",
                accept_word = "<M-'>",
                next = "<M-]>",
                prev = "<M-[>",
            },
        },
        panel = { enabled = false },
        filetypes = {
            markdown = true,
            help = false,
            cuda = true,
        },
    },
    config = function(_, opts)
        require("copilot").setup(opts)
    end,
}

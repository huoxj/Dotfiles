return {
    "numToStr/Comment.nvim",
    event = { "BufRead" },
    version = "*",
    opts = {
        padding = true,
        sticy  = true,
        ignore = "^$",
        toggler = {
            line = "<leader>cc",
            block = "<leader>CC",
        },
        opleader = {
            line = "<leader>c",
            block = "<leader>C",
        },
        extra = {
            above = "<leader>cO",
            below = "<leader>co",
            eol = "<leader>cA",
        },
        mappings = {
            basic = true,
            extra = true,
        },
    }
}

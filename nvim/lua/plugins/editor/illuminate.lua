return {
    "RRethy/vim-illuminate",
    event = "BufRead",
    opts = {
        delay = 200,
        large_file_cutoff = 2000,
        large_file_overrides = {
            providers = { "lsp" },
        },
    },
    config = function(_, opts)
        require("illuminate").configure(opts)
    end,
    keys = {
        { "]]", desc = "Next Reference" },
        { "[[", desc = "Prev Reference" },
    },
}

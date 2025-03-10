return {
    "nvim-treesitter/nvim-treesitter",
    event = { "VeryLazy" },
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "c", "cpp", "lua" },
        highlight = {
            enable = true,
            disable = function(lang, buf)
                local max_filesize = 100 * 1024
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<CR>',
                node_incremental = '<CR>',
                node_decremental = '<BS>',
                scope_incremental = '<TAB>'
            }
        }
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
        -- vim.wo.foldmethod = "expr"
        -- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
    end,
}

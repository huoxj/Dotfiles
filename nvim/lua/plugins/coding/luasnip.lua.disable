return {
    { 
        "L3MON4D3/LuaSnip",
        version = "V2.*",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip").config.set_config({
                history = true,
            })
        end,
    },
}

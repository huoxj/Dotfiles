CMP_SOURCES = {
    luasnip = { name = "luasnip", menu = "[Snip]" },
    nvim_lsp = {
        name = "nvim_lsp",
        menu = "[LSP]",
        entry_filter = function(entry)
            return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind()
        end,
    },
    path = { name = "path", menu = "[Path]" },
    buffer = { name = "buffer", menu = "[Buf]" },
    cmdline = { name = "cmdline", menu = "[Cmd]" },
}
return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
    },
    -- cmp的配置
    config = function()
        local cmp = require("cmp")
        local compare = require("cmp.config.compare")
 
        -- 这里设置的是插入模式下的补全source
        cmp.setup({
        -- 补全菜单和文档框，是否要有边框，以及高亮组等
            window = {
                completion = cmp.config.window.bordered({
                    border = "none",
                    winhighlight = "Normal:Pmenu,CursorLine:PmenuSel", -- 重点是CursorLine
                }),
                documentation = cmp.config.window.bordered({
                    border = "none",
                    winhighlight = "Normal:CmpDocNormal",
                }),
            },
            -- 补全菜单的格式，见下面的效果图
            formatting = {
                fields = { "abbr", "kind", "menu" },
                expandable_indicator = false,
                format = function(entry, vim_item)
                    vim_item.menu = CMP_SOURCES[entry.source.name].menu
                    return vim_item
                end,
            },
 
            -- global setting and can be overwritten in sources
            experimental = { ghost_text = false },
            sources = {
                CMP_SOURCES.nvim_lsp,
                CMP_SOURCES.luasnip,
                CMP_SOURCES.buffer,
                CMP_SOURCES.path,
            },
 
            -- 补全项的排序算法权重，我也比较迷惑
            sorting = {
                comparators = {
                    compare.score,
                    compare.kind,
                    compare.exact,
                    compare.length,
                    compare.offset,
                    compare.sort_text,
                },
            },
 
            -- snippet settting in luasnip
            mapping = cmp.mapping.preset.insert({
                -- expand snippet setting in luasnip
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),
                -- selecting items
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                -- toggle cmp 菜单
                ["<C-Space>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.abort()
                    else
                        cmp.complete()
                    end
                end),
                -- 回车选中
                ["<Tab>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
            }),
        })
 
        -- 搜索模式
        for _, cmd_type in ipairs({ "/", "?" }) do
            cmp.setup.cmdline(cmd_type, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    CMP_SOURCES.buffer,
                },
            })
        end
        -- 命令行模式
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                -- 有path 的时候屏蔽cmd
                vim.tbl_extend("force", CMP_SOURCES.path, { group_index = 1 }),
                vim.tbl_extend("force", CMP_SOURCES.cmdline, { group_index = 2 }),
            },
        })
    end,
}

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    -- 禁用lsp 语义高亮
    -- client.server_capabilities.semanticTokensProvider = nil
end
 
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    -- snippet禁用无效,要在cmp里设置
    snippetSupport = false,
}
 
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "folke/neodev.nvim", version = "*", config = true, lazy = true },
        "williamboman/mason.nvim",
        { "williamboman/mason-lspconfig.nvim", version = "*", config = true },
    },
    opts = {},
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("mason-lspconfig").setup_handlers({
            function(server_name)
                local configs = {
                    on_attach = on_attach,
                    capabilities = capabilities,
                    root_dir = require("lspconfig").util.root_pattern(vim.g.ROOT_MARKERS),
                }
                -- 搜索 setting 下目录是否有局部自定义配置
                local file_path = vim.fn.expand("~/.config/nvim/lua/plugins/lsp/settings/" .. server_name .. ".lua")
                local stat = vim.loop.fs_stat(file_path)
                if stat then
                    local spec_configs = require("plugins.lsp.settings." .. server_name)
                    configs = vim.tbl_deep_extend("force", configs, spec_configs)
                    require("lspconfig")[server_name].setup(configs)
                end
            end,
        })

        -- inlay_hints
        vim.lsp.inlay_hint.enable(true)
    end,
}

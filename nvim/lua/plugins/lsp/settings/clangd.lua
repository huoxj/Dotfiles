return {
    capabilities = {
        offsetEncoding = { "utf-16" }, -- 解决全局的utf8编码问题
    },
    cmd = {
        "clangd",
        -- 开启clang-tidy
        "--clang-tidy",
    },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
    -- 有些lsp可以用过这个字段来进行设置
    settings = {
 
    }
}

return {
    capabilities = {
        offsetEncoding = { "utf-16" }, -- 解决全局的utf8编码问题
    },
    cmd = {
        "clangd",
        -- 开启clang-tidy
        "--clang-tidy",
        -- 关闭自动添加头文件
        "--header-insertion=never"
    },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "cu" },
    -- 有些lsp可以用过这个字段来进行设置
    settings = {
        InlayHints = {
            Designators = true,
            Enabled = true,
            ParameterNames = true,
            DeducedTypes = true,
        }
    }
}

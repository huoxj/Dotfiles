return {
    capabilities = {
        offsetEncoding = { "utf-16" }, -- 解决全局的utf8编码问题
    },
    cmd = {
        "clangd",
        "--clang-tidy",
        "--header-insertion=never",
    },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "cu" },
    settings = {
        InlayHints = {
            Designators = true,
            Enabled = true,
            ParameterNames = true,
            DeducedTypes = true,
        }
    }
}

return {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    dependencies = {
        "neovim/nvim-lspconfig",
    },
    config = function(_, opts)
        require('lsp_signature').on_attach() 
    end
}

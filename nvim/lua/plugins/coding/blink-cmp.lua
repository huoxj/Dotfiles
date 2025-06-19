return {
    'saghen/blink.cmp',
    version = '1.*',
    opts = {
        keymap = { 
            preset = 'super-tab',
            ['<C-j>'] = { 'select_next', 'fallback' },
            ['<C-k>'] = { 'select_prev', 'fallback' },
            
        },
        sources = {
            default = { 'lsp', 'path', 'buffer' },
        },
        signature = { enabled = true },
        completion = {
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 1000,
            },
        },
    }
}

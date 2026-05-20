require("blink.cmp").setup({
    keymap = { preset = 'super-tab' },

    appearance = {
        nerd_font_variant = 'mono',
        use_nvim_cmp_as_default = true
    },

    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 200
        }
    },

    signature = {
        enabled = true
    },

    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    fuzzy = {
        implementation = "prefer_rust_with_warning"
    }
})

local cmp = require("cmp")
cmp.setup {
    snippet = {
        expand = function(args)
            require 'luasnip'.lsp_expand(args.body)
        end
    },
    preselect = cmp.PreselectMode.Item,
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    mapping = cmp.mapping.preset.insert(
        {

            ["<Tab>"] = cmp.mapping(
                function()
                    if cmp.visible() then
                        cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
                    elseif require("luasnip").expand_or_jumpable() then
                        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
                            "")
                    else
                        -- tab is broken idk why, but shift tab in this context works just like tab
                        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<S-Tab>',true,false,true),'m',true)
                    end
                end, { "i", "s" })
        }
    ),
    sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' }, -- For luasnip users.
        },
        {
            { name = 'buffer' },
        }),
    {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require("cmp-under-comparator").under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
}


-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

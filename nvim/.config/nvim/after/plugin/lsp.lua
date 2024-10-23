local lsp_zero = require('lsp-zero')
local cmp = require('cmp')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    local opts = { buffer = bufnr, remap = false }
    lsp_zero.default_keymaps(opts)

    -- vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
    -- vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "<leader>]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>td", function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set("n", "<leader>h", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>fb", function() vim.lsp.buf.format() end, opts)


    lsp_zero.omnifunc.setup({
        autocomplete = true,
        use_fallback = true,
        update_on_delete = true,
        select_behavior = 'insert',
        -- mappings = {
        --     confirm = "<TAB>"
        -- },
        -- preselect = cmp.PreselectMode.Item,
        -- completion = {
        --     completeopt = 'menu,menuone,noinsert'
        -- },
    })
end)

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('mason-lspconfig').setup({
    ensure_installed = { 'pylsp' }, -- Install pylsp if it's not already installed
    handlers = {
        function(server_name)
            -- Default handler for any language server without a custom handler
            require('lspconfig')[server_name].setup({
                capabilities = capabilities,
                on_attach = lsp_zero.on_attach,
            })
        end,
        -- Add custom handler for pylsp
        ['pylsp'] = function()
            require('lspconfig').pylsp.setup({
                settings = {
                    pylsp = {
                        plugins = {
                            rope_autoimport = {
                                enabled = true,                    -- Enable rope_autoimport
                                completions = { enabled = true },  -- Enable completions
                                code_actions = { enabled = true }, -- Enable code actions
                            },
                            isort = {
                                enabled = true, -- Optionally enable isort for organizing imports
                            },
                        },
                    },
                },
                capabilities = capabilities,
                on_attach = lsp_zero.on_attach,
            })
        end,
    },
})

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    lsp_zero.default_keymaps(opts)

    -- Keymaps
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>cc", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "<leader>]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>td", function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set("n", "<leader>h", function() vim.lsp.buf.signature_help() end, opts)

    -- Formatting via Conform
    vim.keymap.set("n", "<leader>fb", function()
        require("conform").format({ lsp_fallback = true })
    end, opts)
end)

require("conform").setup({
    formatters_by_ft = {
        python = function(bufnr)
            if require("conform").get_formatter_info("ruff_format", bufnr).available then
                return { "ruff_format" }
            else
                return { "black" }
            end
        end,
    },
})

require('mason').setup({})
require('mason-null-ls').setup({
    ensure_installed = { "black", "sqlfluff" },
})

local capabilities = require('blink.cmp').get_lsp_capabilities()

require('mason-lspconfig').setup({
    handlers = {
        -- Only keep the default handler here for Mason-managed stuff (like Python/Ruff)
        function(server_name)
            require('lspconfig')[server_name].setup({
                capabilities = capabilities,
                on_attach = lsp_zero.on_attach,
                settings = {
                    python = {
                        analysis = {
                            diagnosticMode = "workspace",
                        },
                    },
                },
            })
        end,
    },
})

local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')

if not configs.dbtls then
    configs.dbtls = {
        default_config = {
            cmd = { "dbt-language-server" },
            filetypes = { "sql", "yaml" },
            root_dir = lspconfig.util.root_pattern("dbt_project.yml"),
            settings = {},
        },
    }
end

lspconfig.dbtls.setup({
    capabilities = capabilities,
    on_attach = lsp_zero.on_attach,
})

local null_ls = require('null-ls')
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.sqlfluff.with({
            extra_args = { "--dialect", "postgres" },
        }),
        null_ls.builtins.formatting.sqlfluff.with({
            extra_args = { "--dialect", "postgres" },
        }),
        null_ls.builtins.diagnostics.yamllint,
    },
})

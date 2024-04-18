local lsp_zero = require('lsp-zero')

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
end)

lsp_zero.omnifunc.setup({
    autocomplete = true,
    use_fallback = true,
    update_on_delete = true,
    select_behavior = 'insert',
    mapping = {
        confirm = '<TAB>',
        next_item = "<C-n>",
        prev_item = "<C-p>",
    },
    preselect = 'none',
    completion = {
        completeopt = 'menu,menuone,noinsert,noselect'
    },
})



-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('mason-lspconfig').setup({
    ensure_installed = { 'pylsp' },
    handlers = {
        --- this first function is the "default handler"
        --- it applies to every language server without a "custom handler"
        function(server_name)
            local conf = {capabilities = capabilities}
            return require('lspconfig')[server_name].setup(conf)
        end,
    },
})

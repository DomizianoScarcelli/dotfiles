local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

lsp_zero.omnifunc.setup({
    autocomplete = true,
    use_fallback=true,
    update_on_delete=true,
    select_behavior = 'insert',
    preselect=false,
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
require('mason-lspconfig').setup({
  ensure_installed = {'pylsp'},
  handlers = {
    --- this first function is the "default handler"
    --- it applies to every language server without a "custom handler"
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})

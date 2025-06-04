require("otter").setup({
  lsp = {
    hover = {
      border = "rounded",
    },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  },
})

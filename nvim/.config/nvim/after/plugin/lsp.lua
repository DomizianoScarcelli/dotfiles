-- LSP on native nvim 0.11+ APIs (vim.lsp.config / vim.lsp.enable). No lsp-zero.

-- Keymaps on attach (the custom ones plus what lsp-zero's default_keymaps used to add)
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local opts = { buffer = ev.buf, remap = false }
        local map = function(mode, lhs, rhs) vim.keymap.set(mode, lhs, rhs, opts) end

        map("n", "gd", vim.lsp.buf.definition)
        map("n", "gD", vim.lsp.buf.declaration)
        map("n", "gi", vim.lsp.buf.implementation)
        map("n", "go", vim.lsp.buf.type_definition)
        map("n", "gr", require("telescope.builtin").lsp_references)
        map("n", "gl", vim.diagnostic.open_float)
        map("n", "K", vim.lsp.buf.hover)
        map("n", "<F2>", vim.lsp.buf.rename)
        map({ "n", "x" }, "<F3>", function() vim.lsp.buf.format({ async = true }) end)
        map("n", "<F4>", vim.lsp.buf.code_action)
        map("n", "<leader>cc", vim.lsp.buf.code_action)
        map("n", "<leader>vws", vim.lsp.buf.workspace_symbol)
        map("n", "<leader>vd", vim.diagnostic.open_float)
        map("n", "<leader>[d", function() vim.diagnostic.jump({ count = 1, float = true }) end)
        map("n", "<leader>]d", function() vim.diagnostic.jump({ count = -1, float = true }) end)
        map("n", "<leader>rn", vim.lsp.buf.rename)
        map("n", "<leader>td", vim.lsp.buf.type_definition)
        map("n", "<leader>h", vim.lsp.buf.signature_help)

        -- Formatting via Conform
        map("n", "<leader>fb", function() require("conform").format({ lsp_format = "fallback" }) end)
    end,
})

-- Defaults for every server: blink completion capabilities + python analysis settings
vim.lsp.config("*", {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
    settings = {
        python = {
            analysis = {
                diagnosticMode = "workspace",
            },
        },
    },
})

-- Custom server not in nvim-lspconfig
vim.lsp.config("dbtls", {
    cmd = { "dbt-language-server" },
    filetypes = { "sql", "yaml" },
    root_markers = { "dbt_project.yml" },
    settings = {},
})
vim.lsp.enable("dbtls")

-- Mason: installs tools; mason-lspconfig v2 calls vim.lsp.enable() for every installed server
require("mason").setup({})
require("mason-lspconfig").setup({})
-- Everything Mason should have. `./install.sh` runs :MasonToolsInstallSync to install these headless.
require("mason-tool-installer").setup({
    ensure_installed = {
        -- LSP servers
        "bashls", "cssls", "html", "jsonls", "lua_ls", "ruff", "ty", "ts_ls",
        -- formatters / linters
        "black", "isort", "prettier", "sqlfluff", "yamllint",
    },
})

-- Formatting (was: conform for python + null-ls for black/sqlfluff)
require("conform").setup({
    formatters_by_ft = {
        python = function(bufnr)
            if require("conform").get_formatter_info("ruff_format", bufnr).available then
                return { "ruff_format" }
            else
                return { "black" }
            end
        end,
        sql = { "sqlfluff" },
    },
    formatters = {
        -- null-ls formatted any SQL file; conform's default refuses without a project config
        sqlfluff = { args = { "fix", "--dialect", "postgres", "-" }, require_cwd = false },
    },
})

-- Diagnostics from CLI tools (was: null-ls sqlfluff + yamllint)
local lint = require("lint")
lint.linters.sqlfluff.args = { "lint", "--format=json", "--dialect", "postgres", "-" }
lint.linters_by_ft = {
    sql = { "sqlfluff" },
    yaml = { "yamllint" },
}
vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
    group = vim.api.nvim_create_augroup("dov_lint", { clear = true }),
    callback = function() lint.try_lint() end,
})

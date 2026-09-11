-- Plugin manager: lazy.nvim. Plugin *configuration* lives in after/plugin/*.lua
-- (sourced after every plugin has loaded), so this file is only the plugin list.
-- Nothing is lazy-loaded unless it says so (cmd/keys/ft); loading is eager like packer was.

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable",
        "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Telescope
    { "nvim-telescope/telescope.nvim", tag = "v0.2.2", dependencies = { "nvim-lua/plenary.nvim" } },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-z.nvim" },
    { "nvim-tree/nvim-web-devicons" },

    -- Color schemes
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "ellisonleao/gruvbox.nvim" },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        dependencies = { { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" } },
    },
    { "nvim-treesitter/nvim-treesitter-context" },

    { "mbbill/undotree" },

    -- LSP (native vim.lsp.config/enable; mason-lspconfig v2 auto-enables installed servers)
    { "neovim/nvim-lspconfig" },
    { "mason-org/mason.nvim" },
    { "mason-org/mason-lspconfig.nvim", dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" } },
    { "WhoIsSethDaniel/mason-tool-installer.nvim", dependencies = { "mason-org/mason.nvim" } },
    { "mfussenegger/nvim-lint" }, -- diagnostics from CLI tools (sqlfluff, yamllint)
    { "tpope/vim-commentary" },
    { "mechatroner/rainbow_csv" },
    { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    {
        "sudormrfbin/cheatsheet.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
    },
    { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
    { "andrewferrier/wrapping.nvim" },
    { "lervag/vimtex" },
    { "akinsho/git-conflict.nvim" },
    { "nvim-tree/nvim-tree.lua" },
    { "mikavilpas/yazi.nvim" },
    { "f-person/git-blame.nvim" },
    {
        "chipsenkbeil/distant.nvim",
        branch = "v0.3",
        config = function() require("distant"):setup() end,
    },
    { "kkoomen/vim-doge", build = ":call doge#install()" },
    { "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" } },
    { "folke/snacks.nvim" },
    {
        "alexpasmantier/pymple.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", "stevearc/dressing.nvim", "nvim-tree/nvim-web-devicons" },
        build = ":PympleBuild",
        config = function() require("pymple").setup() end,
    },
    { "stevearc/conform.nvim" }, -- configured in after/plugin/lsp.lua
    { "saghen/blink.cmp", version = "1.*", dependencies = { "rafamadriz/friendly-snippets" } },
    { "nvim-pack/nvim-spectre", dependencies = { "nvim-lua/plenary.nvim" } },
    {
        "pwntester/octo.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "nvim-tree/nvim-web-devicons" },
    },
    -- Loaded after catppuccin (packer: `after = "catppuccin"`) so highlight groups exist.
    { "akinsho/bufferline.nvim", version = "*", dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin" } },
    { "folke/flash.nvim" },
    {
        "DomizianoScarcelli/metascope.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("metascope").setup({
                max_history = 5000,
                picker_history_keymap = "<C-h>", -- open per-picker history; false to disable
                picker_history_keymap_mode = { "n", "i" },
                resume_keymap = "<C-r>",         -- in the dashboard: re-run the search instead of jumping; false to disable
                cwd_boost = 4,                   -- frecency multiplier for entries from the current project
                half_life_days = 3,              -- recency decay: an entry's weight halves every N days
                save_debounce_ms = 1000,         -- coalesce rapid writes into one async flush

                -- Hybrid files + history picker
                hybrid = {
                    source_types = { "files", "buffers" }, -- history types that resolve to a file
                    frecency_bonus = 8,                    -- how strongly frecency biases ranking while typing
                    show_all_on_empty = false,             -- empty prompt: recents only (false) or whole tree (true)
                    cwd_only = true,                       -- only surface recents from the current project
                    find_command = nil,                    -- override the file-listing command, e.g. { "fd", "--type", "f" }
                },

                -- Set the three keymaps for you. Use `true` for the recommended bindings,
                -- a table to customise, or omit/false to bind them yourself (see below).
                keymaps = true, -- <leader>ff find_files · <leader>fh history · <leader>fo hybrid
            })
        end,
    },
    {
        "9seconds/repolink.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = { "RepoLink" },
        config = function() require("repolink").setup({}) end,
    },
    {
        "Isrothy/neominimap.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "lewis6991/gitsigns.nvim" },
        -- `init` runs BEFORE the plugin loads. This is where global config goes.
        init = function()
            vim.g.neominimap = {
                auto_enable = true,
                -- Add any other specific configurations inside this table
            }
        end,
        -- `config` runs AFTER the plugin loads. This is where API calls and keymaps go.
        config = function()
            vim.keymap.set("n", "<leader>nt", function() require("neominimap.api").toggle() end, { desc = "Toggle Neominimap" })
            vim.keymap.set("n", "<leader>nf", function() require("neominimap.api").focus.toggle() end, { desc = "Toggle Focus on Neominimap" })
            vim.keymap.set("n", "<leader>nr", function() require("neominimap.api").refresh() end, { desc = "Refresh Neominimap" })
        end,
    },
}, {
    change_detection = { notify = false },
})

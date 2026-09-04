-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer
    use { 'wbthomason/packer.nvim' }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = 'v0.2.2',
        requires = { { 'nvim-lua/plenary.nvim', "BurntSushi/ripgrep" } }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    use { "nvim-telescope/telescope-z.nvim" }

    -- Telescope Icons
    use { 'nvim-tree/nvim-web-devicons' }

    -- Color Schemes
    use { "catppuccin/nvim", as = "catppuccin" }
    use { "ellisonleao/gruvbox.nvim" }

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        branch = 'main',
        run = ':TSUpdate',
        requires = {
            { "nvim-treesitter/nvim-treesitter-textobjects", branch = 'main' },
        },
    }
    use { "nvim-treesitter/nvim-treesitter-context" }

    -- UndoTree
    use { 'mbbill/undotree' }

    -- LSP (Cleaned up for Blink)
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'neovim/nvim-lspconfig' },
        }
    }

    use { "nvimtools/none-ls.nvim" }
    use { "jay-babu/mason-null-ls.nvim" }
    use { "tpope/vim-commentary" }
    use { 'mechatroner/rainbow_csv' }

    use {
        "folke/todo-comments.nvim",
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'sudormrfbin/cheatsheet.nvim',
        requires = {
            { 'nvim-telescope/telescope.nvim' },
            { 'nvim-lua/popup.nvim' },
            { 'nvim-lua/plenary.nvim' },
        }
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use { "andrewferrier/wrapping.nvim" }
    use { 'lervag/vimtex' }
    use { "akinsho/git-conflict.nvim" }
    use { "nvim-tree/nvim-tree.lua" }
    use { "mikavilpas/yazi.nvim" }
    use { 'f-person/git-blame.nvim' }

    use {
        'chipsenkbeil/distant.nvim',
        branch = 'v0.3',
        config = function()
            require('distant'):setup()
        end
    }

    use {
        'kkoomen/vim-doge',
        run = ':call doge#install()'
    }

    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

    use { "folke/snacks.nvim" }

    use {
        "alexpasmantier/pymple.nvim",
        requires = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", "stevearc/dressing.nvim", "nvim-tree/nvim-web-devicons" },
        run = ":PympleBuild",
        config = function() require("pymple").setup() end,
    }

    use({
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({ formatters_by_ft = { python = { "ruff" } } })
        end,
    })
    use {
        'saghen/blink.cmp',
        requires = 'rafamadriz/friendly-snippets',
        tag = 'v1.*',
    }
    use {
        'nvim-pack/nvim-spectre',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        "pwntester/octo.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-tree/nvim-web-devicons",
        }
    }
    use {
        'akinsho/bufferline.nvim',
        tag = "*",
        requires = 'nvim-tree/nvim-web-devicons',
        after = "catppuccin"
    }
    use { "folke/flash.nvim", }
    use {
        "DomizianoScarcelli/metascope.nvim",
        requires = { "nvim-telescope/telescope.nvim" },
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
        end
    }
    use {
        "9seconds/repolink.nvim",
        requires = {
            "nvim-lua/plenary.nvim"
        },
        opt = true,
        cmd = {
            "RepoLink"
        },

        config = function()
            require("repolink").setup({})
        end
    }
    use({
        "Isrothy/neominimap.nvim",
        requires = {
            "nvim-treesitter/nvim-treesitter",
            "lewis6991/gitsigns.nvim",
        },
        -- 'setup' runs BEFORE the plugin loads. This is where global config goes.
        setup = function()
            vim.g.neominimap = {
                auto_enable = true,
                -- Add any other specific configurations inside this table
            }
        end,
        -- 'config' runs AFTER the plugin loads. This is where API calls and keymaps go.
        config = function()
            vim.keymap.set("n", "<leader>nt", function()
                require("neominimap.api").toggle()
            end, { desc = "Toggle Neominimap" })

            vim.keymap.set("n", "<leader>nf", function()
                require("neominimap.api").focus.toggle()
            end, { desc = "Toggle Focus on Neominimap" })

            vim.keymap.set("n", "<leader>nr", function()
                require("neominimap.api").refresh()
            end, { desc = "Refresh Neominimap" })
        end,
    })
end)

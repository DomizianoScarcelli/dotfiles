-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer
    use { 'wbthomason/packer.nvim' }
    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
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
    use { "nvim-treesitter/nvim-treesitter", { run = ':TSUpdate' }, requires = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    }, }
    -- Sticky Scroll
    use { "nvim-treesitter/nvim-treesitter-context" }
    -- UndoTree
    use { 'mbbill/undotree' }
    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
            { 'hrsh7th/nvim-cmp' },
            { "lukas-reineke/cmp-under-comparator" },
            { 'saadparwaiz1/cmp_luasnip' },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-buffer" }
        }

    }
    use { "nvimtools/none-ls.nvim" }
    use { "jay-babu/mason-null-ls.nvim" }
    -- Easy comment block of code
    use { "tpope/vim-commentary" }
    -- Togglable Terminal
    -- use { "akinsho/toggleterm.nvim" }
    -- Rainbow CSV
    use { 'mechatroner/rainbow_csv' }
    -- Highlight Comments
    use {
        "folke/todo-comments.nvim",
        requires = {
            { 'nvim-lua/plenary.nvim' }
        }
    }
    -- Cheatsheet
    use {
        'sudormrfbin/cheatsheet.nvim',

        requires = {
            { 'nvim-telescope/telescope.nvim' },
            { 'nvim-lua/popup.nvim' },
            { 'nvim-lua/plenary.nvim' },
        }
    }
    -- Lualine (pretty statusbar)
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    -- Soft-wrapping for text files
    use { "andrewferrier/wrapping.nvim" }
    -- Compile on save in latex
    use { 'lervag/vimtex' }
    -- Manage Registers
    use { "tversteeg/registers.nvim" }
    -- Visualize git conflicts
    use { "akinsho/git-conflict.nvim" }
    -- Custom startup dashboard
    -- use { "nvimdev/dashboard-nvim",
    --     requires = { 'nvim-tree/nvim-web-devicons' }
    -- }
    -- Better jump to word
    use { "nvim-tree/nvim-tree.lua" }
    use { "mikavilpas/yazi.nvim", }

    use { 'f-person/git-blame.nvim' }
    -- Use local config on remote machines
    use {
        'chipsenkbeil/distant.nvim',
        branch = 'v0.3',
        config = function()
            require('distant'):setup()
        end }
    -- Documentation Generator
    use {
        'kkoomen/vim-doge',
        run = ':call doge#install()'
    }
    -- use {
    --     "ThePrimeagen/refactoring.nvim",
    --     requires = {
    --         { "nvim-lua/plenary.nvim" },
    --         { "nvim-treesitter/nvim-treesitter" }
    --     }
    -- }
    --
    -- Automatic folding
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
    use { "folke/snacks.nvim",
        config = function()
            require('snacks').setup({
                -- Your configuration options here
                -- Refer to the configuration section below
                bigfile = { enabled = true },
                notifier = {
                    enabled = true,
                    timeout = 3000,
                },
                quickfile = { enabled = true },
                -- words = { enabled = true },
                styles = {
                    notification = {
                        wo = { wrap = true } -- Wrap notifications
                    }
                }
            })
        end
    }
    -- Python rename refactoring
    use {
        "alexpasmantier/pymple.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            -- optional (nicer ui)
            "stevearc/dressing.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        run = ":PympleBuild",
        config = function()
            require("pymple").setup()
        end,
    }
    -- Jupyter Notebooks
    use {
        "benlubas/molten-nvim",
        run = ":UpdateRemotePlugins",
        config = function()
            vim.g.molten_auto_open_output = false
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_wrap_output = true
            vim.g.molten_virt_text_output = true
            vim.g.molten_virt_lines_off_by_1 = true
        end
    }

    use {
        "quarto-dev/quarto-nvim",
        ft = { "markdown", "quarto" },   -- lazy-loads plugin on markdown/quarto files
        requires = {
            { "jmbuhr/otter.nvim" },     -- required dependency
            { "nvim-lua/plenary.nvim" }, -- otter depends on this
            -- any others you use
        },
        config = function()
            require("quarto").setup {
                debug = false,
                closePreviewOnExit = true,
                lspFeatures = {
                    enabled = true,
                    chunks = "curly",
                    languages = { "r", "python", "julia", "bash", "html" },
                    diagnostics = {
                        enabled = true,
                        triggers = { "BufWritePost" },
                    },
                    completion = {
                        enabled = true,
                    },
                },
                codeRunner = {
                    enabled = true,
                    default_method = "molten",
                    ft_runners = {},
                    never_run = { "yaml" },
                },
            }

            local runner = require("quarto.runner")
            vim.keymap.set("n", "<leader>rc", runner.run_cell)
            vim.keymap.set("n", "<leader>rA", function() runner.run_all(true) end)

            -- Activates Quarto for .md files with frontmatter
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "markdown",
                callback = function()
                    require("quarto").activate()
                end,
            })
            vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
                pattern = "*.ipynb",
                callback = function()
                    vim.bo.filetype = "quarto"
                end,
            })
        end
    }

    use {
        "3rd/image.nvim",
        config = function()
            require("image").setup({
                backend = "kitty", -- or "ueberzug", "tycat", etc.
            })
        end
    }

    use {
        "GCBallesteros/jupytext.nvim",
        config = function()
            require("jupytext").setup({
                style = "markdown",
                output_extension = "md",
                force_ft = "markdown",
            })
        end
    }
end)

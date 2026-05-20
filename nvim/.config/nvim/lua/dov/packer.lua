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
    use { "tversteeg/registers.nvim" }
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
                max_history = 10000,
            })
        end
    }
end)

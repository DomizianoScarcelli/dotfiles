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
    -- Color Scheme
    use { "catppuccin/nvim", as = "catppuccin" }
    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter", { run = ':TSUpdate' } }
    -- Sticky Scroll
    use { "nvim-treesitter/nvim-treesitter-context" }
    -- Harpoon
    -- use {"ThePrimeagen/harpoon"}
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
    -- Easy comment block of code
    use { "tpope/vim-commentary" }
    -- Togglable Terminal
    use { "akinsho/toggleterm.nvim" }
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
    -- Oil (manage files in a buffer)
    -- use { "stevearc/oil.nvim" }
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
    use { "nvimdev/dashboard-nvim",
    requires = { 'nvim-tree/nvim-web-devicons' }
}
-- Better jump to word
use { "ggandor/leap.nvim" }
use { "nvim-tree/nvim-tree.lua" }
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
    use{'luizribeiro/vim-cooklang', ft='cook' }
    use {
        "ThePrimeagen/refactoring.nvim",
        requires = {
            {"nvim-lua/plenary.nvim"},
            {"nvim-treesitter/nvim-treesitter"}
        }
    }
end)

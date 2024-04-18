-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer 
    use { 'wbthomason/packer.nvim' }
    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        requires = { {'nvim-lua/plenary.nvim', "BurntSushi/ripgrep"} }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    -- Telescope Icons
    use {'nvim-tree/nvim-web-devicons'}
    -- Color Scheme
    use { "catppuccin/nvim", as = "catppuccin" }
    -- Treesitter
    use {"nvim-treesitter/nvim-treesitter", {run= ':TSUpdate'}}
    -- Harpoon
    use {"ThePrimeagen/harpoon"}
    -- UndoTree
    use {'mbbill/undotree'}
    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            {'neovim/nvim-lspconfig'},
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }
    -- Easy comment block of code
    use {"tpope/vim-commentary"}
    -- Togglable Terminal
    use { "akinsho/toggleterm.nvim" }
    -- Rainbow CSV
    use {'mechatroner/rainbow_csv'}
    -- Highlight Comments
    use {
        "folke/todo-comments.nvim",
        requires = {
            {'nvim-lua/plenary.nvim'}
        }}
        -- Cheatsheet
        use {
            'sudormrfbin/cheatsheet.nvim',

            requires = {
                {'nvim-telescope/telescope.nvim'},
                {'nvim-lua/popup.nvim'},
                {'nvim-lua/plenary.nvim'},
            }
        }
        -- Oil (manage files in a buffer)
        use {"stevearc/oil.nvim"}
        -- Lualine (pretty statusbar)
        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'nvim-tree/nvim-web-devicons', opt = true }
        }
    end)

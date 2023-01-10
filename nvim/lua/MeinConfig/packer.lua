-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use { 'nvim-telescope/telescope-fzf-native.nvim',  run = 'make' }
    use { "catppuccin/nvim", as = "catppuccin" }
    use {'folke/tokyonight.nvim'}
    use 'shaunsingh/nord.nvim'
    use "EdenEast/nightfox.nvim"
    -- use 'arcticicestudio/nord-vim'
    use { "nvim-treesitter/nvim-treesitter", run = ':TSUpdate'}
    use { "ThePrimeagen/harpoon"}

    use { "mbbill/undotree" }
    use { "tpope/vim-fugitive" }

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
    use { 'nvim-lualine/lualine.nvim' }
    use { 'renerocksai/telekasten.nvim'}

end)

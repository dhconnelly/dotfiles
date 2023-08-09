return require('packer').startup(function (use)
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'nvim-telescope/telescope.nvim', requires = {
        'nvim-lua/plenary.nvim',
    }}
    use { 'hrsh7th/nvim-cmp', requires = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
    }} 
    use { 'scalameta/nvim-metals', requires = {
        'nvim-lua/plenary.nvim',
    }}
    use 'nvim-tree/nvim-tree.lua'
    use 'mfussenegger/nvim-dap'
end)

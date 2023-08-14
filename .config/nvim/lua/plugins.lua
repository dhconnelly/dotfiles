-- https://github.com/wbthomason/packer.nvim#bootstrapping
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function (use)
    use { 'wbthomason/packer.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'nvim-telescope/telescope.nvim', requires = {
        'nvim-lua/plenary.nvim',
    }}
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-vsnip" },
            { "hrsh7th/vim-vsnip" },
        },
    })
    use({
        "scalameta/nvim-metals",
        requires = {
            "nvim-lua/plenary.nvim",
            "mfussenegger/nvim-dap",
        },
    })
    use { 'nvim-tree/nvim-tree.lua' }
    use { 'mfussenegger/nvim-dap' }
    use { 'neovim/nvim-lspconfig' }

    if packer_bootstrap then
        require('packer').sync()
    end
end)

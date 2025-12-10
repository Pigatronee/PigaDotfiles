
-- Make sure packer is installed
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

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- Themes
  use "ellisonleao/gruvbox.nvim"
  use     {
      'sainnhe/everforest',
      lazy = false,
      priority = 1000,
      config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        vim.g.everforest_enable_italic = true
        vim.cmd.colorscheme('everforest')
      end
    }

  -- Not themes
  use "nvim-tree/nvim-tree.lua"
  use "nvim-tree/nvim-web-devicons"
  use "nvim-lualine/lualine.nvim"
  use "nvim-treesitter/nvim-treesitter"
  use 'CRAG666/code_runner.nvim'
  use {
  "nvim-telescope/telescope.nvim",
  requires = { {"nvim-lua/plenary.nvim"} },
  }
  -- LSP 
  use "neovim/nvim-lspconfig"
  use {
		"williamboman/mason.nvim",
		run = ":MasonUpdate"
	}
  use "williamboman/mason-lspconfig.nvim"
  use {
    "folke/lazydev.nvim",
    ft = "lua", -- load only for Lua files
    config = function()
        require("lazydev").setup({
            library = {
                { path = vim.fn.stdpath("data") .. "/lazy/luv/library", words = { "vim%.uv" } },
            },
        })
    end,
}


  -- Autocomplete
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "L3MON4D3/LuaSnip"
  use "windwp/nvim-autopairs"
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

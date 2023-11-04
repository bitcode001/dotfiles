local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- lua functions that many plugins use
	use("nvim-lua/plenary.nvim")

	-- My plugins here
	use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme
	use({ "bluz71/vim-moonfly-colors", as = "moonfly" }) -- preferred colorscheme moonfly
	use({ "catppuccin/nvim", as = "catppuccin" }) -- catppuccin colorscheme
	use("navarasu/onedark.nvim")

	-- tmux and nvim window navigation
	use("christoomey/vim-tmux-navigator")

	use("szw/vim-maximizer") -- maximizes and restore current window

	-- essential plugins
	use("tpope/vim-surround")
	use("vim-scripts/ReplaceWithRegister")

	-- commenting with gc
	use("numToStr/Comment.nvim")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	-- indent line for code
	use({ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} })

	-- icons
	use("nvim-tree/nvim-web-devicons")
	use("ryanoasis/vim-devicons")

	-- status line
	use("nvim-lualine/lualine.nvim")

	-- fuzzyfinding
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

	-- autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- managing and installing lsp sever, linters and formatter
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- configuring the lsp server
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use("jose-elias-alvarez/typescript.nvim")
	use("onsails/lspkind.nvim")

	-- installing tabnine for advance LSP and AutoCompletion
	use({ "codota/tabnine-nvim", run = "./dl_binaries.sh" })

	-- formatting and linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	use({ "ckipp01/nvim-jenkinsfile-linter", requires = { "nvim-lua/plenary.nvim" } })

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- new syntax highlighting
	use("sheerun/vim-polyglot")

	-- Astro configuration
	-- use("wuelnerdotexe/vim-astro")
	-- Configuration for vim-astro
	-- use({
	-- 	"yaegassy/coc-astro",
	-- 	run = "yarn install --frozen-lockfile",
	-- })

	-- navigating around vim
	use({
		"phaazon/hop.nvim",
		branch = "v2",
	})

	-- auto closing
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- git signs plugin
	use("lewis6991/gitsigns.nvim")

	-- bufferline
	use({ "akinsho/bufferline.nvim", requires = "nvim-tree/nvim-web-devicons" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)

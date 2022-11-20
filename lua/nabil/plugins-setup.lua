local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	snapshot_path = fn.stdpath("config") .. "/snapshots",
	max_jobs = 50,
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
		prompt_border = "rounded", -- Border style of prompt popups.
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- essential
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")

	-- icons
	use("kyazdani42/nvim-web-devicons")
	use("projekt0n/circles.nvim")

	-- colorschemes
	use("bluz71/vim-nightfly-guicolors")
	use("folke/tokyonight.nvim")

	-- startup dashboard
	use("goolord/alpha-nvim")

	-- navigation
	use("nvim-tree/nvim-tree.lua")

	-- typing enhancements
	use("windwp/nvim-autopairs")
	use("tpope/vim-surround")
	use("numToStr/Comment.nvim")
	use("lukas-reineke/indent-blankline.nvim")

	-- cmp
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- telescope
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- mason
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- lps
	use("neovim/nvim-lspconfig")
	use("ray-x/lsp_signature.nvim")
	-- use "onsails/lspkind.nvim"
	use("jose-elias-alvarez/typescript.nvim")

	-- null-ls
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("p00f/nvim-ts-rainbow")
	use("windwp/nvim-ts-autotag")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("editorconfig/editorconfig-vim")

	-- whichkey
	use("folke/which-key.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

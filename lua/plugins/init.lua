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
        autocmd BufWritePost ~/.config/nvim/lua/plugins/init.lua source <afile> | PackerSync
    augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	-- snapshot = "july-24",
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
	-- Plugin Mangager
	use("wbthomason/packer.nvim") -- Have packer manage itself

	-- Lua Development
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("nvim-lua/popup.nvim")
	use("christianchiarulli/lua-dev.nvim")
	-- use "folke/lua-dev.nvim"

	use({ "akinsho/bufferline.nvim" })
	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	-- use "williamboman/nvim-lsp-installer" -- simple to use language server installer
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("ray-x/lsp_signature.nvim")
	use("SmiteshP/nvim-navic")
	use("simrat39/symbols-outline.nvim")
	use("b0o/SchemaStore.nvim")
	use("folke/trouble.nvim")
	use("RRethy/vim-illuminate")
	use("j-hui/fidget.nvim")
	use("lvimuser/lsp-inlayhints.nvim")
	-- use({ "glepnir/lspsaga.nvim", branch = "main" })
	-- use "simrat39/inlay-hints.nvim"
	-- use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"

	-- Completion
	use("christianchiarulli/nvim-cmp")
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-emoji")
	use("hrsh7th/cmp-nvim-lua")
	-- use("zbirenbaum/copilot-cmp")

	-- Snippet
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- Syntax/Treesitter
	use("nvim-treesitter/nvim-treesitter")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("p00f/nvim-ts-rainbow")
	use("nvim-treesitter/playground")
	use("windwp/nvim-ts-autotag")
	use("nvim-treesitter/nvim-treesitter-textobjects")
	-- use "wellle/targets.vim"
	-- use "RRethy/nvim-treesitter-textsubjects"
	use("kylechui/nvim-surround")
	use({
		"abecodes/tabout.nvim",
		wants = { "nvim-treesitter" }, -- or require if not used so far
	})

	-- Marks
	use("christianchiarulli/harpoon")
	use("MattesGroeger/vim-bookmarks")

	-- Fuzzy Finder/Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	use("tom-anders/telescope-vim-bookmarks.nvim")

	-- Color
	use("NvChad/nvim-colorizer.lua")
	-- use "ziontee113/color-picker.nvim"
	use("nvim-colortils/colortils.nvim")

	-- Colorschemes
	-- use "lunarvim/onedarker.nvim"
	use("lunarvim/darkplus.nvim")
	use("lunarvim/synthwave84.nvim")
	use("PMpercy/material.nvim")

	-- Utility
	use("lewis6991/impatient.nvim")
	-- Icon
	use("kyazdani42/nvim-web-devicons")

	-- Statusline
	use("christianchiarulli/lualine.nvim")

	-- Startup
	use("goolord/alpha-nvim")

	-- Indent
	use("lukas-reineke/indent-blankline.nvim")

	-- File Explorer
	use("kyazdani42/nvim-tree.lua")
	-- use("christianchiarulli/lir.nvim")

	-- Comment
	use("numToStr/Comment.nvim")
	use("folke/todo-comments.nvim")

	-- Terminal
	use("akinsho/toggleterm.nvim")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Editing Support
	use("windwp/nvim-autopairs")
	use("folke/zen-mode.nvim")

	-- Keybinding
	use("folke/which-key.nvim")

	-- Typescript TODO: set this up, also add keybinds to ftplugin
	use("jose-elias-alvarez/typescript.nvim")
    use('MunifTanjim/prettier.nvim')
	use("metakirby5/codi.vim")

	-- Markdown
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		ft = "markdown",
	})
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

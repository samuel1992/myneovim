return {
	-- Appearance
	{ "nvim-tree/nvim-tree.lua", opts = {} },
	{ "nvim-tree/nvim-web-devicons" },
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{
		"https://gitlab.com/HiPhish/resolarized.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme solarized-dark")
		end,
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"python",
					"go",
					"elixir",
					"heex",
					"javascript",
					"tsx",
					"html",
				},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},

	-- LSP
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()

			local mason_registry = require("mason-registry")
			local tools = { "stylua", "black", "prettier" }

			for _, tool in ipairs(tools) do
				local p = mason_registry.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({})
			lspconfig.pyright.setup({})
			lspconfig.gopls.setup({})
			lspconfig.ts_ls.setup({})
			lspconfig.html.setup({})
			lspconfig.elixirls.setup({
				cmd = { "elixir-ls" },
			})
		end,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = {
					{ name = "copilot", group_index = 2 },
					{ name = "nvim_lsp" },
				},
			})
		end,
	},
	{
		"Exafunction/windsurf.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("codeium").setup({})
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
	},

	-- Git
	{ "lewis6991/gitsigns.nvim", opts = {} },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

	-- Formatting
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "black" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					json = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
					markdown = { "prettier" },
					go = { "gofmt" },
				},
			})
			vim.keymap.set({ "n", "v" }, "<leader>lf", function()
				require("conform").format({ lsp_fallback = true, timeout_ms = 5000 })
			end)
		end,
	},

}

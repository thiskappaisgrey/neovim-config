return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false
		-- config = function()
		-- 	require("catppuccin")
		-- 	vim.cmd 'colorscheme catppuccin'
		-- end
	},
	{
		"shaunsingh/nord.nvim",
		priority = 1000,
		config = function()
			require("nord")
			vim.cmd 'colorscheme nord'
		end
	},
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	{
		"folke/neodev.nvim",
		opts = {},
		config = function()
			require("neodev").setup({
				-- add any options here, or leave empty to use the default settings
			})
			-- then setup your lsp server as usual
			local lspconfig = require('lspconfig')

			-- example to setup lua_ls and enable call snippets
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace"
						}
					}
				}
			})
		end
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	-- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
	{
		'numToStr/Comment.nvim',
		-- opts = {
		-- 	-- add any options here
		-- },
		config = function()
			local ft = require('Comment.ft')
			ft.kdl = { '//%s' }

			require('Comment').setup()
		end,
		lazy = false,
	},
	{
		'JoosepAlviste/nvim-ts-context-commentstring',
		-- opts = {},
		config = function()
			require('ts_context_commentstring').setup {}
		end,
		lazy = false,
	},
	{
		"folke/todo-comments.nvim",
		lazy = false,
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	}

}

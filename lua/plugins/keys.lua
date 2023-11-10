return {
	{ "folke/which-key.nvim", event="VeryLazy",   init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end, opts = {}},
	{ "FeiyouG/commander.nvim",  dependencies = { "nvim-telescope/telescope.nvim" },

	keys = {
		{ "<leader>b", "<CMD>Telescope commander<CR>", mode = "n" },
		{ "<leader>wh", "<cmd>split<cr>", mode = "n", desc = "Split window horizontally"},
		{ "<leader>wv", "<cmd>vsplit<cr>", mode = "n", desc = "Split window veritically"},
		{ "<leader>wo", "<cmd>only<cr>", mode = "n", desc = "Only window"},
		{ "<leader>wd", "<cmd>close<cr>", mode = "n", desc = "Close window"},
		{ "<leader>ww", "<C-w>w", mode = "n", desc = "Close window"},
	},
	config = 
	function() 
		require("commander").setup({
			components = {
				"DESC",
				"KEYS",
				"CAT",
			},
			sort_by = {
				"DESC",
				"KEYS",
				"CAT",
				"CMD"
			},
			integration = {
				telescope = {
					enable = true,
				},
				lazy = {
					enable = true,
					set_plugin_name_as_cat = true
				}
			}
		})
	end
}
}

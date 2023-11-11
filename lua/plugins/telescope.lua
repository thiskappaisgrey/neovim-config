return {
	{ "nvim-telescope/telescope.nvim",
	keys = { 
		{ "<leader>ff", "<cmd>Telescope fd<cr>", desc = "Telescope find file" }, 
		{ "<leader>:", "<cmd>Telescope commands<cr>", desc = "Telescope commands" },
		{ "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Telescope commands" },

	},
	lazy = false
    },

      "nvim-lua/plenary.nvim",
    {
	    'stevearc/dressing.nvim',
	    opts = {},
    }
}

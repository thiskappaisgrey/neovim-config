return {

	"ThePrimeagen/harpoon",
	keys = {
		{ "<leader>mm", function() require("harpoon.mark").add_file() end, mode = "n", desc = "Harpoon mark"},
		{ "<leader>mu", function() require("harpoon.ui").toggle_quick_menu() end, mode = "n", desc = "Harpon ui"},
		{ "<leader>m1", function() require("harpoon.ui").nav_file(1) end, mode = "n", desc = "Harpon ui"},
		{ "<leader>m2", function() require("harpoon.ui").nav_file(2) end, mode = "n", desc = "Harpon ui"},
		{ "<leader>m3", function() require("harpoon.ui").nav_file(3) end, mode = "n", desc = "Harpon ui"},
		{ "<leader>m4", function() require("harpoon.ui").nav_file(4) end, mode = "n", desc = "Harpon ui"}
	}
}

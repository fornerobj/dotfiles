return {
	"ThePrimeagen/harpoon",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = true,
	keys = {
        { "<c-e>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "harpoon menu" },
		{ "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon" },
		{ "<leader>r", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Go to next harpoon mark" },
        { "<leader>1", "<cmd> lua require('harpoon.ui').nav_file(1)<cr>", "file 1" },
        { "<leader>2", "<cmd> lua require('harpoon.ui').nav_file(2)<cr>", "file 2" },
        { "<leader>3", "<cmd> lua require('harpoon.ui').nav_file(3)<cr>", "file 3" },
        { "<leader>4", "<cmd> lua require('harpoon.ui').nav_file(4)<cr>", "file 4" },
	},
}

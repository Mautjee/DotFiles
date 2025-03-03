return {
	{
		"ThePrimeagen/harpoon",
		lazy = true,
		config = function()
			local harpoon_ui = require("harpoon.ui")
			local harpoon_mark = require("harpoon.mark")
			local keymap = vim.keymap

			-- Open harpoon ui
			keymap.set("n", "<leader>ho", function()
				harpoon_ui.toggle_quick_menu()
			end)

			-- Add current file to harpoon
			keymap.set("n", "<leader>ha", function()
				harpoon_mark.add_file()
			end)

			-- Remove current file from harpoon
			keymap.set("n", "<leader>hr", function()
				harpoon_mark.rm_file()
			end)

			-- Remove all files from harpoon
			keymap.set("n", "<leader>hc", function()
				harpoon_mark.clear_all()
			end)

			-- Quickly jump to harpooned files
			keymap.set("n", "<leader>1", function()
				harpoon_ui.nav_file(1)
			end)

			keymap.set("n", "<leader>2", function()
				harpoon_ui.nav_file(2)
			end)

			keymap.set("n", "<leader>3", function()
				harpoon_ui.nav_file(3)
			end)

			keymap.set("n", "<leader>4", function()
				harpoon_ui.nav_file(4)
			end)

			keymap.set("n", "<leader>5", function()
				harpoon_ui.nav_file(5)
			end)
		end,
	},
}

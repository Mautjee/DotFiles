return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
			"folke/todo-comments.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local buildins = require("telescope.builtin")
			local actions = require("telescope.actions")
			local transform_mod = require("telescope.actions.mt").transform_mod

			local trouble = require("trouble")
			local trouble_telescope = require("trouble.providers.telescope")

			-- or create your custom action
			local custom_actions = transform_mod({
				open_trouble_qflist = function(prompt_bufnr)
					trouble.toggle("quickfix")
				end,
			})

			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
							["<C-d>"] = actions.delete_buffer,
							["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
							["<C-t>"] = trouble_telescope.smart_open_with_trouble,
						},
					},
					file_ignore_patterns = {
						"node_modules",
						"yarn.lock",
						".yarn",
						".git",
						".sl",
						"_build",
						".next",
					},
					hidden = true,
				},
			})

			telescope.load_extension("fzf")

			--set keymaps
			local keymap = vim.keymap

			keymap.set("n", "<leader>?", buildins.oldfiles, { desc = "[?] Find recently opened files" })
			keymap.set("n", "<leader><leader>", buildins.buffers, { desc = "[S]earch Open [B]uffers" })
			keymap.set("n", "<leader>ff", function()
				buildins.find_files({ hidden = true })
			end, { desc = "[S]earch [F]iles" })
			keymap.set("n", "<leader>fh", buildins.help_tags, { desc = "[S]earch [H]elp" })
			keymap.set("n", "<leader>fs", buildins.live_grep, { desc = "[S]earch by [G]rep" })
			keymap.set("n", "<leader>fw", buildins.grep_string, { desc = "[F]ind by [G]rep" })

			keymap.set("n", "<leader>fc", function()
				buildins.commands(require("telescope.themes").get_dropdown({
					previewer = false,
				}))
			end, { desc = "[F]ind [C]ommands" })

			keymap.set("n", "<leader>/", function()
				buildins.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer]" })

			keymap.set("n", "<leader>fb", buildins.keymaps, { desc = "Find [K]ey [B]indings" })

			keymap.set("n", "<leaader>ss", function()
				buildins.spell_suggest(require("telescope.themes").get_dropdown({
					previewer = false,
				}))
			end, { desc = "[S]earch [S]pelling suggestions" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}

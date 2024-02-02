local M = {}

-- telescope
M.currentBufferFuzzyFind = function()
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end

M.searchInProject = function()
	require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end

-- harpoon
M.moveNext = function()
	require("harpoon.ui").nav_next()
end

M.movePrev = function()
	require("harpoon.ui").nav_prev()
end

M.movePos = function(fileNumber)
	require("harpoon.ui").nav_file(fileNumber)
end
return M

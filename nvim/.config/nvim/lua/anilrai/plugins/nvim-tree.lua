local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	print(" nvim-tree not found! ")
	return
end

-- recommended settings from nvim tree docs
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

nvimtree.setup({
	renderer = {
		indent_markers = {
			enable = true,
			-- icons = {
			-- 	corner = "L",
			-- 	edge = " ",
			-- 	item = " ",
			-- 	none = "  ",
			-- },
		},
		-- icons = {
		-- padding = "  ",
		-- glyphs = {
		--   folder = {
		--     arrow_closed = "", -- arrow when folder is closed
		--     arrow_open = "", -- arrow when folder is open
		--   }
		-- },
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})

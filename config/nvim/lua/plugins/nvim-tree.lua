return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

		require("nvim-tree").setup({
			view = { width = 32 },
			renderer = {
				highlight_git = true,
				root_folder_label = false,
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "",
							arrow_open = "",
						},
					},
				},
			},
			update_focused_file = { enable = true },
			actions = {
				open_file = { window_picker = { enable = false } },
			},
		})
	end,
}

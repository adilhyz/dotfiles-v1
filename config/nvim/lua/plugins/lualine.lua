return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		local theme = require("lualine.themes.onedark")
		local colors = {
			blue = "#65D1FF",
			green = "#3EFFDC",
			violet = "#FF61EF",
			yellow = "#FFDA7B",
			black = "#000000",
		}
		theme.normal.a.bg = colors.blue
		theme.insert.a.bg = colors.green
		theme.visual.a.bg = colors.violet
		theme.command = {
			a = { gui = "bold", bg = colors.yellow, fg = colors.black },
		}
		require("lualine").setup({
			options = {
				theme = theme,
			},
			sections = {
				lualine_c = { { "filename", file_status = true, path = 1 } },
			},
		})
	end,
}

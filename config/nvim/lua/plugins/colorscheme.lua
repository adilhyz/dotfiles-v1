return {
	"navarasu/onedark.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local ok, onedark = pcall(require, "onedark")
		if not ok then
			vim.notify("Colorscheme 'onedark' not found!", vim.log.levels.WARN)
			return
		end

		onedark.setup({
			style = "darker",
			transparent = true,
		})
		onedark.load()
	end,
}
-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("tokyonight").setup({
-- 			style = "night",
-- 			transparent = true,
-- 			-- terminal_colors = true,
-- 			styles = {
-- 				sidebars = "dark",
-- 				floats = "dark",
-- 				comments = { italic = true },
-- 				keywords = { italic = true },
-- 				functions = { italic = true },
-- 				variables = { italic = true },
-- 			},
-- 		})
-- 		vim.cmd.colorscheme("tokyonight-night")
-- 	end,
-- }

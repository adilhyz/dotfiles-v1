return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("hlchunk").setup({
			chunk = {
				enable = true
			},
		   indent = {
				enable = false,
				chars = {
				   "│",
				   "¦",
				   "┆",
				   "┊",
			   },
			   style = {
				   vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
			   },
			},
		   line_num = {
			   style = "#806d9c",
		   },
		})
	end
}


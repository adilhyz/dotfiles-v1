return {
	"numToStr/Comment.nvim",
	event = "BufReadPost",
	config = function()
		require("Comment").setup()
	end,
}

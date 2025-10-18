local telescope = require("telescope")

telescope.setup({
  defaults = {
    path_display = { "smart" },
    sorting_strategy = "ascending",
    layout_config = { prompt_position = "top" },
    file_ignore_patterns = { "git", "node_modules", "public", "resources" },
  },
})

telescope.load_extension("fzf")

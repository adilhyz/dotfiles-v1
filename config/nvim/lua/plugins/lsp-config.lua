return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			ensure_installed = { "bashls", "html", "lua_ls", "cssls", "pylsp" },
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		-- config = function ()
		-- 	local capabilities = require("blink.cmp").get_lsp_capabilities()
		-- 	local lspconfig = require("lspconfig")
		-- 	lspconfig.bashls.setup({ capabilities = capabilities })
		-- 	lspconfig.cssls.setup({ capabilities = capabilities })
		-- 	lspconfig.lua_ls.setup({ capabilities = capabilities })
		-- 	lspconfig.pylsp.setup({ capabilities = capabilities })
		--
		-- 	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		-- 	vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "Declaration" })
		-- 	vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Definitions" })
		-- 	vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "References" })
		-- 	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
		-- end,
	},


	{
		"meanderingprogrammer/render-markdown.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },
		config = function()
			require('render-markdown').setup({
				completions = { lsp = { enabled = true } },
			})
		end
	},
	{
		"frabjous/knap",
		lazy = false,
		ft = { "markdown", "pandoc" },
		config = function()
			vim.g.knap_settings = {
				mdoutputext = "pdf",
				mdtopdf = "pandoc %docroot% -o %outputfile% --pdf-engine=xelatex --from markdown+raw_tex -V mainfont='Noto Sans' -V monofont='JetBrains Mono' -V CJKmainfont='Noto Sans CJK SC' -V emoji='Noto Color Emoji'",
				mdtopdfviewerlaunch = "xdg-open %outputfile%",
				mdtopdfviewerrefresh = "xdg-open %outputfile%",
				mdtopdfbufferasstdin = false,
			}

			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "markdown", "pandoc" },
				callback = function()
					local knap = require("knap")
					vim.keymap.set("n", "<leader>o", knap.process_once,
						{ buffer = true, desc = "Knap: compile once" })
					vim.keymap.set("n", "<leader>oq", knap.toggle_autopreviewing,
						{ buffer = true, desc = "Knap: toggle auto preview" })
				end,
			})
		end,
	}
}

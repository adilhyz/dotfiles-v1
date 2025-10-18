require('Comment').setup()

local fn = vim.fn -- entahlah
local cmp = require('cmp')

cmp.setup({
    sources = {
        { name = 'nvim_lsp' }, -- Autocomplete from LSP servers
        { name = 'buffer' },   -- Autocomplete from open buffers
        { name = 'cmdline' },  -- Autocomplete for command-line
        { name = 'path' },     -- Autocomplete for file paths
        { name = 'vsnip' },    -- Autocomplete for snippets (Vsnip)
    },
    completion = {
        completeopt = 'menu,menuone,noselect',
    },
    mapping = {
        ['<Down>'] = cmp.mapping.select_next_item(), -- Navigasi ke item berikutnya
        ['<Up>'] = cmp.mapping.select_prev_item(), -- Navigasi ke item sebelumnya
        ['<C-k>'] = cmp.mapping.scroll_docs(-1),  -- Gulir dokumen ke atas
        ['<C-l>'] = cmp.mapping.scroll_docs(1), -- Gulir dokumen ke bawah
        ['<C-e>'] = cmp.mapping.abort(), -- Batalkan operasi
        ['<C-Space>'] = cmp.mapping.complete(), -- Melihat snippet
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter
        -- ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    },
    snippet = {
        expand = function(args)
            fn["vsnip#anonymous"](args.body)
        end,
    },
})
-- require('compe').setup {
--   enabled = true,
--   autocomplete = true,
--   source = {
--     path = true,
--     buffer = true,
--     calc = true,
--     nvim_lsp = true,
--     nvim_lua = true,
--     vsnip = true,
--     ultisnips = true,
--   },
-- }

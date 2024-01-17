require('Comment').setup()

local cmp = require('cmp')
local fn = vim.fn -- entahlah

cmp.setup({
    sources = {
        { name = 'nvim_lsp' }, -- Autocomplete from LSP servers
        { name = 'buffer' },   -- Autocomplete from open buffers
        { name = 'vsnip' }, -- For vsnip users.
    },
    completion = {
        completeopt = 'menu,menuone,noselect',
    },
    mapping = {
        -- ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<C-k>'] = cmp.mapping.scroll_docs(-1),
        ['<C-l>'] = cmp.mapping.scroll_docs(1),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    snippet = {
        expand = function(args)
            fn["vsnip#anonymous"](args.body)
        end,
    },
})

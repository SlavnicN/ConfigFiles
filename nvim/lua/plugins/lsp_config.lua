--
-- lspconfig settings
--

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')

local custom_on_attach = function()
    --vim.keymap.set is a new feature from neovim 0.7
    --buffer = 0 means this keymap is only available in the crent buffer
    -- press K again to enter the hover window to scroll in it
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
    -- Ctrl + t will get you back previous (definition)
    -- it apply on the tag list, base on time definition jump 
    -- ctrl + o on the jump list, based on movements
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer = 0})
    vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, {buffer = 0})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {buffer = 0})
    -- Integrate this with Telescope diagnostics
    -- You can configure vim.diagnostic for how it is printed in the file
    -- You can integret a external linter
    vim.keymap.set('n', '<space>dn', vim.diagnostic.goto_next, {buffer = 0})
    vim.keymap.set('n', '<space>dp', vim.diagnostic.goto_prev, {buffer = 0})
    vim.keymap.set('n', '<space>dl', "<cmd>Telescope diagnostics<cr>", {buffer = 0})
    -- do a :wa to save all the buffer just in case it change everywhere
    vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, {buffer = 0})

end,

require'lspconfig'.rust_analyzer.setup{
    capabilities = capabilities, 
    on_attach = custom_on_attach
}

require'lspconfig'.gopls.setup{
    capabilities = capabilities, 
    on_attach = custom_on_attach
}

require'lspconfig'.pyright.setup{
    capabilities = capabilities, 
    on_attach = custom_on_attach
}

require'lspconfig'.solidity_ls.setup{
    capabilities = capabilities,
    on_attach = custom_on_attach,
    --root_dir = lspconfig.util.root_pattern(".git", "package.json")
    --settings ={ 
    --    solidity = { 
    --        remapping = { ["@OpenZeppelin/"] = 'node_modules/OpenZeppelin/openzeppelin-contracts@4.6.0/' } 
    --    } 
    --}

}

--require'lspconfig'.solc.setup{
--    capabilities = capabilities, 
--    on_attach = custom_on_attach,
--}

require'lspconfig'.tsserver.setup{
    capabilities = capabilities, 
    on_attach = custom_on_attach
}

vim.opt.completeopt={"menu", "menuone", "noselect"} --set completeopt=menu,menuone,noselect

-- Setup nvim-cmp.
local cmp = require'cmp'


cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- Pick a snippet
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-g>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer', keyword_length = 5 },
    })
})


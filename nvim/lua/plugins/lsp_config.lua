--
-- lspconfig settings
--

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')

local custom_on_attach = function()
    --vim.keymap.set is a new feature from neovim 0.7
    --buffer = 0 means this keymap is only available in the current buffer
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

require'lspconfig'.gopls.setup{
    capabilities = capabilities, 
    on_attach = custom_on_attach
}

require'lspconfig'.pyright.setup{
    capabilities = capabilities, 
    on_attach = custom_on_attach
}

--require'lspconfig'.solidity_ls.setup{
    --capabilities = capabilities
--    on_attach = custom_on_attach,
--    root_dir = lspconfig.util.root_pattern('hardhat.config.*', '.git')
--}

-- require'lspconfig'.solidity_ls.setup{
require'lspconfig'.solc.setup{
    capabilities = capabilities, 
    on_attach = custom_on_attach,
    -- No need apperently
    root_dir = lspconfig.util.root_pattern('hardhat.config.*', '.git')
}
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

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
--local opts = { noremap=true, silent=true }
--vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
--vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
--vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
--vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
--
---- Use an on_attach function to only map the following keys
---- after the language server attaches to the current buffer
--local on_attach = function(client, bufnr)
--    -- Enable completion triggered by <c-x><c-o>
--    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--
--    -- Mappings.
--    -- See `:help vim.lsp.*` for documentation on any of the below functions
--    local bufopts = { noremap=true, silent=true, buffer=bufnr }
--    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
--    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
--    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
--    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
--    vim.keymap.set('n', '<space>wl', function()
--        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))end, bufopts)
--    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
--    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
--    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
--    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
--end
---- Add additional capabilities supported by nvim-cmp
--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
--local lspconfig = require('lspconfig')
--
---- Enable some language servers with the additional completion capabilities offered by nvim-cmp
--local servers = { 'pyright'}
--for _, lsp in ipairs(servers) do
--    lspconfig[lsp].setup {
--        on_attach = on_attach,
--        capabilities = capabilities,
--    }
--end
--
---- luasnip setup
--local luasnip = require 'luasnip'
--
---- nvim-cmp setup
--local cmp = require 'cmp'
--cmp.setup {
--    snippet = {
--        expand = function(args)
--            luasnip.lsp_expand(args.body)
--        end,
--    },
--    mapping = cmp.mapping.preset.insert({
--        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--        ['<C-f>'] = cmp.mapping.scroll_docs(4),
--        ['<C-Space>'] = cmp.mapping.complete(),
--        ['<CR>'] = cmp.mapping.confirm {
--            behavior = cmp.ConfirmBehavior.Replace,
--            select = true,
--        },
--        ['<Tab>'] = cmp.mapping(function(fallback)
--            if cmp.visible() then
--                cmp.select_next_item()
--            elseif luasnip.expand_or_jumpable() then
--                luasnip.expand_or_jump()
--            else
--                fallback()
--            end
--        end, { 'i', 's' }),
--        ['<S-Tab>'] = cmp.mapping(function(fallback)
--            if cmp.visible() then
--                cmp.select_prev_item()
--            elseif luasnip.jumpable(-1) then
--                luasnip.jump(-1)
--            else
--                fallback()
--            end
--        end, { 'i', 's' }),
--    }),
--    sources = {
--        { name = 'nvim_lsp' },
--        { name = 'luasnip' },
--    },
--}

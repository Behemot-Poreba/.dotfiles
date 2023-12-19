return {
    'vonheikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
        --- uncomment these if you want to manage lsp servers from neovim
        {
            'williamboman/mason.nvim',
            config = function()
                require('mason').setup({})
            end,
        },
        {
            'williamboman/mason-lspconfig.nvim',
            dependencies = {'vonheikemen/lsp-zero.nvim'},
            config = function()
            end,
        },

        -- lsp support
        {'neovim/nvim-lspconfig'},
        -- autocompletion
        {
            'hrsh7th/nvim-cmp',
            config = function ()
                local cmp = require('cmp')
                local cmp_select = {behavior = cmp.SelectBehavior.Select}

        local lsp_zero = require('lsp-zero')

                cmp.setup({
                    sources = {
                        {name = 'nvim_lsp'},
                        {name = 'nvim_lua'},
                        {name = 'luasnip'},
                        {name = 'orgmode'},
                        {name = 'nvim_lsp_signature_help'},
                        {name = 'nvim_lsp_document_symbol'},
                        {name = 'plugins'},
                        {name = 'path'},
                        {
                            name = 'spell',
                            option = {
                                keep_all_entries = false,
                                enable_in_context = function()
                                    return true
                                end,
                            },
                        },
                        -- {name = 'vimtex'},
                        -- {name = 'zsh'},
                        -- {name = 'buffer'},
                        -- {name = 'cmdline'},
                        -- { name = "fonts", option = { space_filter = "-" } },

                    },
                    formatting = lsp_zero.cmp_format(),
                    mapping = cmp.mapping.preset.insert({
                        ['<c-p>'] = cmp.mapping.select_prev_item(cmp_select),
                        ['<c-n>'] = cmp.mapping.select_next_item(cmp_select),
                        ['<c-y>'] = cmp.mapping.confirm({ select = true }),
                        ['<c-space>'] = cmp.mapping.complete(),
                    }),
                    experimental = {
                        native_menu = false,
                        ghost_text = true,
                    }
                })
            end
        },
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},
        {'hrsh7th/cmp-nvim-lsp-document-symbol'},
        {'hrsh7th/cmp-nvim-lsp-signature-help'},
        {'l3mon4d3/luasnip'},
        {'hrsh7th/cmp-path'},
        {'hrsh7th/cmp-buffer'},
        {'f3fora/cmp-spell'},
        {"KadoBOT/cmp-plugins"},
        {'tamago324/cmp-zsh'},
        {'Shougo/deol.nvim'},
        {'saadparwaiz1/cmp_luasnip'},
        {'micangl/cmp-vimtex'},
        {
            'KadoBOT/cmp-plugins',
            config = function ()
                files = { ".*\\.lua" }  -- default
                -- files = { "plugins.lua", "some_path/plugins/" } -- Recommended: use static filenames or partial paths
            end,
        },
        --"cmp-vimtex"
    },

    config = function ()
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(client, bufnr)
            local opts = {buffer = bufnr, remap = false}

            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("i", "<c-h>", function() vim.lsp.buf.signature_help() end, opts)
        end)

        require('mason-lspconfig').setup({
            ensure_installed = {'tsserver', 'rust_analyzer'},
            handlers = {
                lsp_zero.default_setup,
                lua_ls = function()
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    require('lspconfig').lua_ls.setup(lua_opts)
                end,
            }
        })
    end,
}


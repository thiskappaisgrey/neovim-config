return { {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        config = function()
                require('lspconfig')
                local lsp = require('lsp-zero')
                --	require('lspconfig').lua_ls.setup({})
                -- local cmp = require('cmp')
                -- local cmp_select = {behavior = cmp.SelectBehavior.Select}
                -- local cmp_mappings = lsp.defaults.cmp_mappings({
                -- 	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                -- 	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                -- 	['<C-y>'] = cmp.mapping.confirm({ select = true }),
                -- 	["<C-Space>"] = cmp.mapping.complete(),
                -- })

                -- cmp_mappings['<Tab>'] = nil
                -- cmp_mappings['<S-Tab>'] = nil


                lsp.on_attach(function(client, bufnr)
                        -- see :help lsp-zero-keybindings
                        -- to learn the available actions
                        local opts = function(desc) return { buffer = bufnr, remap = false, desc = desc } end
                        -- TODO might want to use some otehr mechanism..?
                        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
                                { buffer = bufnr, remap = false, desc = "Goto Definition" })
                        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts("Hover"))
                        -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
                                opts("Open Diagnostic"))
                        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts("Goto next diagnostic"))
                        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts("Goto prev diagnostic"))
                        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts("Code action"))
                        vim.keymap.set("n", "<leader>cr", function() vim.lsp.buf.references() end, opts("References"))
                        vim.keymap.set("n", "<leader>cn", function() vim.lsp.buf.rename() end, opts("Rename"))
                        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts("Signature Help"))
                end)
                lsp.setup_servers({ 'rust_analyzer', 'nil_ls', 'pyright', 'typst_lsp', 'svls' })
        end,
        dependencies = { "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp", "hrsh7th/nvim-cmp", "L3MON4D3/LuaSnip" }
},
        {
                "hrsh7th/cmp-nvim-lsp",
                dependencies = { "hrsh7th/cmp-path", "hrsh7th/cmp-buffer" },
                config = function()
                        local cmp = require('cmp')
                        local cmp_action = require('lsp-zero').cmp_action()

                        cmp.setup({
                                select_behavior = 'insert',
                                sources = {
                                        { name = 'nvim_lsp' },
                                        { name = 'path' },
                                        { name = 'buffer' },
                                        { name = 'luasnip' },
                                },
                                mapping = cmp.mapping.preset.insert({
                                        -- `Enter` key to confirm completion
                                        ['<CR>'] = cmp.mapping.confirm({ select = false }),

                                        -- Ctrl+Space to trigger completion menu
                                        ['<C-Space>'] = cmp.mapping.complete(),

                                        -- Navigate between snippet placeholder
                                        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                                        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

                                        -- Scroll up and down in the completion documentation
                                        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                                        ['<C-d>'] = cmp.mapping.scroll_docs(4),
                                }),
                                snippet = {
                                        expand = function(args)
                                                require('luasnip').lsp_expand(args.body)
                                        end,
                                },
                                --windows
                                window = {
                                        completion = cmp.config.window.bordered(),
                                        documentation = cmp.config.window.bordered(),
                                },
                                -- formatting = {
                                -- fields = { 'abbr', 'kind', 'menu' },
                                -- format = require('lspkind').cmp_format({
                                -- 	mode = 'symbol_text', -- show only symbol annotations
                                -- 	maxwidth = 50, -- prevent the popup from showing more than provided characters
                                -- 	ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
                                -- })
                                -- },
                        })
                end
        }


}

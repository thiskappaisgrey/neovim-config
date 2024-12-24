return {
        -- TODO: Remove LSP Zero and configure the cmp stuff myself..?
        {
                "neovim/nvim-lspconfig",
                config = function()
                        local lspconfig = require('lspconfig')
                        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
                        local default_setup = function(server)
                                lspconfig[server].setup({
                                        capabilities = lsp_capabilities,
                                })
                        end
                        -- lsp.setup_servers({ 'rust_analyzer', 'nil_ls', 'pyright', 'typst_lsp', 'svls', 'ccls' })
                        -- I can have haskell-tools + rust-tools set up their own servers
                        default_setup("pyright")
                        default_setup("nil_ls")
                        -- default_setup("zls")
                        default_setup("ccls")
                        default_setup("nickel_ls")
                        default_setup("gleam")
                        default_setup("gopls")
                        -- default_setup("emmet_language_server")
                        default_setup("tailwindcss")
                        default_setup("dafny")
                        default_setup("ocamllsp")
                        default_setup("typst_lsp")
                        default_setup("unison")

                        lspconfig["zls"].setup {
                                settings = {
                                        ['zls'] = {
                                                enable_build_on_save = true,
                                                build_on_save_step = "check"
                                        },
                                },
                        }

                        lspconfig.emmet_language_server.setup({
                                filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact" },
                                -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
                                -- **Note:** only the options listed in the table are supported.
                                init_options = {
                                        ---@type table<string, string>
                                        includeLanguages = {},
                                        --- @type string[]
                                        excludeLanguages = {},
                                        --- @type string[]
                                        extensionsPath = {},
                                        --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
                                        preferences = {},
                                        --- @type boolean Defaults to `true`
                                        showAbbreviationSuggestions = true,
                                        --- @type "always" | "never" Defaults to `"always"`
                                        showExpandedAbbreviation = "always",
                                        --- @type boolean Defaults to `false`
                                        showSuggestionsAsSnippets = false,
                                        --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
                                        syntaxProfiles = {},
                                        --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
                                        variables = {},
                                },
                        })

                        vim.api.nvim_create_autocmd('LspAttach', {
                                desc = 'LSP Actions',
                                callback = function(event)
                                        -- local opts = { buffer = event.buf }
                                        local opts = function(desc)
                                                return {
                                                        buffer = event.buf,
                                                        remap = false,
                                                        desc =
                                                            desc
                                                }
                                        end
                                        -- TODO might want to use some otehr mechanism..?
                                        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
                                                opts("Goto definition"))
                                        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts("Hover"))
                                        -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                                        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
                                                opts("Open Diagnostic"))
                                        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end,
                                                opts("Goto next diagnostic"))
                                        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end,
                                                opts("Goto prev diagnostic"))
                                        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end,
                                                opts("Code action"))
                                        vim.keymap.set("n", "<leader>cr", function() vim.lsp.buf.references() end,
                                                opts("References"))
                                        vim.keymap.set('n', '<leader>ct', vim.lsp.buf.type_definition, opts("Type def"))
                                        vim.keymap.set('n', '<leader>ce', function()
                                                vim.diagnostic.setqflist({
                                                        severity = {
                                                                vim.diagnostic.severity.ERROR,
                                                        }
                                                })
                                        end, opts("Errors"))
                                        vim.keymap.set('n', '<leader>cd', vim.diagnostic.setqflist, opts("Diagnostics"))
                                        vim.keymap.set("n", "<leader>cn", function() vim.lsp.buf.rename() end,
                                                opts("Rename"))
                                        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
                                                opts("Signature Help"))
                                        vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>")
                                        vim.keymap.set("n", "<leader>k", "<cmd>cprev<CR>")
                                end
                        })
                end,
                dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/nvim-cmp", "L3MON4D3/LuaSnip" }
        },
        {
                "hrsh7th/nvim-cmp",
                dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-path", "hrsh7th/cmp-buffer", "kdheepak/cmp-latex-symbols" },
                config = function()
                        local cmp = require('cmp')

                        cmp.setup({
                                select_behavior = 'insert',
                                sources = {
                                        { name = 'nvim_lsp' },
                                        { name = 'path' },
                                        { name = 'buffer' },
                                        { name = 'luasnip' },
                                        {
                                                name = "latex_symbols",
                                                option = { strategy = 0 }
                                        }
                                },
                                mapping = cmp.mapping.preset.insert({
                                        -- `Enter` key to confirm completion
                                        ['<CR>'] = cmp.mapping.confirm({ select = false }),

                                        -- Ctrl+Space to trigger completion menu
                                        ['<C-Space>'] = cmp.mapping.complete(),

                                        -- TODO: Navigate between snippet placeholder

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
        },
        {
                "olrtg/nvim-emmet",
                config = function()
                        vim.keymap.set({ "n", "v" }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation)
                end,
        },


}

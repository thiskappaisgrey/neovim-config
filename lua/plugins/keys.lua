return {
        {
                "folke/which-key.nvim",
                event = "VeryLazy",
                init = function()
                        vim.o.timeout = true
                        vim.o.timeoutlen = 300
                end,
                opts = {}
        },
        {
                "FeiyouG/commander.nvim",
                dependencies = { "nvim-telescope/telescope.nvim" },

                keys = {
                        { "<leader>bc", "<CMD>Telescope commander<CR>", mode = "n" },
                        { "<leader>bd", "<cmd>bd<cr>",                  mode = "n" },
                        { "<leader>bD", "<cmd>%bd|e#<cr>",              mode = "n" },
                        { "<leader>bb", "<CMD>Telescope buffers<CR>",   mode = "n" },
                        { "<leader>ws", "<cmd>split<cr>",               mode = "n", desc = "Split window horizontally" },
                        { "<leader>wv", "<cmd>vsplit<cr>",              mode = "n", desc = "Split window veritically" },
                        { "<leader>wo", "<cmd>only<cr>",                mode = "n", desc = "Only window" },
                        { "<leader>wd", "<cmd>close<cr>",               mode = "n", desc = "Close window" },
                        { "<leader>ww", "<C-w>w",                       mode = "n", desc = "Close window" },
                        { "Y",          [["+y]],                        mode = "n", desc = "Yank to clipboard" },
                },
                config =
                    function()
                            require("commander").setup({
                                    components = {
                                            "DESC",
                                            "KEYS",
                                            "CAT",
                                    },
                                    sort_by = {
                                            "DESC",
                                            "KEYS",
                                            "CAT",
                                            "CMD"
                                    },
                                    integration = {
                                            telescope = {
                                                    enable = true,
                                            },
                                            lazy = {
                                                    enable = true,
                                                    set_plugin_name_as_cat = true
                                            }
                                    }
                            })

                            local set = vim.keymap.set

                            -- These mappings control the size of splits (height/width)
                            set("n", "<M-,>", "<c-w>5<")
                            set("n", "<M-.>", "<c-w>5>")
                            set("n", "<M-t>", "<C-W>+")
                            set("n", "<M-s>", "<C-W>-")
                    end
        }
}

return {
        {
                "nvim-telescope/telescope.nvim",
                keys = {
                        { "<leader>ff", "<cmd>Telescope file_browser<cr>", desc = "Telescope find file" },
                        { "<leader>fz", "<cmd>Telescope fd<cr>",           desc = "Telescope find file" },
                        { "<leader>fg", "<cmd>Telescope live_grep<cr>",    desc = "Telescope find file" },
                        { "<leader>fs", "<cmd>Telescope grep_string<cr>",  mode = { "n", "v" },         desc = "Telescope find file" },
                        { "<leader>:",  "<cmd>Telescope commands<cr>",     desc = "Telescope commands" },
                        { "<leader>fg", "<cmd>Telescope git_files<cr>",    desc = "Telescope commands" },

                },
                config = function()
                        local telescope = require("telescope")
                        telescope.setup({
                                extensions = {
                                        file_browser = {
                                                theme = "ivy",
                                                hijack_netrw = true
                                        }
                                },
                        })
                        telescope.load_extension("file_browser")
                end,
                lazy = false,
                dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" }

        },

        {
                'stevearc/dressing.nvim',
                opts = {},
        }
}

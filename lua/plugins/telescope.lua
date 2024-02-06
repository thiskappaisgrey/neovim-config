return {
        {
                "nvim-telescope/telescope.nvim",
                keys = {
                        { "<leader>ff", "<cmd>Telescope file_browser<cr>", desc = "Telescope find file" },
                        { "<leader>fz", "<cmd>Telescope fd<cr>",           desc = "Telescope find file" },
                        { "<leader>fg", "<cmd>Telescope live_grep<cr>",    desc = "Telescope find file" },
                        { "<leader>fc", "<cmd>cd %:p:h<cr>",               desc = "CD to current file" },
                        { "<leader>fs", "<cmd>Telescope grep_string<cr>",  mode = { "n", "v" },         desc = "Telescope find file" },
                        { "<leader>:",  "<cmd>Telescope commands<cr>",     desc = "Telescope commands" },
                        { "<leader>fg", "<cmd>Telescope git_files<cr>",    desc = "Telescope commands" },
                        {
                                "<leader>fw",
                                function()
                                        local telescope = require("telescope")
                                        telescope.extensions.whaler.whaler()
                                end,
                                desc = "Telescope commands"
                        }
                        -- { "<leader>cs", "<cmd>Telescope argolens<cr>",     desc = "Telescope commands" },

                },
                config = function()
                        local telescope = require("telescope")
                        telescope.setup({
                                extensions = {
                                        file_browser = {
                                                theme = "ivy",
                                                hijack_netrw = true
                                        },
                                        agrolens = {},
                                        whaler = {
                                                directories = { "~/projects/share", "~/projects/share/research-proj", "~/.config/nvim", "~/.dotfiles" }
                                        }
                                },
                        })
                        telescope.load_extension("file_browser")
                        telescope.load_extension("agrolens")
                        telescope.load_extension("whaler")
                end,
                lazy = false,
                dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim", "desdic/agrolens.nvim", "SalOrak/whaler" }

        },

        {
                'stevearc/dressing.nvim',
                opts = {},
        }
}

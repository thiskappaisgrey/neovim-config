return { {
        'echasnovski/mini.files',
        version = '*',
        lazy = false,
        opts = {},
        keys = { {
                "<leader>fd",
                function()
                        local MiniFiles = require("mini.files")
                        MiniFiles.open()
                end,
                desc = "File explorer"
        } },
},
}

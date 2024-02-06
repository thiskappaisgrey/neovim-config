-- :fennel:1699590622
local ensure_installed = { "fennel", "rust", "nix", "haskell" }
local function config(_, opts)
        return (require("nvim-treesitter.configs")).setup(opts)
end
return {
        {
                "nvim-treesitter/nvim-treesitter",
                dependencies = {},
                build = ":TSUpdate",
                opts = {
                        ensure_installed = ensure_installed,
                        auto_install = true,
                        highlight = { enable = true, additional_vim_regex_highlighting = false },
                        -- context_commentstring = {enable = true, enable_autocmd = false},
                        endwise = { enable = true }
                },
                config = config,
                version = false
        },
        { "nvim-treesitter/playground" },
        {
                "nvim-treesitter/nvim-treesitter-context",
                lazy = false,
                config = function()
                        require 'treesitter-context'.setup {
                                enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
                                max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
                                min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                                line_numbers = true,
                                multiline_threshold = 20, -- Maximum number of lines to show for a single context
                                trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                                mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
                                -- Separator between context and content. Should be a single character string, like '-'.
                                -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                                separator = nil,
                                zindex = 20,     -- The Z-index of the context window
                                on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
                        }
                end
        }
}

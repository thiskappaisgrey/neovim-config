-- :fennel:1699590622
local ensure_installed = { "fennel", "rust", "nix", "haskell", "ocaml" }
local function config(_, opts)
        return (require("nvim-treesitter.configs")).setup(opts)
end
return {
        {
                "nvim-treesitter/nvim-treesitter",
                dependencies = { { "nushell/tree-sitter-nu" } },
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
                "Dkendal/nvim-treeclimber",
                config = function()
                        require('nvim-treeclimber').setup()
                end
        }
}

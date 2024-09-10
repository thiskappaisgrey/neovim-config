-- ~/.config/nvim/plugin/0-tangerine.lua or ~/.config/nvim/init.lua

-- pick your plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
                "git",
                "clone",
                "--filter=blob:none",
                "https://github.com/folke/lazy.nvim.git",
                "--branch=stable", -- latest stable release
                lazypath,
        })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.wo.relativenumber = true
vim.filetype.add({
        extension = {
                egg = "lisp"
        }
})
vim.opt.expandtab = true

vim.g.neovide_cursor_vfx_mode = "ripple"
vim.g.neovide_cursor_animate_in_insert_mode = false
vim.o.guifont = "Hasklug Nerd Font:h12"



vim.g.haskell_tools = {
        hls = {
                settings = {
                        haskell = {
                                plugin =
                                { stan = { globalOn = false }
                                }
                        }
                }
        },
}

-- vim.map.
require("lazy").setup("plugins")

if vim.g.neovide == true then
        vim.api.nvim_set_keymap("n", "<A-x>",
                ":lua vim.g.neovide_scale_factor = math.min(vim.g.neovide_scale_factor + 0.1,  1.0)<cr>",
                { silent = true })
        vim.api.nvim_set_keymap("n", "<C-x>",
                ":lua vim.g.neovide_scale_factor = math.max(vim.g.neovide_scale_factor - 0.1,  0.1)<CR>",
                { silent = true })
        vim.api.nvim_set_keymap("n", "<A-(>",
                ":lua vim.g.neovide_transparency = math.min(vim.g.neovide_transparency + 0.05, 1.0)<CR>",
                { silent = true })
        vim.api.nvim_set_keymap("n", "<C-_>",
                ":lua vim.g.neovide_transparency = math.max(vim.g.neovide_transparency - 0.05, 0.0)<CR>",
                { silent = true })
        vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 0.5<CR>", { silent = true })
        vim.api.nvim_set_keymap("n", "<C-)>", ":lua vim.g.neovide_transparency = 0.9<CR>", { silent = true })
end

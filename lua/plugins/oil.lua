return {
  'stevearc/oil.nvim',
  opts = { default_file_explorer = true },
  keys = { { "<leader>fd", "<cmd>:Oil<cr>", desc = "File explorer"} },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

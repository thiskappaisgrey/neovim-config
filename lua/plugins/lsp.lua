return {{"VonHeikemen/lsp-zero.nvim", branch = "v3.x", 
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
	 local opts =  function(desc) return {buffer = bufnr, remap = false, desc = desc } end
	 -- TODO might want to use some otehr mechanism..?
	 vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { buffer = bufnr, remap = false, desc = "Goto Definition"})
	 vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts("Hover"))
	 -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	 vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts("Open Diagnostic"))
	 vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts("Goto next diagnostic"))
	 vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts("Goto prev diagnostic"))
	 vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts("Code action"))
	 vim.keymap.set("n", "<leader>cr", function() vim.lsp.buf.references() end, opts("References"))
	 vim.keymap.set("n", "<leader>cn", function() vim.lsp.buf.rename() end, opts("Rename"))
	 vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts("Signature Help"))
	end)
	lsp.setup_servers({ 'rust_analyzer'})
end,
dependencies = {"neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp", "hrsh7th/nvim-cmp", "L3MON4D3/LuaSnip"}
}}

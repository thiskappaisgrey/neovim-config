return {
	'LhKipp/nvim-nu',
	opts = {
		use_lsp_features = false,
		all_cmd_names = [[nu -c 'help commands | get name | str join "\n"']]
	}
}

return {
	{
		"mbbill/undotree",

		-- only load the plugin when you actually hit the keymap
		keys = {
			{ "<leader>tu", vim.cmd.UndotreeToggle, desc = "Undo Tree" },
		},
	},
}

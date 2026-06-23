return {
	{
		"mbbill/undotree",

		-- only load the plugin when you actually hit the keymap
		keys = {
			{ "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle [U]ndo Tree" },
		},
	},
}

return {
	{
		"s1n7ax/nvim-window-picker",
		name = "window-picker",
		version = "2.*",
		keys = {
			{
				"<C-w>c",
				function()
					local win_id = require("window-picker").pick_window()
					if win_id then
						vim.api.nvim_set_current_win(win_id)
					end
				end,
				desc = "Choose Window",
			},
		},
		opts = {
			hint = "floating-big-letter",
			selection_chars = "HJKLMNOPQRSTUV",
			filter_rules = {
				autoselect_one = true,
				include_current = false,
				bo = {
					filetype = { "snacks_layout_box", "snaks_picker_input", "notify", "qf" },
					buftype = { "terminal", "quickfix" },
				},
			},
		},
	},
}

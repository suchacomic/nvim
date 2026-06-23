return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		-- No legacy nvim-cmp dependencies are required here anymore!
		opts = {
			check_ts = true, -- Enable Tree-sitter integration to avoid pairing inside strings or comments
			ts_config = {
				lua = { "string", "source" }, -- Don't add pairs inside lua string nodes
				javascript = { "string", "template_string" },
			},
			disable_filetype = { "TelescopePrompt", "spectre_panel" },
			-- change default fast_wrap
			fast_wrap = {
				map = "<M-e>",
				chars = { "{", "[", "(", '"', "'" },
				pattern = [=[[%'%"%>%]%)%}%,]]=],
				end_key = "$",
				before_key = "h",
				after_key = "l",
				cursor_pos_before = true,
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				manual_position = true,
				highlight = "Search",
				highlight_grey = "Comment",
			},
		},
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)

			-- NOTICE: You do NOT need the legacy `cmp.event:on('confirm_done')` hook here.
			-- blink.cmp handles function argument brackets natively out of the box!
		end,
	},
}

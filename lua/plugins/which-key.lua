return {
	{ -- Shows pending keybinds
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
			defaults = {},

			spec = {
				{ "<leader>c", group = "[C]ode" },
				{ "<leader>d", group = "[D]ocument" },
				{ "<leader>r", group = "[R]ename" },
				{ "<leader>s", group = "[S]earch" },
				{ "<leader>w", group = "[W]orkspce" },
				{ "<leader>t", group = "[T]oggle" },
				{ "<leader>b", group = "[B]uffer" },
				{ "<leader>n", group = "noice" },
				{ "g", group = "goto" },
				{ "gs", group = "surround" },
				{ "z", group = "fold" },
				{ "[", group = "prev" },
				{ "}", group = "next" },
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Keymaps (which-key)",
			},
			{
				"<c-w><space>",
				function()
					require("which-key").show({ keys = "<C-w>", loop = true })
				end,
				desc = "Window Hydra Mode (which-key)",
			},
		},
	},
}

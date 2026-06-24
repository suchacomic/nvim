return {
	{ -- Shows pending keybinds
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
			defaults = {},

			spec = {
				{ "<leader>c", group = "Code" },
				{ "<leader>d", group = "Document" },
				{ "<leader>r", group = "Rename" },
				{ "<leader>s", group = "Search" },
				{ "<leader>w", group = "Workspce" },
				{ "<leader>t", group = "Toggle" },
				{ "<leader>b", group = "Buffer" },
				{ "<leader>n", group = "Notifications" },
				{ "<leader>x", group = "Diagnostics" },
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

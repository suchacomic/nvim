return {
	{
		"rcarriga/nvim-notify",
		opts = {
			stages = "fade",
			timeout = 3000,
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependecies = {
			"MuniTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	-- stylua: ignore
		keys = {
			{"<S-Enter>", function () require("noice").redirect(vim.fm.getcmdline()) end, mode = "c", desc = "Redirect Commandline"},
			{"<leader>nl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
			{ "<leader>nh", function() require("noice").cmd("history") end, desc = "Noice History" },
			{ "<leader>na", function() require("noice").cmd("all") end, desc = "Noice All" },
			{ "<leader>nd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
			{ "<leader>nt", function() require("noice").cmd("pick") end, desc = "Noice Picker Telescope" },
		},
		opts = {
			lsp = {
				-- Override markdown rendering from the LSP server so noice handles it beautifully
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
				-- Automatically show LSP progress (e.g., indexing, loading servers) in a nice notification corner
				progress = {
					enabled = true,
					format = "lsp_progress",
				},
				signature = {
					enabled = false, -- handled by blink.cmp
				},
			},
			presets = {
				command_palette = true,
				long_message_to_split = true,
				lsp_doc_border = true,
				bottom_search = true,
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "; before #" },
							{ find = ": after #" },
							{ find = "written" },
						},
					},
					opts = { skip = true },
				},
			},
		},
		config = function(_, opts)
			if vim.o.filetype == "lazy" then
				vim.cmd([[message clear]])
			end
			require("noice").setup(opts)
		end,
	},
}

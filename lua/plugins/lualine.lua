return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "nord",
				component_separators = { left = "🯕", right = "🯖" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = { "snacks_dashboard" },
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
					refresh_time = 16, -- ~60fps
					events = {
						"WinEnter",
						"BufEnter",
						"BufWritePost",
						"SessionLoadPost",
						"FileChangedShellPost",
						"VimResized",
						"Filetype",
						"CursorMoved",
						"CursorMovedI",
						"ModeChanged",
					},
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					{ "branch", icon = "" },
					{ "diff", symbols = { added = " ", modified = " ", removed = " " } },
					{ "diagnostics" },
				},
				lualine_c = {
					{
						"filename",
						file_status = true,
						path = 1,
					},
				},
				lualine_x = {
					{
						"Linter",
						{
							lint_progress = function()
								local linters = require("lint").get_running()
								if #linters == 0 then
									return "<U+F0995>"
								end
								return "<U+F1276> " .. table.concat(linters, ", ")
							end,
						},
					},
					"fileformat",
					"filetype",
				},
				lualine_y = {
					"lsp_status",
					"progress",
				},
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {
				"fzf",
				"lazy",
				"mason",
			},
		})
	end,
}

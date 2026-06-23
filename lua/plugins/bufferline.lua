return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VeryLazy",
	keys = {
		-- Cycle through open buffers with Shift+h and Shift+l
		{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
		{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
		-- Pining
		{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
		-- Bufferclosing
		{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
		{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
		{ "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },

		{ "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
		{ "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
		{ "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
		{ "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
		{ "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "Pick Buffer" },
	},
	opts = {
		options = {
			mode = "buffers",
			-- stylua: ignore
			close_command = function(n) Snacks.bufdelete(n) end,
			separator_style = "slope",
			diagnostics = "nvim_lsp",
			indicator = { style = "underline" },
			always_show_bufferline = true,
			show_buffer_close_icons = true,
			show_close_icon = false,
			offsets = {
				{
					filetype = "snacks_layout_box",
					name = "󰙅 File Explorer",
					text_align = "left",
					seperator = true,
				},
			},
			-- highlights = require("nord.plugins.bufferline").akinsho(),
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local icon = level:match("error") and " " or " "
				if context.buffer:current() then
					return ""
				end
				return " " .. icon .. count
			end,
		},
	},
	config = function(_, opts)
		opts.highlights = require("nord.plugins.bufferline").akinsho()
		require("bufferline").setup(opts)
	end,
}

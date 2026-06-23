return {
	{
		"nvim-mini/mini.nvim",
		enabled = true,
		config = function()
			-- Better around/inside textobjects for motions
			require("mini.ai").setup({ n_lines = 500 })
			-- Add/Delete/Replace Surroundings (Brackets/Quotes,Pareanthesis)
			require("mini.surround").setup({
				mappings = {
					add = "gsa", -- Add surrounding in Normal and Visual modes
					delete = "gsd", -- Delete surrounding
					find = "gsf", -- Find surrounding (to the right)
					find_left = "gsF", -- Find surrounding (to the left)
					highlight = "gsh", -- Highlight surrounding
					replace = "gsr", -- Replace surrounding
					suffix_last = "gl", -- Suffix to search with "prev" method
					suffix_next = "gn", -- Suffix to search with "next" method
				},
			})
			-- Smart contextual commenting (gcc for line, gc for visual block)
			require("mini.comment").setup()
		end,
	},
}

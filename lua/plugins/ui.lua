return {
	{
		-- Colorscheme --
		-- "shaunsingh/nord.nvim",
		"gbprod/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("nord")
		end,
	},
	{
		-- Icons --
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},
}

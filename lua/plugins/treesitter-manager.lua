return {
	-- lightweight manager to pull down non-bundled languages
	"romus204/tree-sitter-manager.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },

	init = function()
		-- create a global autocommand to trigger native highlighting
		vim.api.nvim_create_autocmd("FileType", {
			desc = "Enable native Neovim Tree-sitter syntax highlighting",
			callback = function()
				--safely start native tree-sitter highlighting engine
				pcall(vim.treesitter.start)

				-- configure native code folding
				vim.wo.foldmethod = "expr"
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				-- keep folds open by default when entering a file
				vim.wo.foldlevel = 99
			end,
		})
	end,

	config = function()
		-- Setup manager for languages not bundles with Neovim core
		require("tree-sitter-manager").setup({
			ensure_installed = {
				"python",
				"bash",
				"zsh",
				"json",
				"yaml",
				"julia",
				"fortran",
				"markdown",
				"lua",
				"vim",
				"vimdoc",
				"markdown_inline",
			},
			auto_install = true,
		})
	end,
}

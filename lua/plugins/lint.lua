return {
	{ -- Linting
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")
			-- Linters
			lint.linters_by_ft = {
				python = { "ruff" },
				sh = { "shellcheck" },
				bash = { "shellcheck" },
				zsh = { "shellcheck" },
				markdown = { "markdownlint", "vale" },
				text = { "vale" },
				tex = { "chktex", "vale", "lacheck" },
				json = { "jsonlint" },
			}

			-- Manual keymap to force diagnostic validation on demand
			vim.keymap.set("n", "<leader>ct", function()
				lint.try_lint()
			end, { desc = "[C]ode [T]rogger linting for current file" })

			-- Automatic background validation trigger
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}

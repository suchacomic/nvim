return {
	"lewis6991/gitsigns.nvim",
	lazy = true,
	config = function()
		local gitsigns = require("gitsigns")

		gitsigns.setup({
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},

			-- Attaches automatically when a file tracked by git is opened and activates mappung

			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end
				-- Navigation b/w changed code blocks
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, { desc = "Next git [C]hange" })

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, { expr = true, desc = "Previous Git [C]hange" })

				--ACTIONS: Stage, Reset and Preview edits inline
				map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "[H]unk [S]tage" })
				map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "[H]unk [R]eset" })
				map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "[H]unk [P]review inline" })

				-- Diff
				map("n", "<leader>hd", gitsigns.diffthis, { desc = "[H]unk [D]iff against index" })
			end,
		})
	end,
}

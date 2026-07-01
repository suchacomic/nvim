return {
	{ -- Fuzzy Finder (files, lsp, etc)
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				-- `build` is used to run some command when the plugin is installed/updated.
				build = "make",
				-- `cond` is a condition used to determine whether this plugin should be
				-- installed and loaded.
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			-- Telescope is a fuzzy finder that comes with a lot of different things that
			-- it can fuzzy find! It's more than just a "file finder", it can search
			-- many different aspects of Neovim, your workspace, LSP, and more!
			--
			-- The easiest way to use Telescope, is to start by doing something like:
			--  :Telescope help_tags
			--
			-- After running this command, a window will open up and you're able to
			-- type in the prompt window. You'll see a list of `help_tags` options and
			-- a corresponding preview of the help.
			--
			-- Two important keymaps to use while in Telescope are:
			--  - Insert mode: <c-/>
			--  - Normal mode: ?
			--
			-- This opens a window that shows you all of the keymaps for the current
			-- Telescope picker. This is really useful to discover what Telescope can
			-- do as well as how to actually do it!

			-- [[ Configure Telescope ]]
			-- See `:help telescope` and `:help telescope.setup()`
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			local themes = require("telescope.themes")

			telescope.setup({
				extensions = {
					["ui-select"] = {
						themes.get_dropdown(),
					},
				},
			})

			-- Enable Telescope extensions 'if' they are installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			-- See `:help telescope.builtin`
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Help" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Keymaps" })
			vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Files" })
			vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "Search Telescope Pickers" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search by Word" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search by Grep" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Diagnostics" })
			vim.keymap.set("n", "<leader>s;", builtin.resume, { desc = "Resume" })
			vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = 'Recent Files ("." for repeat)' })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find existing buffers" })

			-- Git
			vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git Commits" })
			vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git Status" })

			vim.keymap.set("n", "<leader>sr", builtin.registers, { desc = " Search Registers" })
			vim.keymap.set("n", "<leader>sm", builtin.man_pages, { desc = "Search Man Pages" })
			vim.keymap.set("n", "<leader>sq", builtin.quickfix, { desc = "Search Quickfix List" })
			-- Slightly advanced example of overriding default behavior and theme
			vim.keymap.set("n", "<leader>/", function()
				-- You can pass additional configuration to Telescope to change the theme, layout, etc.
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "Fuzzily search in current buffer" })

			-- It's also possible to pass additional configuration options.
			--  See `:help telescope.builtin.live_grep()` for information about particular keys
			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "Search in Open Files" })

			-- Shortcut for searching your Neovim configuration files
			vim.keymap.set("n", "<leader>sc", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "Nvim Config files" })
		end,
	},
}

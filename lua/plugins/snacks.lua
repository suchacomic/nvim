return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			-- 1. Modern Startup Dashboard Configuration
			dashboard = {
				enabled = true,
				preset = {
					header = [[
 ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ 
 ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ 
▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ 
▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  
▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ 
░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ 
░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ 
   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    
         ░    ░  ░    ░ ░        ░   ░         ░    
                                ░                   
                                                    
]],
					keys = {
						{ icon = " ", key = "f", desc = "Find File", action = ":Telescope find_files" },
						{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
						{ icon = " ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles" },
						{ icon = " ", key = "g", desc = "Find Text", action = ":Telescope live_grep" },
						{
							icon = " ",
							key = "c",
							desc = "Config",
							action = function()
								require("telescope.builtin").find_files({ cwd = "~/.config/nvim/" })
							end,
						},
						{
							icon = " ",
							key = "s",
							desc = "Restore Session",
							action = ":lua require('persistence').load()",
						},
						{ icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
						{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
					},
				},
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{ section = "startup" },
				},
			},

			-- 2. Terminal image rendering (Kitty Protocol)
			image = {
				enabled = true,
				doc = { inline = true },
			},

			-- 3. Smart LSP-aware workspace renaming
			rename = { enabled = true },

			-- 4. Explorer replaces neo-tree
			explorer = {
				enabled = true,
			},

			-- 5. Indentation guided & Scope Tracking (replaces blankline-indent)
			indent = {
				enabled = true,
				char = "│",
				only_scope = false,
				only_current = false,
				animate = {
					enabled = true,
					style = "out",
				},
				scope = {
					enabled = true,
					char = "│",
				},
			},

			-- 6. Buffer Deletion without closing split layout
			bufdelete = { enabled = true },

			-- 7. Terminal
			terminal = {
				win = {
					style = "terminal",
				},
			},
		},
		keys = {
			-- Stylua ignore
			-- Map backslash to seamlessly toggle the new Snacks Explorer sidebar
			{
				"\\",
				function()
					Snacks.explorer()
				end,
				desc = "Toggle Explorer",
			},
			-- File rename utility
			{
				"<leader>rf",
				function()
					Snacks.rename.rename_file()
				end,
				desc = "Rename Current File",
			},
			-- Safe buffer delete mappings
			{
				"<leader>bd",
				function()
					Snacks.bufdelete()
				end,
				desc = "Delete Buffer",
			},
			-- Dashboard
			{
				"<leader>;",
				function()
					Snacks.dashboard.open()
				end,
				desc = "Open Dashboard",
			},
			-- Terminal
			{
				"<leader>tt",
				function()
					Snacks.terminal.toggle(nil, {
						win = { style = "bottom", border = "rounded" },
					})
				end,
				desc = " Toggle Terminal",
			},
			{
				"<leader>tf",
				function()
					Snacks.terminal.toggle(nil, {
						win = { style = "float", border = "rounded" },
					})
				end,
				desc = " Toggle Floating Terminal",
			},
			{ -- Quick code runner
				"<leader>cx",
				function()
					local file = vim.api.nvim_buf_get_name(0)
					local ft = vim.bo.filetype
					local cmd = nil

					if ft == "python" then
						cmd = "python3 " .. vim.fn.shellescape(file)
					elseif ft == "lua" then
						cmd = "lua " .. vim.fn.shellescape(file)
					elseif ft == "sh" then
						cmd = "bash " .. vim.fn.shellescape(file)
					elseif ft == "zsh" then
						cmd = "zsh " .. vim.fn.shellescape(file)
					elseif ft == "julia" then
						cmd = "julia " .. vim.fn.shellescape(file)
					end

					if cmd then
						Snacks.terminal.open(cmd, {
							auto_close = false,
							win = {
								position = "bottom",
								height = 0.25,
								title = "Execution Output: " .. vim.fn.fnamemodify(file, ":t") .. " ",
							},
						})
					else
						Snacks.notify.warn("No runner defined for type: " .. ft)
					end
				end,
				desc = "Execute Current file",
			},
		},
	},
}

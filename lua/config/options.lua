-- [[lua/config/options.lua]]
-- Change core behaviours of Neovim 
-- See `:help vim.opt`

-- Set to true if you have a Nerd Font installed and selected in terminal
vim.g.have_nerd_font = true

-- Make line numbers default and display relative line numbers, makes movements much easier
vim.opt.number = true
vim.opt.relativenumber = true


-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable mouse support in all modes "a"
vim.opt.mouse = "a"

-- Prevent Neovim from showing the current mode on the last line. 
-- This will be handled by other status line plugins namely, lualine
vim.opt.showmode = false

-- Save undo history to a hidden file so we can undo changes even after reopening file
vim.opt.undofile = true

-- Always shows the sign column.
-- Prevents jarring text shifts when plugins add ot remove icons in that column.
vim.opt.signcolumn = "yes"

-- Decreses the time Neovim waits before writing ti the swap file
-- and trigger CursorHold Events. Makes UI feel more responsive
vim.opt.updatetime = 250

-- Drcrese the time Neovin waits for a mapped key sequence to complete
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new window splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true 

-- Sets how neovim will display certain whitespaces charecters in the editor.
-- See `help: 'list'` and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Show a live preview of substituions in a split window
vim.opt.inccommand = "split"

-- Highlight the line where cursor is currently located
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- Identations and wrapping 
vim.opt.expandtab = false
vim.opt.tabstop = 4 
vim.opt.shiftwidth = 4
vim.opt.breakindent = true 

-- Clipboard Integration using wl-copy
vim.g.clipboard = {
	name = "wlClipboard",
	copy = {
		["+"] = "wl-copy",
		["*"] = "wl-copy --primary",
	},
	paste = {
		["+"] = "wl-paste",
		["*"] = "wl-paste --primary",
	},
	cache_enable = 1,
}
-- Sync Neovim's internal clipboard with both system clipboards.
-- "unnamed" links to primary selction i.e selection clipboard or * register
-- "unnamedplus" links to the system clipboard i.e yank/copy or + register
vim.opt.clipboard = { "unnamed", "unnamedplus" }

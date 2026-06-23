-- [[ Install 'lazy.nvim' plugin manager ]]
-- See `:help lazy.nvim.txt` for more info  

local lazypath = vim.fn.stdpath("data") .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath
	})
end

vim.opt.rtp:prepend(lazypath)

-- Loads lazy.nvim and instructs it to look inside the '/lua/plugins/' directory
require("lazy").setup({
	spec = {
	{import = "plugins" },
	},
	-- enables background updates
	checker = { enable = true },
})

-- Set up leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.env.MESA_NO_ERROR = "1"
vim.env.MESA_GLTHREAD = "false"


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Set up lazy.nvim
require("lazy").setup({
	spec = {
		-- Import your plugins
		{ import = "plugins" },
	},
	checker = { enabled = true, notify = false }, -- Automatically check for plugin updates
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

vim.cmd([[colorscheme pywal]])


-- Basic Neovim settings
require("basicsettings")

-- Keybindings
require("keymaps")

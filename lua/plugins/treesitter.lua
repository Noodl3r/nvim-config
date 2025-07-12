return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate", -- Ensure parsers are updated during install
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "cpp", "lua", "python", "javascript", "rust", "html", "css", "markdown", "typst" },
			highlight = { enable = true, disable = { "latex", "tex" } },
			indent = { enable = true, disable = { "latex", "tex" } },
			auto_install = true,
		})
	end,
}

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate", -- Ensure parsers are updated during install
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "cpp", "lua", "python", "javascript", "rust", "html", "css", "markdown" },
			highlight = { enable = true }, -- Enable syntax highlighting
			indent = { enable = true },    -- Enable automatic indentation
			auto_install = true,           -- Automatically install parsers when needed
		})
	end,
}

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = 'pywal',
				component_separators = "|",
				section_separators = "",
			},

			sections = {
				lualine_a = { 'filename' },
				lualine_b = { '' },
				lualine_c = { '' },
				lualine_x = { '' },
				lualine_y = { 'diagnostics' },
				lualine_z = { 'fileformat' }
			},
		})
	end,
}

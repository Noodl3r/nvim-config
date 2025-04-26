return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- Create our highlight groups
		vim.api.nvim_set_hl(0, "IBLChar", { fg = "#7f38ec" })     -- Purple color
		vim.api.nvim_set_hl(0, "IBLWhitespace", { fg = "#333333" }) -- Very dim color for alternating lines


		-- Then setup the plugin with alternating highlights
		require("ibl").setup({
			indent = {
				char = "│",
				tab_char = "│",
				highlight = { "IBLChar", "IBLWhitespace" }, -- Alternating highlights
			},
			scope = {
				enabled = false,
			},
		})
	end
}

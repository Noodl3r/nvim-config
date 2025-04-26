return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			-- Default settings
			stages = "fade_in_slide_out", -- Animation style
			timeout = 2000,             -- Time (ms) before notification disappears
			background_colour = "#000000", -- Set background color
			render = "wrapped-compact", -- How the text is displayed
			max_width = 40,
			max_height = 6,
			fps = 30, -- Frames per second for animations
		})
	end

}

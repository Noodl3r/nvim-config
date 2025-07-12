return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup({
			settings = {
				save_on_toggle = true,
				save_on_change = true,
				sync_on_ui_close = true,
				filename = vim.fn.stdpath("data") .. "/harpoon.json",
			},
			default = {
				display = function(item)
					return vim.fn.fnamemodify(item.value, ":t")
				end,
			},
		})
		-- REQUIRED

		vim.keymap.set("n", "<leader>A", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<leader>E", function()
			harpoon.ui:toggle_quick_menu(harpoon:list(), {
				border = "rounded",
				ui_width = 60,
				ui_max_height = 10,
			})
		end)

		for i = 1, 9 do
			vim.keymap.set("n", "<leader>" .. i, function()
				harpoon:list():select(i)
			end)
		end


		vim.api.nvim_set_hl(0, "HarpoonBorder", { fg = "#4C566A" })                           -- Subtle gray border
		vim.api.nvim_set_hl(0, "HarpoonTitle", { fg = "#ECEFF4", bg = "#4C566A", bold = true }) -- Light title on gray
		vim.api.nvim_set_hl(0, "HarpoonWindow", { bg = "#2E3440" })                           -- Dark background

		vim.g.harpoon_ui_width = 50
		vim.g.harpoon_ui_height = 20

		local function set_harpoon_highlights()
			vim.api.nvim_set_hl(0, "HarpoonBorder", { fg = "#4C566A" })
			vim.api.nvim_set_hl(0, "HarpoonTitle", { fg = "#ECEFF4", bg = "#4C566A", bold = true })
			vim.api.nvim_set_hl(0, "HarpoonWindow", { bg = "#2E3440" })
		end

		set_harpoon_highlights()

		-- -- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "gt", function()
			harpoon:list():prev()
		end)
		-- vim.keymap.set("n", "<C-S-k>", function()
		-- 	harpoon:list():next()
		-- end)
	end,
}

return {
	"frabjous/knap",
	ft = { "tex", "latex" },
	quiet = true,
	verbose = false,
	config = function()
		-- Basic KNAP configuration with essential settings
		vim.g.knap_settings = {
			texoutputext = "pdf",
			textopdf = "pdflatex -synctex=1 -halt-on-error -interaction=nonstopmode %docroot%",
			textopdfviewerlaunch = "zathura %outputfile%",
			textopdfviewerrefresh = "none", -- Zathura auto-refreshes with SyncTeX
			textopdfforwardjump = "zathura --synctex-forward=%line%:%column%:%srcfile% %outputfile%",
			quiet = true,
			verbose = false,
			notifications = 0,
			delay = 300
		}

		-- Set shortmess to suppress messages globally
		vim.opt.shortmess:append("aoOtTWAIcFs")

		-- Patch KNAP to completely disable its messaging system
		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyDone",
			callback = function()
				if package.loaded["knap"] then
					require("knap").message = function() return end
				end
			end
		})

		-- Simple LaTeX file handling
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "tex", "latex" },
			callback = function()
				-- Set up keybindings
				vim.keymap.set("n", "<leader>p", function()
					pcall(function() require("knap").toggle_autopreviewing() end)
				end, { buffer = true, silent = true })

				vim.keymap.set("n", "<leader>j", function()
					pcall(function() require("knap").forward_jump() end)
				end, { buffer = true, silent = true })

				-- Start auto-preview silently
				vim.defer_fn(function()
					pcall(function() require("knap").toggle_autopreviewing() end)
				end, 100)
			end
		})
	end
}

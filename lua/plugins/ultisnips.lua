return {
	{
		"lervag/vimtex",
		ft = { "tex", "latex" }, -- Load only for TeX files
		init = function()
			vim.g.vimtex_enabled = 1
			vim.g.vimtex_view_enabled = 0
			vim.g.vimtex_quickfix_open_on_warning = 0
			vim.g.vimtex_quickfix_mode = 0
			vim.g.vimtex_version_check = 0
			vim.vimtex_compiler_method = 'latexmk'
			vim.g.vimtex_syntax_enabled = 1
			vim.g.vimtex_log_ignore = { 'Underfull', 'Overfull' }

			vim.g.vimtex_compiler_latexmk = {
				build_dir = 'build', -- Specify build directory
				callback = 1,    -- Callback after compilation
				continuous = 1,  -- Continuous compilation
				options = { '-pdf', '-quiet' }
			}
			-- Optionally, set up an autocmd for LaTeX file compilation
			vim.api.nvim_create_augroup('tex', { clear = true })

			--vim.api.nvim_create_autocmd('BufWrite', {
			--pattern = '*.tex',
			--callback = function()
			--vim.cmd('silent! VimtexCompile')
			--end,
			--group = 'tex',
			--})
			-- Nuking log files when I leave
			vim.api.nvim_create_autocmd('BufWinLeave', {
				pattern = '*.tex',
				callback = function()
					local filename = vim.fn.expand('%:p')
					local texclear_cmd = string.format('!bash ~/bin/texclear.sh %s', filename)
					vim.cmd(texclear_cmd)
				end,
				group = 'tex',
			})

			-- Optional: Customize the latexmk compilation command (if needed)
			vim.api.nvim_create_autocmd('FileType', {
				pattern = 'tex',
				callback = function()
					vim.api.nvim_set_keymap('n', '<leader>l', ':w <CR> :vert term latexmk -pdf %<CR>',
						{ noremap = true, silent = true })
				end,
			})
		end,
	},
	{
		"SirVer/ultisnips",
		event = "InsertEnter",
		dependencies = { "lervag/vimtex" }, -- Ensure vimtex loads first
		config = function()
			vim.g.UltiSnipsExpandTrigger = "<s-tab>"
			vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
			-- vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
			vim.g.UltiSnipsSnippetDirectories = { "~/.vim/UltiSnips" }
			vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>vsplit | wincmd l | UltiSnipsEdit<CR>",
				{ noremap = true, silent = true })
		end,
	},
	{
		"quangnguyen30192/cmp-nvim-ultisnips",
		after = "nvim-cmp",
		event = "InsertEnter",
		dependencies = { "SirVer/ultisnips" },
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						vim.fn["UltiSnips#Anon"](args.body)
					end,
				},
				sources = cmp.config.sources({
					{ name = "ultisnips" },
				}),
			})
		end,
	}
}

return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"SirVer/ultisnips",
			"quangnguyen30192/cmp-nvim-ultisnips",
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				completion = {
					autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
					min_length = 2,
					completeopt = "menu,menuone,noinsert",
				},
				snippet = {
					expand = function(args)
						vim.fn["UltiSnips#Anon"](args.body)
					end,
				},
				mapping = {
					["<Up>"] = cmp.mapping.select_prev_item(),
					["<Down>"] = cmp.mapping.select_next_item(),
					["<Tab>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp",  priority = 2 },
					{ name = "ultisnips", priority = 1 },
					--{ name = "buffer",    priority = -1 },
					{ name = "path",      priority = 3 },
				}),
				experimental = {
					ghost_text = true,
				},
				formatting = {
					format = function(entry, vim_item)
						vim_item.kind = string.format("%s", vim_item.kind)
						return vim_item
					end
				},
				window = {
					completion = cmp.config.window.bordered({
						border = "rounded",
						scrollbar = false,
						view = { max_height = 5 }
					}),
					documentation = cmp.config.window.bordered({
						border = "rounded",
						scrollbar = true,
					}),
				},
			})
		end
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		config = function()
			-- Your existing LSP config...
		end
	},
	{
		"saadparwaiz1/cmp_luasnip",
	},
}

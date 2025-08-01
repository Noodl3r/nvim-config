return { { "williamboman/mason.nvim", config = function() require("mason").setup({ PATH = "prepend", }) end, }, {
	"williamboman/mason-lspconfig.nvim",
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"bashls",
				"lua_ls",
				"rust_analyzer",
				--"gopls",
				"templ",
				"html",
				"cssls",
				"emmet_language_server",
				"htmx",
				"tailwindcss",
				"ts_ls",
				-- "tsserver",
				"pylsp",
				"clangd",
				-- "codelldb",
				"prismals",
				"yamlls",
				"jsonls",
				"eslint",
				-- "hls",
				"zls",
				"marksman",
				"sqlls",
				"wgsl_analyzer",
				"intelephense",
				"nim_langserver",
				"tinymist",
				"astro",
			},
		})
	end,
},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Silencing auto start
			lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
				autostart = false,
			})

			lspconfig.sqlls.setup({
				capabilities = capabilities,
			})
			lspconfig.intelephense.setup({
				capabilities = capabilities,
			})
			lspconfig.zls.setup({
				capabilities = capabilities,
				cmd = { "zls" },
			})
			lspconfig.hls.setup({
				capabilities = capabilities,
				single_file_support = true,
			})
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }, -- Recognize 'vim' as a global variable
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true), -- Include Neovim runtime files
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})
			lspconfig.wgsl_analyzer.setup({
				capabilities = capabilities,
			})
			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})
			--lspconfig.gopls.setup({
			--capabilities = capabilities,
			--})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			lspconfig.prismals.setup({
				capabilities = capabilities,
			})
			lspconfig.yamlls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
				filetypes = {
					"templ",
					"html",
					"php",
					"css",
					"javascriptreact",
					"typescriptreact",
					"javascript",
					"typescript",
					"jsx",
					"tsx",
				},
			})
			lspconfig.htmx.setup({
				capabilities = capabilities,
				filetypes = { "html", "templ" },
			})
			lspconfig.emmet_language_server.setup({
				capabilities = capabilities,
				filetypes = {
					"templ",
					"html",
					"css",
					"php",
					"javascriptreact",
					"typescriptreact",
					"javascript",
					"typescript",
					"jsx",
					"tsx",
					"markdown",
				},
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				filetypes = {
					"templ",
					"html",
					"css",
					"javascriptreact",
					"typescriptreact",
					"javascript",
					"typescript",
					"jsx",
					"tsx",
				},
				root_dir = require("lspconfig").util.root_pattern(
					"tailwind.config.js",
					"tailwind.config.cjs",
					"tailwind.config.mjs",
					"tailwind.config.ts",
					"postcss.config.js",
					"postcss.config.cjs",
					"postcss.config.mjs",
					"postcss.config.ts",
					"package.json",
					"node_modules",
					".git"
				),
			})
			lspconfig.templ.setup({
				capabilities = capabilities,
				filetypes = { "templ" },
			})
			local configs = require("lspconfig.configs")

			if not configs.ts_ls then
				configs.ts_ls = {
					default_config = {
						cmd = { "typescript-language-server", "--stdio" },
						capabilities = capabilities,
						filetypes = {
							"javascript",
							"javascriptreact",
							"typescript",
							"typescriptreact",
							"html",
						},
						root_dir = require("lspconfig").util.root_pattern("package.json", "tsconfig.json", ".git"),
						-- single_file_support = true,
					},
				}
			end
			lspconfig.ts_ls.setup({
				-- capabilities = capabilities,
			})
			lspconfig.eslint.setup({
				capabilities = capabilities,
			})

			require("lspconfig").clangd.setup({
				cmd = {
					"clangd",
					"--background-index",
					"--pch-storage=memory",
					"--all-scopes-completion",
					"--pretty",
					"--header-insertion=never",
					"-j=4",
					"--inlay-hints",
					"--header-insertion-decorators",
					"--function-arg-placeholders",
					"--completion-style=detailed",
				},
				filetypes = { "c", "cpp", "objc", "objcpp" },
				root_dir = require("lspconfig").util.root_pattern("src"),
				init_option = { fallbackFlags = { "-std=c++2a" } },
				capabilities = capabilities,
				single_file_support = true,
			})

			function get_python_path()
				-- Check if there's an active virtual environment
				local venv_path = os.getenv("VIRTUAL_ENV")
				if venv_path then
					return venv_path .. "/bin/python3"
				else
					-- get os name
					local os_name = require("utils").get_os()
					-- get os interpreter path
					if os_name == "linux" then
						return "/usr/bin/python3"
					else
						return nil
					end
					-- Fallback to global Python interpreter
				end
			end

			lspconfig.pylsp.setup({
				capabilities = capabilities,
				settings = {
					pylsp = {
						plugins = {
							pycodestyle = {
								enabled = true,
								ignore = { "E501", "W293", "E403" },
								maxLineLength = 100, -- Optional: set your preferred line length
							},
							flake8 = {
								enabled = true,
								ignore = { "E501", "W293", "E403" },
								maxLineLength = 100, -- Optional: set your preferred line length
							},
							pyflakes = {
								enabled = true,
							},
							jedi_completion = {
								enabled = true,
								include_params = true,
								fuzzy = true,
							},
							jedi_hover = {
								enabled = true,
							},
							jedi_signature = {
								enabled = true,
							},
						},
					},
				},
			})

			lspconfig.marksman.setup({
				capabilities = capabilities,
			})
			lspconfig.gleam.setup({
				capabilities = capabilities,
			})
			lspconfig.nim_langserver.setup({
				capabilities = capabilities,
			})
			lspconfig.tinymist.setup({
				capabilities = capabilities,
				settings = {
					formatterMode = "typstyle",
					exportPdf = "onType",
					semanticTokens = "disable",
				},
			})
		end,
	},
}

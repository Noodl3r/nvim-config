return {
	'nvimdev/dashboard-nvim',
	commit = "000448d",
	event = 'VimEnter',
	config = function()
		require('dashboard').setup {
			theme = 'hyper',
			shortcut_type = 'number',
			config = {
				header = { '' },
				footer = { "", "nvim version " .. vim.version().major .. "." .. vim.version().minor },
				--header = {
				--"",
				--"				 .::7777::-.																				",
				--"				/:'////' `::>/|/             	,.-----__							",
				--"			.',  ||||   `/( e\\          ,:::://///,:::-.					",
				--"	-==~-'`-Xm````-mr' `-_\\        /:''/////// ``:::`;/|/		",
				--"																/'   ||||||     :://'`\\		",
				--"									 ,          .' ,   ||||||     `/(  e \\		",
				--"			 \\/               -===~__-'\\__X_`````\\_____/~`-._`.",
				--"								 .,                 ~~        ~~       `~-'	",
				--"										 _____               /`   							",
				--"		 '\\/          ,::////;::-.          \\|      o					",
				--"								 /:'///// ``::>/|/            \\/					  ",
				--"							 .',  ||||    `/( e\\												  ",
				--"					 -==~-'`-Xm````-mm-' `-_\\      \\,               ",
				--""
				--},
				shortcut = {
					{ desc = '󰊳 Sync',
						group = '@property',
						action = 'Lazy sync',
						key = 's' },
					{
						desc = ' Files',
						group = 'Label',
						action = 'Telescope find_files',
						key = 'f',
					},
					{
						desc = ' Attach',
						group = 'Special',
						action = 'lua require("persistence").load({last = true})',
						key = 'a',
					},
					{
						desc = '󰌌 Typing',
						group = 'Label',
						action = 'Typr',
						key = 't',
					},
					{
						desc = '󰘷 Dotfiles',
						group = '@property',
						action = ':cd ~/.config/nvim/lua | Telescope find_files',
						key = 'd',
					},
				},
				project = { enable = true, limit = 3, label = "Recent Directories", group = 'Special' },
				mru = { enable = true, limit = 5, label = "Recent Files", group = 'Special' },
				section_title = {
					project = { hl = 'Special' },
					mru = { hl = 'Special' }
				}
			},
		}
	end,
	dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}

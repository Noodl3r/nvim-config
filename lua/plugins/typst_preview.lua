return {
	'chomosuke/typst-preview.nvim',
	ft = 'typst',
	opts = {
		invert_colors = 'always',
		open_cmd = 'setsid flatpak run org.mozilla.firefox --new-window  %s >/dev/null 2>&1 &'
	},
}

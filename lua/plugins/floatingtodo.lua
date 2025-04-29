return {
	"vimichael/floatingtodo.nvim",
	config = function()
		require("floatingtodo").setup({
			target_file = "~/school/todo.md",
			border = "rounded" -- single, rounded, etc.
		})
	end
}

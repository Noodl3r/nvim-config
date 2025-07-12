vim.keymap.set("n", "<leader>m", ":messages<CR>", { desc = "Show message history" })
vim.keymap.set("n", "<leader>w", ":wa<CR>", { desc = "Save file" })
vim.keymap.set('v', '<leader>n', [[:norm ]], { noremap = true, silent = false })
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- oil.nvim setup
vim.keymap.set("n", "<leader><TAB>", ':lua require("oil").toggle_float()<CR>')
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "Y", "yy")
vim.keymap.set("n", "<leader>td", ":Td<CR>", { silent = True })
vim.keymap.set("i", "<C-v>", '<C-r>+', { noremap = true, silent = true })


-- disabling the stupid fucking
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q:", "<nop>")

-- lsp setup
vim.o.updatetime = 200
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", { noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.lsp.set_log_level("warn")

-- colorscheme picker
vim.keymap.set("n", "<C-n>", ":Telescope colorscheme<CR>")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "n", "<leader>l", ":w<CR>:vert rightbelow split | term python3 %<CR>",
			{ noremap = true, silent = true })
	end,
})

vim.api.nvim_create_autocmd("filetype", {
	pattern = "cpp",
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "n", "<leader>l",
			":w<cr>:vert rightbelow split | term g++ -std=c++17 -O2 -Wall -Wextra -pedantic % -o TEST && ./TEST<cr>",
			{ noremap = true, silent = true })
	end,
})

-- Let arrow keys move per line in normal mode
vim.keymap.set("n", "<Up>", "gk", { noremap = true })
vim.keymap.set("n", "<Down>", "gj", { noremap = true })

-- Let arrow keys move per line in insert mode
vim.keymap.set("i", "<Up>", "<C-o>gk", { noremap = true })
vim.keymap.set("i", "<Down>", "<C-o>gj", { noremap = true })

vim.keymap.set("i", "<CR>", function()
	return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
end, { expr = true, noremap = true })

-- Map <C-l> in insert mode to correct the last misspelled word
vim.keymap.set("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u", { noremap = true, silent = true })

-- For normal mode (nnoremap)
vim.keymap.set('n', 'S', ':%s///g<Left><Left><Left>', { noremap = true, silent = true })
-- For visual mode (xnoremap)
vim.keymap.set('x', 'S', ':s///g<Left><Left><Left>', { noremap = true, silent = true })


-- The figure funtion for latex files :
vim.api.nvim_create_autocmd("FileType", {
	pattern = "tex",
	callback = function()
		vim.keymap.set("i", "<C-f>", function()
			local line = vim.fn.getline(".")
			local root = vim.b.vimtex.root
			local cmd = string.format('silent !inkscape-figures create "%s" "%s/figures/"', line, root)
			vim.cmd(cmd)
			vim.cmd("w")
		end, { noremap = true, buffer = true })

		vim.keymap.set("n", "<C-f>", function()
			local root = vim.b.vimtex.root
			local cmd = string.format('silent !inkscape-figures edit "%s/figures/" > /dev/null 2>&1 &', root)
			vim.cmd(cmd)
			vim.cmd("redraw!")
		end, { noremap = true, buffer = true })
	end
})

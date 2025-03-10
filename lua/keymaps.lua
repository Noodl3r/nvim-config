vim.keymap.set("n", "<leader>m", ":messages<CR>", { desc = "Show message history" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })

-- oil.nvim setup
vim.keymap.set("n", "<leader><TAB>", ':lua require("oil").toggle_float()<CR>')
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "Y", "yy")

-- disabling the stupid fucking
vim.keymap.set("n", "Q", "<nop>")

-- lsp setup
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gr", function()
  -- Trigger the LSP references function and populate the quickfix list
  vim.lsp.buf.references()

  vim.defer_fn(function()
    -- Set up an autocmd to remap keys in the quickfix window
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "qf", -- Only apply this mapping in quickfix windows
      callback = function()
        -- Remap <Enter> to jump to the location and close the quickfix window
        vim.api.nvim_buf_set_keymap(0, "n", "<CR>", "<CR>:cclose<CR>", { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(0, "n", "q", ":cclose<CR>", { noremap = true, silent = true })

        -- Set up <Tab> to cycle through quickfix list entries
        vim.keymap.set("n", "<Tab>", function()
          local current_idx = vim.fn.getqflist({ idx = 0 }).idx
          local qflist = vim.fn.getqflist() -- Get the current quickfix list
          if current_idx >= #qflist then
            vim.cmd("cfirst")
            vim.cmd("wincmd p")
          else
            vim.cmd("cnext")
            vim.cmd("wincmd p")
          end
        end, { noremap = true, silent = true, buffer = 0 })

        vim.keymap.set("n", "<S-Tab>", function()
          local current_idx = vim.fn.getqflist({ idx = 0 }).idx
          if current_idx < 2 then
            vim.cmd("clast")
            vim.cmd("wincmd p")
          else
            vim.cmd("cprev")
            vim.cmd("wincmd p")
          end
        end, { noremap = true, silent = true, buffer = 0 })
      end,
    })
  end, 0)
end)

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

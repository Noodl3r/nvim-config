return {
  "nvzone/typr",
  dependencies = "nvzone/volt",
  cmd = { "Typr", "TyprStats" },
  lazy = true,
  event = "VimEnter",
  cond = function()
    -- Only load if no buffers are open (i.e., fresh Neovim session)
    return vim.fn.argc() == 0 and vim.api.nvim_buf_get_name(0) == ""
  end,
  opts = {
    mode = "phrases",
    wpm_goal = 100,
    insert_on_start = true,
  },
}


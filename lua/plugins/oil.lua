return {
  "stevearc/oil.nvim",
  opts = {},
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-s>"] = {
          "actions.select",
          opts = { vertical = true },
          desc = "Open the entry in a vertical split",
        },
        ["<C-h>"] = {
          "actions.select",
          opts = { horizontal = true },
          desc = "Open the entry in a horizontal split",
        },
        ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
        ["<C-p>"] = "actions.preview",
        ["q"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
        ["<Esc>"] = { "actions.close", desc = "Close Oil window" },
      },
      float = {
        padding = 2,
        border = "rounded",
        max_width = 25,
        max_height = 15,
        win_options = {
          winblend = 15,
          signcolumn = "no",
          foldcolumn = "0",
          statuscolumn = "",
          winhighlight = "FloatBorder:OilBorder",
        },
        override = function(conf)
          conf.relative = "cursor"
          conf.row = 1
          conf.col = 0
          return conf
        end,
      },
    })
  end,
}

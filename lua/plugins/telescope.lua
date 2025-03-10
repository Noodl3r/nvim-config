return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" }, -- Telescope requires plenary.nvim
  config = function()
    -- Configure Telescope
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-h>"] = "which_key",
          },
        },
        preview = {
          enabled = true,
          timeout = 250,
          filesize_limit = 1,
        },
        layout_strategy = "horizontal",
        layout_config = {
          preview_width = 0.5,
          width = 0.9,
          height = 0.8,
        },
      },
    })


    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>ff', function()
      require('telescope.builtin').find_files({ hidden = true })
    end, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.api.nvim_create_user_command("ColorschemePicker", function()
      require('telescope.builtin').colorscheme({ enable_preview = true })
    end, {})
  end,
}

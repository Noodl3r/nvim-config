return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup({
      settings = {
        save_on_toggle = true,
        save_on_change = true,
        sync_on_ui_close = true,
        filename = vim.fn.stdpath("data") .. "/harpoon.json",
      },
      default = {
        display = function(item)
          return vim.fn.fnamemodify(item.value, ":t")
        end,
      },
    })
    -- REQUIRED

    vim.keymap.set("n", "<leader>A", function()
      harpoon:list():add()
    end)
    vim.keymap.set("n", "<leader>E", function()
      harpoon.ui:toggle_quick_menu(harpoon:list(), {
        border = "rounded",
        ui_width = 60,
        ui_max_height = 10,
      })
    end)

    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

    vim.api.nvim_set_hl(0, "HarpoonBorder", { fg = "#4C566A" })                             -- Subtle gray border
    vim.api.nvim_set_hl(0, "HarpoonTitle", { fg = "#ECEFF4", bg = "#4C566A", bold = true }) -- Light title on gray
    vim.api.nvim_set_hl(0, "HarpoonWindow", { bg = "#2E3440" })                             -- Dark background

    vim.g.harpoon_ui_width = 50
    vim.g.harpoon_ui_height = 20
    -- -- Toggle previous & next buffers stored within Harpoon list
    -- vim.keymap.set("n", "<C-S-j>", function()
    -- 	harpoon:list():prev()
    -- end)
    -- vim.keymap.set("n", "<C-S-k>", function()
    -- 	harpoon:list():next()
    -- end)
  end,
}

return {
  {
    "hrsh7th/nvim-cmp",
    config = function()
      -- Basic nvim-cmp configuration
      local cmp = require("cmp")
      cmp.setup({
        -- Your nvim-cmp configuration here
      })
    end
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    config = function()
      require("cmp_nvim_lsp").default_capabilities()
    end
  },
  -- Other plugins
}

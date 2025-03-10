return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "cpp", "lua", "python", "javascript", "rust", "html", "css", "markdown" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}

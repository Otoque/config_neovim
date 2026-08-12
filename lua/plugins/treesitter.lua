-- ============================================================================
-- TreeSitter: Sintaxe avançada de cores (React/JSX/CSS/Java/HTTP)
-- ============================================================================

return {
  "nvim-treesitter/nvim-treesitter",
  version = "v0.9.2",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = { "javascript", "tsx", "html", "css", "java", "json", "http" },
    auto_install = false, -- Desativado para evitar chamadas de fetch do Git em background
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}

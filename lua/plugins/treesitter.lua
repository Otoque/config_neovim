-- ============================================================================
-- TreeSitter: Sintaxe avançada de cores (React/JSX/CSS/Java/HTTP/Angular/TS)
-- ============================================================================

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = { 
      "javascript", 
      "typescript",  
      "tsx", 
      "html", 
      "css", 
      "java", 
      "json", 
      "http",
      "angular"
    },
    auto_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  },
  config = function(_, opts)
    local status, configs = pcall(require, "nvim-treesitter.configs")
    if status then
      configs.setup(opts)
    end
  end,
}
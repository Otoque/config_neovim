-- ============================================================================
-- Tema do Nvim
-- ============================================================================

return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000, -- carrega antes de todos os outros plugins
  config = function()
    vim.opt.termguicolors = true
    vim.opt.background = "dark"
    vim.cmd.colorscheme("carbonfox")
  end,
}

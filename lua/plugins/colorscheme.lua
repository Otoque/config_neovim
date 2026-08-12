-- ============================================================================
-- Tema Gruvbox Material
-- ============================================================================

return {
  "sainnhe/gruvbox-material",
  lazy = false,
  priority = 1000, -- carrega antes de todos os outros plugins
  config = function()
    vim.opt.termguicolors = true
    vim.opt.background = "dark"
    vim.g.gruvbox_material_background = "hard"
    vim.g.gruvbox_material_enable_bold = 1
    vim.g.gruvbox_material_better_performance = 1
    vim.cmd.colorscheme("gruvbox-material")
  end,
}

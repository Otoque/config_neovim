-- ============================================================================
-- Kulala: cliente HTTP leve direto no Neovim (arquivos .http)
-- ============================================================================

return {
  "mistweaverco/kulala.nvim",
  ft = { "http" },
  keys = {
    { "<leader>R", function() require("kulala").run() end, desc = "Executar requisição HTTP" },
    { "<leader>Ci", function() require("kulala").inspect() end, desc = "Inspecionar comando curl" },
  },
  opts = {
    default_view = "body",
  },
}

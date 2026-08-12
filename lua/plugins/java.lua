-- ============================================================================
-- Java: nvim-jdtls
--
-- Só declara o plugin aqui. A configuração real (com o javaagent do Lombok)
-- fica em ftplugin/java.lua, que roda automaticamente toda vez que você abre
-- um arquivo .java — isso garante que o root_dir/workspace do jdtls seja
-- recalculado corretamente por projeto, mesmo em monorepo.
-- ============================================================================

return {
  "mfussenegger/nvim-jdtls",
  ft = "java",
  dependencies = {
    "williamboman/mason.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
}

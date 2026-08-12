-- ============================================================================
-- Mason + LSP (servidores genéricos, ex: Python)
--
-- O Java (jdtls) NÃO é configurado aqui de propósito: ele tem uma necessidade
-- especial (javaagent do Lombok, root_dir por projeto) e por isso mora em
-- ftplugin/java.lua, usando o plugin nvim-jdtls. Ver lua/plugins/java.lua.
--
-- IMPORTANTE: desde a v2.x do mason-lspconfig, a antiga tabela `handlers`
-- foi REMOVIDA. Agora o fluxo correto é: configurar o servidor com
-- vim.lsp.config() e deixar o mason-lspconfig habilitar (vim.lsp.enable())
-- automaticamente os que estiverem instalados via `automatic_enable`.
-- ============================================================================

return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {},
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Configuração dos servidores "normais" (tudo que não é jdtls).
      -- Adicione aqui outras linguagens que precisar (ex: ts_ls, lua_ls...).
      vim.lsp.config("pyright", {
        capabilities = capabilities,
      })

      require("mason-lspconfig").setup({
        -- jdtls fica de fora: quem sobe ele é o nvim-jdtls, via ftplugin/java.lua
        ensure_installed = { "pyright", "jdtls" },
        automatic_enable = {
          exclude = { "jdtls" },
        },
      })
    end,
  },
}

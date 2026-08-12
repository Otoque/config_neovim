-- ============================================================================
-- ftplugin/java.lua
-- ============================================================================

local jdtls_ok, jdtls = pcall(require, "jdtls")
if not jdtls_ok then
  return
end

-- Raiz do projeto
local root_dir = jdtls.setup.find_root({ "pom.xml", "build.gradle", "build.gradle.kts", ".git" })
if not root_dir or root_dir == "" then
  return
end

-- Localiza o Lombok instalados pelo Mason
local mason_share = vim.fn.stdpath("data") .. "/mason/share/jdtls/lombok.jar"
local mason_pkg = vim.fn.stdpath("data") .. "/mason/packages/jdtls/lombok.jar"

local lombok_jar = vim.fn.filereadable(mason_share) == 1 and mason_share or mason_pkg

-- Define o workspace do projeto de forma isolada
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace/" .. project_name

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local config = {
  -- Chama o wrapper do jdtls e injeta o agent do Lombok diretamente na JVM
  cmd = {
    "jdtls",
    "-data", workspace_dir,
    "--jvm-arg=-javaagent:" .. lombok_jar,
  },

  root_dir = root_dir,
  capabilities = capabilities,

  settings = {
    java = {
      jdt = {
        ls = {
          lombokSupport = { enabled = true },
        },
      },
      signatureHelp = { enabled = true },
      configuration = { updateBuildConfiguration = "interactive" },
      maven = { downloadSources = true },
      contentProvider = { preferred = "fernflower" },
      references = { includeDecompiledSources = true },
    },
  },

  init_options = {
    bundles = {},
  },
}

jdtls.start_or_attach(config)

-- Keymaps específicos para Java
local opts = { buffer = 0, silent = true }
vim.keymap.set("n", "<leader>jo", jdtls.organize_imports, vim.tbl_extend("force", opts, { desc = "Organizar imports (Java)" }))
vim.keymap.set("n", "<leader>jv", jdtls.extract_variable, vim.tbl_extend("force", opts, { desc = "Extrair variável (Java)" }))
vim.keymap.set("v", "<leader>jm", function() jdtls.extract_method(true) end, vim.tbl_extend("force", opts, { desc = "Extrair método (Java)" }))

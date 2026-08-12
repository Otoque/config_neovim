-- ============================================================================
-- Bootstrap do lazy.nvim (gerenciador de plugins)
-- Substitui o vim-plug antigo. Instala sozinho na primeira vez que o Neovim
-- for aberto, não precisa rodar nenhum comando manual.
-- ============================================================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Falha ao clonar lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nAperte qualquer tecla para sair..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- Carrega automaticamente todos os arquivos dentro de lua/plugins/
    { import = "plugins" },
  },
  install = { colorscheme = { "gruvbox-material" } },
  checker = { enabled = false }, -- não fica checando update sozinho toda hora
  change_detection = { notify = false },
})

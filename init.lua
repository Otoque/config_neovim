-- ============================================================================
-- init.lua — Ponto de entrada da configuração do Neovim
-- Migrado de init.vim/settings.vim/plugins.vim (vim-plug) para Lua (lazy.nvim)
-- ============================================================================

require("config.options")
require("config.lazy")
require("config.keymaps")
require("config.autocmds")

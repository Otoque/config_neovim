-- ============================================================================
-- Interface: Árvore de arquivos, ícones e abas no topo
-- ============================================================================

return {
  -- Ícones (Nerd Font)
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    opts = { default = true },
  },

  -- Árvore de arquivos
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false, -- Carrega no início para monitorar pastas/projetos em tempo real
    opts = {
      -- Sincroniza a raiz da árvore com a pasta atual de trabalho (cwd)
      sync_root_with_cwd = true,
      respect_buf_cwd = true,

      -- Atualiza a árvore focando automaticamente no arquivo aberto
      update_focused_file = {
        enable = true,
        update_root = true,
      },

      -- Observa mudanças no sistema de arquivos para atualizar sozinho
      filesystem_watchers = {
        enable = true,
        debounce_delay = 50,
      },

      git = {
        enable = true,       -- Ativa integração com Git
        ignore = false,      -- Não esconde arquivos listados no .gitignore
        show_on_dirs = true, -- Mostra se há arquivos alterados dentro de uma pasta
      },
      filters = {
        dotfiles = false,    -- Mostra arquivos ocultos (que começam com ponto)
      },
      view = {
        width = 35,
        side = "left",
      },
    },
  },

  -- Abas no topo estilo VS Code
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        always_show_bufferline = true,
        offsets = {
          {
            filetype = "NvimTree",
            text = "Explorador de Arquivos",
            text_align = "center",
            separator = true,
          },
        },
      },
    },
  },
}
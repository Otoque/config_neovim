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
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = {
      git = {
        enable = true,       -- Ativa integração com Git
        ignore = false,      -- Não esconde arquivos listados no .gitignore
        show_on_dirs = true, -- Mostra se há arquivos alterados dentro de uma pasta
      },
      filters = {
        dotfiles = false,    -- Mostra arquivos ocultos (que começam com ponto)
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

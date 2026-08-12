-- ============================================================================
-- Git: Fugitive, Gitsigns, Diffview
-- ============================================================================

return {
  { "nvim-lua/plenary.nvim", lazy = true },

  {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gvdiffsplit", "Gdiffsplit" },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {}, -- Sinais visuais do Git no próprio arquivo
  },

  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
  },
}

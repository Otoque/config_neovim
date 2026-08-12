-- ============================================================================
-- Autocomandos
-- ============================================================================

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Auto-source do arquivo de configuração quando salvo (agora recarrega o init.lua)
local vimrc_group = augroup("AutoSourceVimrc", { clear = true })
autocmd("BufWritePost", {
  group = vimrc_group,
  pattern = { "init.lua", vim.fn.stdpath("config") .. "/lua/config/*.lua" },
  callback = function()
    vim.cmd("source $MYVIMRC")
    vim.notify("Configuração recarregada!", vim.log.levels.INFO)
  end,
})

-- Força o Neovim a reconhecer .jsx/.tsx com suporte nativo a React no TreeSitter
vim.filetype.add({
  extension = {
    jsx = "javascriptreact",
    tsx = "typescriptreact",
  },
})

-- Garantia absoluta: liga o TreeSitter nativo em qualquer arquivo React/JS aberto
autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = { "*.jsx", "*.js", "*.tsx" },
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

-- Encerra os servidores LSP ao sair do Neovim
autocmd("VimLeavePre", {
  callback = function()
    local get_clients = vim.lsp.get_clients or vim.lsp.get_active_clients
    for _, client in pairs(get_clients()) do
      client.stop()
    end
  end,
})

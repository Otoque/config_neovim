-- ============================================================================
-- Mapeamentos de teclas (Leader, Árvore, Git, Mover linhas, Abas)
-- ============================================================================

local map = vim.keymap.set

-- Atalho: Espaço + e para abrir/fechar a árvore de arquivos
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Abrir/fechar árvore de arquivos" })

-- Atalho Git: Espaço + g para abrir a janela com todos os arquivos alterados
map("n", "<leader>g", ":Git<CR>", { desc = "Abrir Fugitive (Git)" })

-- Mover linhas/blocos com Alt + j (baixo) e Alt + k (cima)
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Mover linha para baixo" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Mover linha para cima" })
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Mover linha para baixo" })
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Mover linha para cima" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Mover seleção para baixo" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Mover seleção para cima" })

-- Abas no topo (Bufferline)
map("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true, desc = "Próxima aba" })
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true, desc = "Aba anterior" })
map("n", "<leader>bd", ":bdelete<CR>", { silent = true, desc = "Fechar aba atual" })

-- Sair do modo de inserção do terminal com Esc
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Sair do modo inserção do terminal" })

-- Salvar arquivo protegido com sudo via :w!!
vim.cmd([[cmap w!! w !sudo tee % > /dev/null]])

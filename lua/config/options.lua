-- ============================================================================
-- Opções gerais (equivalente ao antigo settings.vim)
-- ============================================================================

local opt = vim.opt

vim.cmd("syntax on")
vim.cmd("syntax enable")

-- Líder
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Visual e Interface
opt.number = true                -- Mostra o número da linha
opt.relativenumber = true        -- Números relativos para navegação rápida com j/k
opt.cursorline = true            -- Destaque na linha atual
opt.termguicolors = true         -- Cores True Color no terminal
opt.background = "dark"          -- Tema base escuro
opt.laststatus = 2                -- Sempre exibe a linha de status
opt.showtabline = 2               -- Sempre exibe a barra de abas/buffers
opt.showmode = false              -- Oculta o -- INSERT -- (deixa pra statusline)
opt.pumheight = 10                -- Limita altura do menu de autocompletar
opt.cmdheight = 1                 -- Espaço no rodapé para mensagens
opt.scrollback = 2000             -- Limite de histórico (scrollback) do terminal
opt.swapfile = false              -- Sem arquivo de swap

-- Comportamento de Edição e Indentação
opt.tabstop = 4                   -- Tamanho visual do TAB
opt.shiftwidth = 4                -- Espaços para recuo automático
opt.expandtab = true              -- Converte TABs em espaços
opt.smarttab = true               -- TAB inteligente
opt.autoindent = true             -- Mantém indentação da linha anterior
opt.smartindent = true            -- Indentação inteligente
opt.formatoptions:remove({ "c", "r", "o" }) -- Não continua comentários automaticamente
opt.iskeyword:append("-")         -- Trata palavras com hífen como um único objeto

-- Janelas, Divisões e Buffers
opt.hidden = true                 -- Troca de buffer sem precisar salvar antes
opt.splitbelow = true             -- :split abre a janela abaixo
opt.splitright = true             -- :vsplit abre a janela à direita
opt.mouse = "a"                   -- Habilita o mouse

-- Performance e Área de Transferência
opt.updatetime = 300              -- Atualização mais rápida de LSPs e utilitários de Git
opt.timeoutlen = 500              -- Tempo de espera para atalhos
opt.backup = false                -- Desativa criação de arquivos de backup
opt.writebackup = false           -- Evita conflito com LSPs
opt.clipboard:append("unnamedplus") -- Sincroniza com a área de transferência do sistema
opt.conceallevel = 0              -- Mantém caracteres como `` visíveis em Markdown

-- Autocompletar e Arquivos
opt.completeopt = { "menuone", "noselect" }

vim.cmd("filetype plugin on")

-- Suporte a syntax highlight em blocos Markdown
vim.g.markdown_fenced_languages = { "vim", "help", "bash", "json", "python", "java" }

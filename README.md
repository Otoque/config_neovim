# Sua config migrada para Lua

## Como instalar

1. Faça backup e remova a config antiga:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```
2. Copie esta pasta `nvim` para `~/.config/nvim`.
3. Abra o Neovim: `nvim`. Na primeira vez, o **lazy.nvim** vai se auto-instalar
   e baixar todos os plugins sozinho (pode levar uns segundos, é normal
   aparecer uma janela de status de instalação).
4. Depois que os plugins terminarem de instalar, rode `:Mason` e confirme que
   `jdtls` e `pyright` estão instalados (o `mason-lspconfig` já pede pra
   instalar sozinho, mas vale conferir).
5. Feche e abra o Neovim de novo, e abra um arquivo `.java` de um projeto que
   tenha `pom.xml`/`build.gradle` para o `jdtls` subir.

Não precisa mais da pasta `plugged/` nem do `autoload/plug.vim` antigos —
pode apagar depois de confirmar que tudo funcionou.

## Estrutura

```
nvim/
├── init.lua                  → carrega tudo abaixo, nessa ordem
├── ftplugin/
│   └── java.lua               → sobe o jdtls com o javaagent do Lombok (por projeto)
└── lua/
    ├── config/
    │   ├── options.lua         → antigo settings.vim
    │   ├── keymaps.lua         → mapeamentos do antigo init.vim
    │   ├── autocmds.lua        → autocmds do antigo init.vim
    │   └── lazy.lua            → bootstrap do gerenciador de plugins
    └── plugins/
        ├── colorscheme.lua     → gruvbox-material
        ├── ui.lua              → nvim-tree, devicons, bufferline
        ├── git.lua             → fugitive, gitsigns, diffview
        ├── treesitter.lua
        ├── completion.lua      → nvim-cmp, luasnip, friendly-snippets
        ├── lsp.lua             → mason + mason-lspconfig (servidores genéricos)
        ├── java.lua            → declara o plugin nvim-jdtls
        └── kulala.lua
```

## O que mudou de verdade (não é só tradução de sintaxe)

**Trocamos vim-plug por [lazy.nvim](https://github.com/folke/lazy.nvim).** É o
padrão atual, tem lazy-loading de verdade (plugin só carrega quando
necessário, ex: `nvim-tree` só carrega quando você aperta `<leader>e`), e não
depende de rodar `:PlugInstall` manualmente.

**O problema do Lombok — o que eu acho que estava acontecendo:**

1. Na sua config antiga, o `jdtls` era configurado dentro da tabela
   `handlers` do `mason-lspconfig.setup()`. Só que a partir da **v2.x** do
   `mason-lspconfig`, essa tabela `handlers` **foi removida** do plugin — o
   fluxo novo é usar `vim.lsp.config()` direto e deixar o `mason-lspconfig`
   habilitar automaticamente. Ou seja, é bem provável que aquele bloco
   inteiro do Java estivesse sendo silenciosamente ignorado, dependendo da
   versão instalada.
2. O `root_dir` era calculado **uma única vez**, no buffer `0`, na
   inicialização do Neovim — não a cada arquivo Java aberto. Em monorepo isso
   é receita pra o jdtls subir com o workspace errado (ou nenhum).
3. O `--jvm-arg=-javaagent:...` depende do script wrapper que o Mason
   instala, que nem sempre repassa esse argumento pro JVM de forma confiável
   entre versões/plataformas.

**A solução:** movi o Java pra fora do `mason-lspconfig` e criei
`ftplugin/java.lua`, usando o plugin dedicado `nvim-jdtls`. Esse arquivo roda
automaticamente toda vez que você abre um `.java`, calcula o `root_dir` na
hora certa, e monta o comando `java` **manualmente**, injetando
`-javaagent:lombok.jar` direto na chamada — sem depender de nenhum wrapper.
Também liguei explicitamente `settings.java.jdt.ls.lombokSupport.enabled`.

Se mesmo assim o Lombok continuar dando problema, o próximo passo (não
incluído aqui pra não mudar demais de uma vez) seria testar o plugin
[`nvim-java`](https://github.com/nvim-java/nvim-java), que gerencia o Lombok
como um "bundle" instalado automaticamente em vez de depender do javaagent
manual — mas ele não pode ser usado junto com o `nvim-jdtls`.

**Outras correções pontuais:**
- Corrigi dois typos que existiam no tema (`gruvbox_material_eneble_bold` →
  `enable_bold`, `gruvbox_material_batter_performance` → `better_performance`)
  — como estavam escritos errado, essas opções nunca chegavam a ser aplicadas.
- Mantive **todos** os plugins, atalhos e comportamentos originais (nvim-tree,
  bufferline, gitsigns, fugitive, diffview, treesitter, cmp, luasnip, kulala).
  Nada foi removido ou trocado sem necessidade.

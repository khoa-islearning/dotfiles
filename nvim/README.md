# README

## About this config

This configuration is based on my usage of nvim, which includes:
- taking note in markdown
- competitive programming
- software development
As such, this configuration will reflect my personal preferences and habit when editing documents.
My packages will be installed and managed using [lazy.nvim](https://github.com/folke/lazy.nvim)
To create your own configuration: view the [start guide linked here](./Config-Start-Guide.md) 

## Requirements:
- [emmet](https://github.com/pedro757/emmet) for web dev snippets
- [nvm](https://github.com/nvm-sh/nvm) then `npm`
- [ripgrep](https://github.com/BurntSushi/ripgrep) for `live_grep` functionality of `telescope.nvim`
- `python3` and `pip`

## Installed Packages:

### Interface
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua): file explorer for neovim, you will need to install a nerdfonts and make your terminal emulator to use the font
- [fine-cmdline](https://github.com/VonHeikemen/fine-cmdline.nvim): show your neovim command in the middle of the screen, more of an extra feature 
- [FTerm.nvim](https://github.com/numToStr/FTerm.nvim): basic floating terminal in neovim
- [lualine](https://github.com/nvim-lualine/lualine.nvim): status line

### LSP related
- [mason](https://github.com/williamboman/mason.nvim): package manager for everything language-server related, I mainly use for my language server and formatter. Need to install `npm` in order to work. 
- [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim): vim config for different language, based on file extension 
- [conform](https://github.com/stevearc/conform.nvim): formatter
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp): completer
- [lspconfig](https://github.com/neovim/nvim-lspconfig): configs for lsp clients, you will need to install clients via Mason
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter): language parser, doesn't actually use lsp clients
- [trouble](https://github.com/folke/trouble.nvim): show code error


### Efficiency
- [nvimsurround](https://github.com/kylechui/nvim-surround): edit surrounding of your selection (such as bracket, quote symbols)
- [telescope](https://github.com/nvim-telescope/telescope.nvim): fuzzy finder. Find files, keywords...
- [twilight](https://github.com/folke/twilight.nvim): dimmer so you can focus in your work, use treesitter
- [zenmode](https://github.com/folke/zen-mode.nvim): zen, not really, but can be helpful
- [undotree](https://github.com/mbbill/undotree): file history with visualizer
- [whichkey](https://github.com/folke/which-key.nvim): show you keybinding functions, will help you survive couple first month of neovim

### Misc

- [colorscheme-picker](https://github.com/runih/colorscheme-picker.nvim): let switch between themes for neovim 
- [vim-startuptime](https://github.com/dstein64/vim-startuptime): view startup information
- [competitest](https://github.com/xeluxee/competitest.nvim): plugins to help you run testcase on your code
- [pomo](https://github.com/epwalsh/pomo.nvim): pomodoro timer in neovim



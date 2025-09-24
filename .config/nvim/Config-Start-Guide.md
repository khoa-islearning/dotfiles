# Navigate the vanilla Neovim
- Use `%` to create file
- `d` to create folder
- `:Explore` to go back to file explorer

## Set up Lazy:
1. Create `init.lua`, where nvim will look for next instructions
2. Create `lua` folder
3. In `init.lua`, require the path to `core` folder. e.g. `require("harryn.core")`
4. In `lua`, create `harryn\core\` folder
5. In `core`, create file lazy.lua to bootstrap [lazy](https://github.com/folke/lazy.nvim)
6. Also create `init.lua` and require "harryn.core.lazy" to bootstrap the bootstrap file

## Setup remaps:
1. create remap.lua in `core` to remap leader character
2. Then we can create shortcut for commands (including plugins commands) in the plugins files

## Working with Lazy
`:Lazy` to open menu
`:Lazy load <plugin>` to load after install

## Install Plugins

- require `plugins` folder in `lazy.lua`
- add extensions in `plugins`
- after adding .lua files, remember to install and load plugins in `:Lazy`


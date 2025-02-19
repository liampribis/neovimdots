# Liam's NeoVim config
Using Neovim 10.2

## Requirements
- ripgrep
- language servers
    - clangd
    - pyright
- probably others I forgot
 
## Files
- `init.lua`: main config file, loads lazy.nvim plugins and settings files
- `lua/mysettings.lua`: Non-plugin settings. General configuration
- `lua/lazy_plugin_manager_setup.lua`: Boilerplate to bootstrap lazy.nvim plugin manager
- `lua/plugins/general.lua`: General plugin configuration
- `lua/plugins/lsps.lua`: Language server plugin configuration

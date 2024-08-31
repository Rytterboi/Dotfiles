For reading the config for alacritty alacritty --config-file ~/.config/alacritty/alacritty.toml

To set zsh as the default shell for both the user and tmux

chsh zsh 

tmux source-file ~/.config/tmux/tmux.conf

For updating all zinit plugins for zsh zinit self-update zinit update --all

if tpm wont install use ~/.tmux/plugins/tpm/scripts/install_plugins.sh (As terminal command)

for neovim first clone most recent version of nvchad

git clone -b v2.0 https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

Then symlink our custom config in with stow .

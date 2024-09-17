mkdir ~/.config
git clone https://github.com/DomizianoScarcelli/dotfiles ~/.dotfiles
cp -r ~/.dotfiles/nvim/.config/nvim ~/.config/nvim
rm -rf ~/.dotfiles

sudo apt-get -y install neovim

# Install Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim


sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt upgrade
sudo apt install neovim fzf ripgrep tmux python3-pip julia zsh
pip3 install pynvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
cd
git clone https://github.com/leimglg/linux-config
cp -r linux-config/. ./
cd ~/.config
git clone https://github.com/leimglg/neovim-config
mv neovim-config nvim
nvim -es -u init.vim -i NONE -c "PlugInstall" -c "qa"
chsh -s $(which zsh)

#!/bin/sh

# INSTALLING NEOVIM
echo "Installing neovim..."
echo ""
echo "Please Provide 'root' Password"
su - root -c "pacman -S neovim"
clear

# CHECKING FOR CONFIG DIRECTORY
if [ -d .config ]; then
	if [ -d /home/$USER/.config ];then
		cp -r .config/nvim /home/$USER/.config/
	else
		mkdir /home/$USER/.config
		cp -r .config/nvim /home/$USER/.config/
		echo ".configs folder was not found.... CREATING"
	fi
else
	echo "Please change you PWD to dotfiles ( git cloned ) "
	exit 23
fi

# INSTALLING VIM-PLUG
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Installing Plugins
nvim -c "PlugInstall | q! | q! " 

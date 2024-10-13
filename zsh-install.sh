#!/bin/sh

#CHECKIGN AND COPYING .CONFIG/ZSH
if [ -d .config ]; then
	if [ -d /home/$USER/.config ];then
		cp -r .config/zsh /home/$USER/.config/
	else
		mkdir /home/$USER/.config
		cp -r .config/zsh /home/$USER/.config/
		echo ".configs folder was not found.... CREATING"
	fi
else
	echo "Please change you PWD to dotfiles ( git cloned ) "
	exit 23
fi

#CHECKIGN AND COPYING ZSH-CONFIGS
if [ -d .zsh-configs ];then
	cp .zsh-configs/.zshrc ~
	cp .zsh-configs/.zshenv ~
else 
	echo "Please change you PWD to dotfiles ( git cloned ) "
	exit 23
fi

#INSTALLIGN ZSH
echo "Root Password for Installing ZSH"
su - root -c "pacman -S zsh"

#INSTALLING THE PLUGINS
	#installing noraml plugins to use
		cd /home/$USER/.config/zsh/plugin
		rm -rf *
		clear
		git clone https://github.com/zsh-users/zsh-history-substring-search
		clear
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
		clear
		git clone https://github.com/zsh-users/zsh-autosuggestions

 	#installing powerlevel10k
		cd /home/$USER/.config/zsh
		rm -rf powerlevel10k
		clear
		git clone --depth=1 https://github.com/romkatv/powerlevel10k.git 
		clear	

#SETTING ZSH AS DEFAULT SHELL
echo "Want to set ZSH as DEFALUT shell.."
read -p " [ y/n ]  :  " ans

case $ans in
	[Nn]* ) exit ;;
	* ) chsh -s /usr/bin/zsh ;;
esac
clear

#DELETING BASH CONFIGS
echo "If You are going to Use bash only for scripts"
echo "We recomend you to delete your .bash files and free your HOME "
echo ""
echo "These Files are going to be deleted : $(ls -a ~ | grep .bash) "


echo "Want to set DELETE"
read -p " [ y/n ]  :  " ans

case $ans in
	[Nn]* ) exit ;;
	* ) rm -rf ~/.bash* ;;
esac

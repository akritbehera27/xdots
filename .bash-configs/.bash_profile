#
# ~/.bash_profile
#

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep bspwm || startx ~/.config/X11/xinitrc
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc


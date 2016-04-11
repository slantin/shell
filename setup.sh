#!/bin/zsh

install_oh_my_zsh() {
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

printf "$(green)Checking for zsh installation... "
if [ ! -e /bin/zsh ]; then
	printf "not found. Please install zsh and try again."
	exit 1
fi
printf "OK\n"

printf "Checking for oh-my-zsh installation... "
if [ ! -e ~/.oh-my-zsh ]; then
	printf "not found\nWould you like to install oh-my-zsh?\n"
	select yn in "y" "n"; do
	    case $yn in
	        y ) echo "yes"; break ;;
	        n ) echo "no"; break ;;
	    esac
	done
fi
printf "OK\n"

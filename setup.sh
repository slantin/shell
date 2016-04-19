#!/bin/zsh

source ./sources/colors

ok() {
	printf "${GREEN}OK\n${NC}"
}

pc() {
	printf "$1$2${NC}"
}

install_oh_my_zsh() {
	# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

install_zsh_syntax_highlighting() {
	ln -s $(pwd)/zsh/plugins/zsh-syntax-highlighting \
		  ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
}

install_honukai_zsh_theme() {
	ln -s $(pwd)/zsh/themes/honukai-iterm-zsh/honukai.zsh-theme \
	      ~/.oh-my-zsh/themes/honukai.zsh-theme
}

backup_or_remove() {
	if [ -e $1 ]; then
		pc $BLUE "$1 already exsits... create backup?\n"
		select yn in "Yes" "No"; do
			case $yn in
				Yes ) mv -r $1 $1.backup; break ;;
				No )  rm $1; break ;;
			esac
		done
	fi
}

install_custom_zshrc() {
	backup_or_remove ~/.zshrc
	ln -s $(pwd)/zsh/zshrc ~/.zshrc
	source ~/.zshrc
}

install_custom_tmuxconf() {
	backup_or_remove ~/.tmux.conf
	ln -s $(pwd)/tmux/tmux.conf ~/.tmux.conf
}

pc $BLUE "Checking for zsh installation... "
if [ ! -e /bin/zsh ]; then
	pc $RED "not found. Please install zsh and try again."
	exit 1
fi
ok

pc $BLUE "Checking for oh-my-zsh installation... "
if [ ! -e ~/.oh-my-zsh ]; then
	pc $ORANGE "not found. Install oh-my-zsh?\n"
	select yn in "Yes" "No"; do
	    case $yn in
	        Yes ) install_oh_my_zsh; break ;;
	        No )  break ;;
	    esac
	done
else
	ok
fi

pc $BLUE "Checking for zsh-syntax-highlighting plugin... "
if [ ! -L ~/.oh-my-zsh/plugins/zsh-syntax-highlighting ]; then
	pc $ORANGE "not found. Install?\n"
	select yn in "Yes" "No"; do
		case $yn in
			Yes ) install_zsh_syntax_highlighting; break ;;
			No )  break ;;
		esac
	done
else
	ok
fi

pc $BLUE "Checking for honukai.zsh-theme... "
if [ ! -L ~/.oh-my-zsh/themes/honukai.zsh-theme ]; then
	pc $ORANGE "not found. Install?\n"
	select yn in "Yes" "No"; do
		case $yn in
			Yes ) install_honukai_zsh_theme; break ;;
			No )  break ;;
		esac
	done
else
	ok
fi

pc $BLUE "Install custom .zshrc file?\n"
select yn in "Yes" "No"; do
	case $yn in
		Yes ) install_custom_zshrc; ok; break ;;
		No )  break ;;
	esac
done

pc $BLUE "Install custom .tmux.conf file?\n"
select yn in "Yes" "No"; do
	case $yn in
		Yes ) install_custom_tmuxconf; ok; break ;;
		No )  break ;;
	esac
done

#!/bin/bash
if [ "$1" == "--update" -o "$1" == "-u" ]; then
  cp ~/.zshrc .zshrc
  cp ~/.gitconfig .gitconfig
  cp ~/.gitignore .gitignore
  cp ~/.vimrc .vimrc
  cp ~/env.sh env.sh
  cp ~/.tmux.conf .tmux.conf
  TIMESTAMP=`date "+%Y, %m-%d"`
  #git add .zshrc .gitconfig .gitignore .vimrc env.sh
  git commit -am "updated settings on $TIMESTAMP"
  unset TIMESTAMP
else
	read -p "This may overwrite existing files in your home directory. Are you sure you want to continue? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
    git clone https://github.com/prayansh/dotfiles ${HOME}
    cd ${HOME}/dotfiles
    source bootstrap.sh
	fi;
fi;

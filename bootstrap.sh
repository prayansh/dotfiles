#!/usr/bin/env bash

# Copy dotfiles
rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".macos" \
    --exclude "brew.sh"
    --exclude "setup.sh"
		--exclude "README.md" \
		-avh --no-perms . ~;
source brew.sh

# Setup ZSH
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cp ~/dotfiles/.zshrc ~/.zshrc
cp ~/dotfiles/.gitconfig ~/.gitconfig
cp ~/dotfiles/.gitignore ~/.gitignore
cp ~/dotfiles/.vimrc ~/.vimrc
cp ~/dotfiles/env.sh ~/env.sh


# Install ZSH plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install fonts
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
rm -rf fonts

# Install powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# Install vtop
npm install -g vtop

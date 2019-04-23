#!/bin/bash

# dotfiles
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.git-completion.bash ~/.git-completion.bash
ln -s ~/dotfiles/.git_commit_template ~/.git_commit_template
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -s ~/dotfiles/.inputrc ~/.inputrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

# brew

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
cd ~/dotfiles
brew bundle

# rbenv
rbenv install 2.4.1
rbenv global 2.4.1

rbenv exec gem install bundler

# node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
source ~/.bash_profile
nvm install 8

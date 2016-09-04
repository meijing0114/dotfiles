#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Make ZSH the default shell environment
chsh -s $(which zsh)

# application config
mackup restore

# Install Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# set os preferance
source .macos

#################
# configuration #
#################
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

HOMEDIR=${BASEDIR}"/home"
# vim
ln -s ${HOMEDIR}/vimrc ~/.vimrc
ln -s ${HOMEDIR}/vim ~/.vim
ln -s ${HOMEDIR}/vimrc.bundles ~/.vimrc.bundles

# zsh
ln -s ${HOMEDIR}/zshrc ~/.zshrc
ln -s ${HOMEDIR}/zlogin ~/.zlogin
ln -s ${HOMEDIR}/zshenv ~/.zshenv

# oh my zsh 
ln -s ${HOMEDIR}/oh-my-zsh ~/.oh-my-zsh

# git
ln -s ${HOMEDIR}/gitconfig ~/.gitconfig
ln -s ${HOMEDIR}/gitignore ~/.gitignore

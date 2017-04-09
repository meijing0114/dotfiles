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
git clone https://github.com/VundleVim/Vundle.vim.git ${HOMEDIR}/vim/bundle/vundle
cp -r ${BASEDIR}solarized/vim-colors-solarized ${HOMEDIR}/vim/bundle
ln -s ${HOMEDIR}/vimrc ~/.vimrc
ln -s ${HOMEDIR}/vim ~/.vim
ln -s ${HOMEDIR}/vimrc.bundles ~/.vimrc.bundles
ln -s ${HOMEDIR}/vimrc.bundles.local ~/.vimrc.bundles.local


# zsh
ln -s ${HOMEDIR}/zshrc ~/.zshrc
ln -s ${HOMEDIR}/zlogin ~/.zlogin
ln -s ${HOMEDIR}/zshenv ~/.zshenv

# oh my zsh 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# git
ln -s ${HOMEDIR}/gitconfig ~/.gitconfig
ln -s ${HOMEDIR}/gitignore ~/.gitignore

# mackup confi
ln -s ${HOMEDIR}/mackup.cfg ~/.mackup.cfg

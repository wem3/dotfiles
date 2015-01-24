#!/usr/bin/env bash

# Install command-line tools using Homebrew 
# and point&click tools with Homebrew-cask.
# hacked from Mathias Bynen's brew.sh ~#wem3#~ [150123]

# check to see if homebrew is installed, exit if not
{
if [ ! -f /usr/local/bin/brew ]; then
    echo "Homebrew not installed!"
    echo "download Homebrew at http://brew.sh/"
    exit 0
fi
}

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

echo "Brewing up system utilities..."
# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php55 --with-gmp

# Install other useful binaries.
brew install ack
brew install git
brew install imagemagick --with-webp

echo "Brewing up Homebrew-cask..."
# Get Hombrew-cask to automate installation of other applications
brew install caskroom/cask/brew-cask

# Tell Homebrew-cask to symlink to /Applications (instead of ~/Applications)
brew cask --appdir=/Applications
# Tap some needed caskrooms
brew tap caskroom/versions
brew tap caskroom/fonts

echo "Brewing up XQuartz"
brew cask install xquartz

echo "Brewing up Source Code Pro..."
brew cask install font-source-code-pro

echo "Brewing up Sublime Text 3"
brew cask install sublime-text3

echo "Brewing up Chrome"
brew cask install google-chrome

echo "Brewing up PathFinder"
brew cask install path-finder

echo "Brewing up Dropbox"
brew cask install Dropbox

echo "Brewing up Filezilla"
brew cask install filezilla

echo "Brewing up Python"
# straight up python (brewed against openSSL)
brew install python --with-openSSL

echo "Setting up Python"
# upgrade setuptools via pip
pip install --upgrade setuptools

# upgrade pip itself via pip
pip install --upgrade pip

# now set up virtualenv
pip install virtualenv  
pip install virtualenvwrapper

# autoenv ought to be sweet
brew install autoenv

# source the autoenv.sh script to complete setup of virtualenv
source /usr/local/opt/autoenv/activate.sh

# Brew up rbenv & ruby-build
brew install rbenv ruby-build
 
# Remove outdated versions from the cellar.
brew cleanup

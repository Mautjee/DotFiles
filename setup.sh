#!/bin/bash
#
# install all the application that I use
# Author: Mauro Eijsenring
# Date: 2019-11-17
# Version: 1.0.0
# Description: Install all the application that I use
# Usage: ./setup.sh

# Install Homebrew
/bin/bash -  "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)";

# Install Homebrew Cask
brew tap homebrew/cask;

# Install Homebrew Cask Fonts
brew tap homebrew/cask-fonts;

# Install Homebrew Cask Drivers
brew tap homebrew/cask-drivers;

# install applications
brew install --cask arc;
brew install --cask raycast;
brew install --cask whatsapp;
brew install --cask spotify;
brew install --cask slack;
brew install --cask notion;
brew install --cask alacritty;

brew isntall stowe

# install dev environment
brew install nvim;
# brew install yabai;
# brew install skhd;
brew install tmux;
brew install zoxide;
brew install fzf;
brew install ripgrep;
brew install starship;
brew install k9s;


# Make links to config files 
stow .

# install Fonts
# TODO: Add fonts

#!/usr/bin/env bash

# Install base python libaries using Homebrew

# straight up python (brewed against openSSL)
brew install python --with-openSSL

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
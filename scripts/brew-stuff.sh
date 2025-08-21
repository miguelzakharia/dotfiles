#!/bin/bash
set -x #echo on

brew analytics off
brew update
brew upgrade
brew upgrade --greedy
brew cleanup -s
rm -rf "$(brew --cache)"
brew missing
brew autoremove
brew doctor

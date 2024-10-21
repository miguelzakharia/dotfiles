#!/usr/bin/env bash

function doIt() {
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	brew bundle # Install items in Brewfile

	stow root-configs                  # Send those dotfiles to ~
	stow --target=~/.config config-dir # Send configs to ~/.config

	source ~/.zshrc
}

if [ "$1" == "--force" ] || [ "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt

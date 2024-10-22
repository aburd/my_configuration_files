#!/usr/bin/env bash

# Link all files in home directory
stow -v -t "$HOME" home
# .config
mkdir -p "$HOME/.config"
stow -v -t "$HOME/.config" ".config"
# systemd
stow -v -t "/etc/systemd/system" services

# configure git
git config --global user.email "aaron.burdick@protonmail.com"
git config --global user.name "aburd"

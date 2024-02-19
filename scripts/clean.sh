#!/usr/bin/env bash

# Link all files in home directory
stow -v -D -t "$HOME" home
# .config
stow -v -D -t "$HOME/.config" ".config"
# systemd
stow -v -D -t "/etc/systemd/system" services

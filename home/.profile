# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

source $HOME/util.sh

export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
. "$HOME/.cargo/env"

export PATH="~/.local/bin:$PATH"
export PATH="/home/aburd/.local/bin/nvim-linux64/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias bat=batcat
alias ll="exa -la"
alias show_keypress="xev"
alias fexplore="ranger"
alias fileexplore="dolphin"
alias sus="systemctl suspend"
alias music="mocp"
alias cb="connect_bluetooth Galaxy"
alias db="disconnect_bluetooth Galaxy"
alias rb="reset_bluetooth Galaxy"
alias vb="update_galaxy_volume"
alias vbu="update_galaxy_volume +10%"
alias vbd="update_galaxy_volume -10%"
alias c5g="nmcli con up E81B69E974AF-5G"

# git
alias gPo="git push origin" 
alias gpo="git pull origin" 
alias gs="git status" 
alias gc="git commit -m" 
alias gcb="git checkout -b" 
alias gl="git log" 
alias ga="git add ." 

# There are a couple tools capable of writing to the clipboard; I use xsel. 
# It takes flags to write to the primary X selection (-p), secondary selection (-s), or clipboard (-b). Passing it -i will tell it to read from stdin, so you want:
# $ echo "Some Text" | xsel -i -b
alias copy="xsel"

# Not in vim 
if [ -z "$VIMRUNTIME" ]; then
  neofetch --jp2a /home/aburd/Pictures/hackers_albun.jpg --color_blocks off --size 30%
fi


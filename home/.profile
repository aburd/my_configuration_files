# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

source $HOME/util.sh

# Lang support
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
# Desktop
export XDG_CURRENT_DESKTOP=sway

export PICO_SDK_PATH=/home/aburd/code/pico-c/pico/pico-sdk

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
export PATH=$PATH:/usr/sbin
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin/jdk-21.0.1+12/bin:$PATH"

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
alias cb="connect_bluetooth Air"
alias db="disconnect_bluetooth Air"
alias cbg="connect_bluetooth Galaxy"
alias dbg="disconnect_bluetooth Galaxy"
alias rb="reset_bluetooth Galaxy"
alias vb="update_galaxy_volume"
alias vbu="update_galaxy_volume +10%"
alias vbd="update_galaxy_volume -10%"
alias c5g="nmcli con up E81B69E974AF-5G"
alias display_wayland="wdisplays"

# git
alias gPo="git push origin" 
alias gpo="git pull origin" 
alias gs="git status" 
alias gc="git commit -m" 
alias gcb="git checkout -b" 
alias gl="git log" 
alias ga="git add ." 
alias gg="git grep -n"
alias g="lazygit"
alias audio="pavucontrol"

# There are a couple tools capable of writing to the clipboard; I use xsel. 
# It takes flags to write to the primary X selection (-p), secondary selection (-s), or clipboard (-b). Passing it -i will tell it to read from stdin, so you want:
# $ echo "Some Text" | xsel -i -b
alias copy="xsel"

# TODO: make configurable
# Not in vim
# if [ -z "$VIMRUNTIME"]; then
#   neofetch --color_blocks off 
# fi

# FZF
FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# opam configuration
[[ ! -r /home/aburd/.opam/opam-init/init.zsh ]] || source /home/aburd/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
fi

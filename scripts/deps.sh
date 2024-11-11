#!/usr/bin/env bash

bin_exists()
{
  local bin="$1"
  which "$bin" &> /dev/null
  test $? -eq 0 
}

is_pkg_installed()
{
  local pkg="$1"
  dpkg -s "$pkg" | grep Status &> /dev/null
  test $? -eq 0
}

install()
{
  local pkg=$1
  echo "Installing $pkg"

  if is_pkg_installed "$pkg"; then
    echo "$pkg already exists, skipping"
    return;
  fi

  if bin_exists dnf; then
    sudo dnf install "$pkg" -y
    return;
  fi

  if bin_exists apt; then
    sudo apt install "$pkg" -y
    return;
  fi

  echo "This script does not support your distro yet."
  echo "See 'install' function to remedy this issue."
  exit 1
}

emphasize()
{
  echo "*******"
  echo "$@"
  echo "*******"
}

install_xremap()
{
  echo "Installing xremap"
  local url="https://github.com/k0kubun/xremap/releases/download/v0.7.8/xremap-linux-x86_64-sway.zip"
  local zip_file='zremap.zip'
  wget "$url" -O "$zip_file"
  unzip "$zip_file"
  mv 'xremap' '/usr/bin'
  rm "$zip_file"
}

# OhMyZsh
install_ohmyzsh()
{
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

install_lazygit()
{
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit /usr/local/bin
  rm ./lazygit*
}

install_wofi_emoji()
{
  git clone git@github.com:Zeioth/wofi-emoji.git "$HOME/code/wofi-emoji"
  sudo ln -s "$HOME/code/wofi-emoji/wofi-emoji" /usr/local/bin/wofi-emoji
}

install_vim_plug()
{
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

main()
{
  MY_DEPS="$(cat ./scripts/my_deps.txt | sed -r '/#|^\s*$/d')"
  emphasize "This script will attempt to get you up and running with your dependencies"
  emphasize "You can update dependencies at $(pwd)/scripts/my_deps.txt" 

  for dep in $MY_DEPS; do
    install "$dep"
  done

  ! bin_exists xremap && install_xremap || echo "xremap already exists, skipping"

  ! bin_exists kickoff && cargo install kickoff || echo "kickoff already exists, skipping"

  [[ ! -d "$HOME/.oh-my-zsh" ]] && install_ohmyzsh || echo "oh my zsh already installed"

  ! bin_exists lazygit && install_lazygit || echo "lazygit exists, skipping"

  ! bin_exists wofi-emoji && install_wofi_emoji || echo "wofi-emoji exists, skipping"

  if [[ ! -e ~/.vim/autoload/plug.vim ]]; then
	  echo 'what'
	  install_vim_plug
  fi
}

main

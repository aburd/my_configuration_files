#!/bin/bash

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

  if bin_exists apt; then
    apt install "$pkg" 
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

MY_DEPS="$(cat ./scripts/my_deps.txt | sed -r '/#|^\s*$/d')"

emphasize "This script will attempt to get you up and running with your dependencies"
emphasize "You can update dependencies at $(pwd)/scripts/my_deps.txt" 
for dep in $MY_DEPS; do
  install "$dep"
done
if bin_exists xremap; then 
  echo "xremap already exists, skipping"
else
  install_xremap
fi
# kickoff
if bin_exists kickoff; then 
  echo "kickoff already exists, skipping"
else
  cargo install kickoff
fi

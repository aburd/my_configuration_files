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

MY_DEPS="$(cat ./scripts/my_deps.txt | sed -r '/#|^\s*$/d')"

emphasize "This script will attempt to get you up and running with your dependencies"
emphasize "You can update dependencies at $(pwd)/scripts/my_deps.txt" 
for dep in $MY_DEPS; do
  install "$dep"
done


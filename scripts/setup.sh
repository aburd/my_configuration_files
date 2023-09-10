#!/usr/bin/env bash

SCRIPT=$(realpath "$0");
SCRIPT_PATH=$(dirname "$SCRIPT");
PJT_PATH=$(dirname $SCRIPT_PATH);
IS_HELP='false'
IS_ASK='false'

while getopts ':a,:h' flag
do
    case "${flag}" in
        a) IS_ASK='true';;
        h) IS_HELP='true';;
    esac
done

print_help()
{
  echo "
    Setup script to get your configuration setup on a nix-system.

    Flags:
      -a: Ask for overwrites instead of skipping.
      -h: Display this message.
  "
  exit
}


print_div()
{
  local width=$(tput cols)
  printf '=%.0s' $(seq 1 $width)
}

print_header()
{
  TEXT=$1;
  print_div
  echo "$TEXT";
  print_div
}

checkFileAndLink()
{
  SRC_PATH=$1;
  TARGET_DIR=$2;

  filename=$(basename "$SRC_PATH");
  if [ "$filename" = "." ] || [ "$filename" = ".." ]; then
    return;
  fi

  targetPath="$TARGET_DIR/$filename";

  writeFile=true;
  echo "Checking $targetPath";
  if [ -e "$targetPath" ]; then
    writeFile=false
    if "$IS_ASK"; then
      while true; do
          read -p "$filename already exists. Overwrite, Yn?" yn
          case $yn in
              [Yy]* ) writeFile=true; break;;
              [Nn]* ) break;;
              * ) echo "Please answer yes or no.";;
          esac
      done
    fi
  fi

  if [ "$writeFile" = true ]; then
    echo "Setting $targetPath";
    sudo ln -sf "$PJT_PATH/$SRC_PATH" "$targetPath"
  fi
  echo " ";
}


if "$IS_HELP"; then
  print_help
fi

print_header "Hi, $USER. I'm here to help set up your PC's configuration files.";

# Link all files in home directory
for f in home/*;
do
  checkFileAndLink "$f" $HOME;
done
# Link all hidden files in home directory
for f in home/.*;
do
  checkFileAndLink "$f" $HOME;
done

# Link nvim directory 
mkdir -p "$HOME/.config"
checkFileAndLink nvim "$HOME/.config";

# systemd
for f in services/*;
do
  checkFileAndLink "$f" '/etc/systemd/system';
done
# .config
for d in ./.config/*;
do
  checkFileAndLink "$d" "$HOME/.config"
done

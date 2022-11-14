#!/bin/bash

SCRIPT=$(realpath "$0");
SCRIPT_PATH=$(dirname "$SCRIPT");
PJT_PATH=$(dirname $SCRIPT_PATH);

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
  if [ $filename = "." ] || [ $filename = ".." ]; then
    return;
  fi

  targetPath="$TARGET_DIR/$filename";

  writeFile=true;
  echo "Checking $targetPath";
  if [ -e "$targetPath" ]; then
    while true; do
        read -p "$filename already exists. Overwrite, Yn?" yn
        case $yn in
            [Yy]* ) writeFile=true; break;;
            [Nn]* ) writeFile=false; break;;
            * ) echo "Please answer yes or no.";;
        esac
    done
  fi

  if [ $writeFile = true ]; then
    echo "Setting $targetPath";
    ln -sf "$PJT_PATH/$SRC_PATH" "$targetPath"
  fi
  echo " ";
}

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
# Link all files in nvim 
NVIM_DIR="$HOME/.config/nvim";
if ! [ -d "$NVIM_DIR" ]; then
  echo "$NVIM_DIR directory does not exist.";
  while true; do
      read -p "Would you like to create this directory? Yn." yn
      case $yn in
          [Yy]* ) mkdir -p "$NVIM_DIR"; break;;
          [Nn]* ) break;;
          * ) echo "Please answer yes or no.";;
      esac
  done
fi
for f in nvim/*;
do
  checkFileAndLink "$f" "$HOME/.config/nvim";
done

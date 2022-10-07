#!/bin/sh

SCRIPT=$(realpath "$0");
SCRIPT_PATH=$(dirname "$SCRIPT");
PJT_PATH=$(dirname $SCRIPT_PATH);

checkFileAndLink()
{
  SRC_PATH=$1;
  TARGET_DIR=$2;

  filename=$(basename "$SRC_PATH");
  if [ $filename = "." ] || [ $filename = ".." ]; then
    return;
  fi

  echo "$SRC_PATH $TARGET_DIR $filename";
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

echo "Hi, $USER. I'm here to help set up your PC's configuration files.";

# Link all files in home directory
for f in home/.*;
do
  checkFileAndLink "$f" $HOME;
done
# Link all files in nvim 
for f in nvim/*;
do
  checkFileAndLink "$f" "$HOME/.config/nvim";
done

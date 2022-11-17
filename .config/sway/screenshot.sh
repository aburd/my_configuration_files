SCREENSHOT_DIR="$HOME/Pictures"
SCREENSHOT_NUM="$(ls $SCREENSHOT_DIR/screenshot*.png | wc -l)"
grim -g "$(slurp)" - > "$SCREENSHOT_DIR/screenshot-$SCREENSHOT_NUM.png"

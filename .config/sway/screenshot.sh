SCREENSHOT_NUM="$(ls screenshot* | wc -l)"
grim -g "$(slurp)" - > "$HOME/screenshot-$SCREENSHOT_NUM.png"

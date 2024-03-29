#!/bin/sh

# Bluetooth
get_bluetooth_device_id()
{
  local device_alias=$1
  local device_id="$(bluetoothctl devices | awk '/'"$device_alias"'/ { print $2 }')"
  if [ -z "$device_id" ]; then
    echo "Bluetooth device not found"
    return 1
  fi

  echo $device_id
}

disconnect_bluetooth()
{
  is_bluetooth_device_connected $1
  if [ $? -eq 0 ]; then
    bluetoothctl disconnect "$(get_bluetooth_device_id $1)"
    return 0
  else
    echo "$1 is already disconnected"
    return 1
  fi
}

connect_bluetooth()
{
  is_bluetooth_device_connected $1
  if [ $? -eq 1 ]; then
    bluetoothctl connect "$(get_bluetooth_device_id $1)"
    return 0
  else
    echo "$1 is already connected"
    return 1
  fi
}

reset_bluetooth()
{
  disconnect_bluetooth $1
  connect_bluetooth $1
}

is_bluetooth_device_connected()
{
  device_alias=$1
  device_id="$(get_bluetooth_device_id "$device_alias")"
  connected="$(bluetoothctl info "$device_id" | grep Connected | sed -r 's/Connected: (\w+)/\1/' | xargs)"
  if [ "$connected" = 'yes' ]; then
    return 0
  else
    return 1
  fi
}

galaxy_pulse_audio_id()
{
  pactl list short sinks | grep bluez | sed -r 's/.+(bluez[a-zA-Z0-9\._]+sink).*/\1/'
}

update_galaxy_volume()
{
  # e.g. "+10%"
  local vol_change="$1"
  pactl set-sink-volume "$(galaxy_pulse_audio_id)" "$vol_change"
}

install_fonts()
{
  local font_dir="$1"
  if [ -n "$font_dir" ]; then
    pushd "$font_dir"
    # next command extracts all ttf and otf files into your `.fonts` folder.
    unzip "*.zip" "*.ttf" "*.otf" -d "$HOME/.fonts"
    # next command rebuilds font cache
    sudo fc-cache -f -v
    popd
  else
    echo "Error: Provide a font directory"
  fi
}

bats_all() {
  BATS_RUN_SKIPPED=true command bats *.bats
}


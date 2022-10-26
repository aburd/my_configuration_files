#!/bin/sh

# Bluetooth
get_bluetooth_device_id()
{
  device_alias=$1
  bluetoothctl devices | awk '/'"$device_alias"'/ { print $2 }'
}

disconnect_bluetooth()
{
  bluetoothctl disconnect "$(get_bluetooth_device_id $1)"
}

connect_bluetooth()
{
  bluetoothctl connect "$(get_bluetooth_device_id $1)"
}

reset_bluetooth()
{
  disconnect_bluetooth $1
  connect_bluetooth $1
}


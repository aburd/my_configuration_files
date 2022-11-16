#!/bin/sh

bar()
{
  local d="$(date +'%Y-%m-%d %H:%M')"
  local bat="$(cat /sys/class/power_supply/BAT1/capacity)"
  local bat_emoji="🔋"
  if [ "$bat" -lt 15 ]; then
    bat_emoji="🪫"
  fi
  local brightness="$(brightnessctl i | sed -rn 's/.+([0-9]{2,3}\%).*/\1/p')"

  echo "💡$brightness $bat_emoji$bat% $d"
}

bar

#!/bin/sh

bar()
{
  local d="$(date +'%Y-%m-%d %H:%M')"
  local bat="$(cat /sys/class/power_supply/BAT1/capacity)"
  local bat_emoji="🔋"
  if [ "$bat" -lt 15 ]; then
    bat_emoji="🪫"
  fi
  local brightness="$(brightnessctl i | sed -rn 's/.*\(([0-9]{1,3}\%)\).*/\1/p')"
  local vol="$(amixer sget Master | sed -rn 's/.+\[([0-9]+)%\].+/\1/p')"
  local v_emoji="$(vol_emoji $vol)"

  echo "$v_emoji$vol% 💡$brightness $bat_emoji$bat% $d"
}

vol_emoji()
{
  if is_muted; then
    echo "🔇"
  elif [ $1 -gt 70 ]; then
    echo "🔊"
  elif [ $1 -gt 35 ]; then
    echo "🔉"
  elif [ $1 -gt 0 ]; then
    echo "🔈"
  else
    echo "🔇"
  fi
}

is_muted()
{
  amixer -D pulse get Master | grep '\[off\]'
  if [ $? = 0 ]; then
    return 0
  fi
  return 1
}

bar

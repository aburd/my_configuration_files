#!/usr/bin/env bash

BAT_PATH="/sys/class/power_supply/BAT1"

bar()
{
  local vol="$(amixer sget Master | sed -rn 's/.+\[([0-9]+)%\].+/\1/p' | head -1)"
  local v_emoji="$(vol_emoji $vol)"
  local brightness="$(brightnessctl i | sed -rn 's/.*\(([0-9]{1,3}\%)\).*/\1/p')"

  local menu_s="$v_emoji$vol% 💡$brightness"

  # add bat if exists
  if [ -e $BAT_PATH ]; then
    local bat="$(cat $BAT_PATH/capacity)"
    local bat_emoji="$(battery_emoji)"
    menu_s="$menu_s $bat_emoji$bat%"
  fi

  local d="$(date +'%Y-%m-%d %H:%M')"
  menu_s="$menu_s $d"
  echo $menu_s
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

battery_emoji()
{
  local bat_high_emoji="🔋"
  local bat_low_emoji="🪫"
  local bat_charging_emoji="🔌"
  local status="$(cat $BAT_PATH/status)"
  if [ "$status" = "Charging" ]; then
    echo "$bat_charging_emoji"
  else
    [[ "$bat" -lt 15 ]] && echo "$bat_low_emoji" || echo "$bat_high_emoji"
  fi
}

is_muted()
{
  amixer get Master | grep '\[off\]'
  [[ $? = 0 ]] && return 0 || return 1
}

bar

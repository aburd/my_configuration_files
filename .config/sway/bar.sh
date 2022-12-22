#!/bin/sh

BAT_PATH="/sys/class/power_supply/BAT1"

bar()
{
  local d="$(date +'%Y-%m-%d %H:%M')"
  local brightness="$(brightnessctl i | sed -rn 's/.*\(([0-9]{1,3}\%)\).*/\1/p')"
  local vol="$(amixer -D pulse sget Master | sed -rn 's/.+\[([0-9]+)%\].+/\1/p' | head -1)"
  local v_emoji="$(vol_emoji $vol)"
  local menu_s="$v_emoji$vol% 💡$brightness"

  # add bat if exists
  if [ -e $BAT_PATH ]; then
    local bat="$(cat $BAT_PATH/capacity)"
    local bat_emoji="$(battery_emoji)"
    menu_s="$menu_s $bat_emoji$bat%"
  fi

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
    if [ "$bat" -lt 15 ]; then
      echo "$bat_low_emoji" 
    else
      echo "$bat_high_emoji"
    fi
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

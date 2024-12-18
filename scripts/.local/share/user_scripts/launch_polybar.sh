#!/usr/bin/env bash

THEME="nord"

killall polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
export polybar_path="$HOME/.config/polybar"
CONFIG_DIR=$polybar_path/themes/$THEME/config.ini
sleep 1
polybar bottom -r -c $CONFIG_DIR &
# polybar bottom -r -c $CONFIG_DIR &

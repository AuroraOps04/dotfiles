#!/usr/bin/bash
#

# 判断有没有 HDMI 屏幕

xrandr | grep "HDMI" >/dev/null
if [ $? == 0 ]; then
	xrandr --output eDP-1 --off
	for VAR in $(xrandr | awk '/HDMI/{print $1}'); do
		xrandr --output "$VAR" --auto
	done
else
	xrandr --output eDP-1 --auto
fi

#!/bin/bash

Xvfb :1 -screen 0 1313x744x24 &
DISPLAY=:1 firefox -width 1313 -height 744 http://www.lostfilm.tv &

sleep 15s

DISPLAY=:1 import -window root ./screenshot.png

sleep 5s

DISPLAY=:1 xdotool mousemove $(perl ./getCoords.pl) click 1

sleep 7s

DISPLAY=:1 import -window root ./result.png

for proc in firefox Xvfb
do
	for pid in `ps -A | grep $proc`
	do
		kill $pid; 
		break; 
	done
done


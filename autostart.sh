#!/bin/bash

# Copy to ~/.config/dwm/autostart.sh

xrdb ~/.Xresources
xbindkeys
unclutter
numlockx
urxvtd -q &
while true; do
    xsetroot -name "Bat:$(acpi | awk '{print $4}' | tr -d \,)   $(date +"%H:%M")"
    sleep 2
done

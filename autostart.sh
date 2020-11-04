xrdb ~/.Xresources 
xbindkeys 
unclutter &
numlockx 
feh --bg-scale background.png
urxvtd -q &
dunst &
xautolock -time 15 -notify 5 -notifier '/usr/lib/xsecurelock/until_nonidle /usr/lib/xsecurelock/dimmer' -locker xsecurelock &

while true; do
    #xsetroot -name "Bat:$(acpi | awk '{print $4}' | tr -d \,)   $(date +"%H:%M")"
    xsetroot -name "Brightness:$(brightnessctl --device=intel_backlight g)/$(brightnessctl --device=intel_backlight m)   Volume:$(pamixer --get-volume-human)  $(acpi)  $(date +"%H:%M")"
    sleep 2
done

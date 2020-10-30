xrdb ~/.Xresources
xbindkeys
unclutter &
numlockx
feh --bg-scale background.png
urxvtd -q &
dunst &
while true; do
    xsetroot -name "Bat:$(acpi | awk '{print $4}' | tr -d \,)   $(date +"%H:%M")"
    sleep 2
done

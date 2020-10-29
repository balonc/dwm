xrdb ~/.Xresources
xbindkeys
urxvtd -q &
while true; do
    xsetroot -name "Bat:$(acpi | awk '{print $4}' | tr -d \,)   $(date +"%H:%M")"
    sleep 2
done

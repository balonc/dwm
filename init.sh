xrdb ~/.Xresources
xbindkeys
unclutter &
numlockx
feh --bg-scale background.png
urxvtd -q &
dunst &
#xautolock -time 15 -notify 5 -notifier '/usr/lib/xsecurelock/until_nonidle /usr/lib/xsecurelock/dimmer' -locker xsecurelock &

while true; do
    BATT=$( acpi -b | sed 's/.*[charging|unknown], \([0-9]*\)%.*/\1/gi' )
    STATUS=$( acpi -b | sed 's/.*: \([a-zA-Z]*\),.*/\1/gi' )
    BRIGHTNESS=$( brightnessctl --device=intel_backlight g )
    BRIGHTNESS_TOTAL=$( brightnessctl --device=intel_backlight m )
    VOLUME=$( pamixer --get-volume-human ) 
    DATETIME=$( date +"%H:%M" )

    if [ "${BATT}" -le 15 ] && [ "${STATUS}" == "Discharging" ]; then
        xsetroot -name "b:$BRIGHTNESS/$BRIGHTNESS_TOTAL, v:$VOLUME, ^c#ffffff^^b#e5211d^ϟ:$STATUS,$BATT%^d^  $DATETIME";
    elif [ "${BATT}" -le 30 ] && [ "${STATUS}" == "Discharging" ]; then
        xsetroot -name "b:$BRIGHTNESS/$BRIGHTNESS_TOTAL, v:$VOLUME, ^c#151515^^b#d2dd30^ϟ:$STATUS,$BATT%^d^  $DATETIME";
    else
        xsetroot -name "b:$BRIGHTNESS/$BRIGHTNESS_TOTAL, v:$VOLUME, ϟ:$STATUS,$BATT%  $DATETIME";
    fi

    sleep 2
done

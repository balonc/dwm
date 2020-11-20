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
    BRIGHTNESS_PERC=$( bc <<< "scale=2;$BRIGHTNESS/$BRIGHTNESS_TOTAL*100" )
    BRIGHTNESS_PERC_PRINT=${BRIGHTNESS_PERC%.*}
    VOLUME=$( pamixer --get-volume-human ) 
    DATETIME=$( date +"%H:%M" )

    S_BRIGHTNESS="b:$BRIGHTNESS_PERC_PRINT%"
    S_VOLUME="v:$VOLUME"
    S_BATTERY="ϟ:$STATUS,$BATT%"
    S_DATETIME="$DATETIME"

    if [ "${BATT}" -le 15 ] && [ "${STATUS}" == "Discharging" ]; then
        S_BATTERY="^c#ffffff^^b#e5211d^ϟ:$STATUS,$BATT%^d^"
    elif [ "${BATT}" -le 30 ] && [ "${STATUS}" == "Discharging" ]; then
        S_BATTERY="^c#151515^^b#d2dd30^ϟ:$STATUS,$BATT%^d^"
    elif [ "${BATT}" == 100 ] && [ "${STATUS}" == "Charging" ]; then
        S_BATTERY="^c#151515^^b#1b9104^ϟ:$STATUS,$BATT%^d^"
    fi

    xsetroot -name "$S_BRIGHTNESS, $S_VOLUME, $S_BATTERY, $S_DATETIME";

    sleep 2
done

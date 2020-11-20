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

    if [ "${BATT}" -le 15 ] && [ "${STATUS}" == "Discharging" ]; then
        xsetroot -name "b:$(brightnessctl --device=intel_backlight g)/$(brightnessctl --device=intel_backlight m), v:$(pamixer --get-volume-human), ^c#ffffff^^b#e5211d^e:$STATUS,$BATT%^d^  $(date +"%H:%M")";
    elif [ "${BATT}" -le 25 ] && [ "${STATUS}" == "Discharging" ]; then
        xsetroot -name "b:$(brightnessctl --device=intel_backlight g)/$(brightnessctl --device=intel_backlight m), v:$(pamixer --get-volume-human), ^c#151515^^b#d2dd30^e:$STATUS,$BATT%^d^  $(date +"%H:%M")";
    else
        xsetroot -name "b:$(brightnessctl --device=intel_backlight g)/$(brightnessctl --device=intel_backlight m), v:$(pamixer --get-volume-human), e:$STATUS,$BATT%  $(date +"%H:%M")";
    fi

    sleep 2
done

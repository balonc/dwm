xrdb ~/.Xresources 
xbindkeys 
unclutter &
numlockx 
feh --bg-scale background.png
urxvtd -q &
dunst &
#xautolock -time 15 -notify 5 -notifier '/usr/lib/xsecurelock/until_nonidle /usr/lib/xsecurelock/dimmer' -locker xsecurelock &

while true; do
    #xsetroot -name "Bat:$(acpi | awk '{print $4}' | tr -d \,)   $(date +"%H:%M")"
    BATT=$( acpi -b | sed 's/.*[charging|unknown], \([0-9]*\)%.*/\1/gi' )
    STATUS=$( acpi -b | sed 's/.*: \([a-zA-Z]*\),.*/\1/gi' )

    if ([ $BATT -le 20] && [ $STATUS == 'Discharging' ]); then
	notify-send --expire-time=5000 --urgency=normal "low [-20%] battery status. Now $($STATUS),$($BATT)%"
    elif ([ $BATT -le 15] && [ $STATUS == 'Discharging' ]); then
	 notify-send --expire-time=5000 --urgency=critical "critical [-15%] battery status. Now $($STATUS),$($BATT)%"
    elif ([ $BATT -le 10] && [ $STATUS == 'Discharging']); then
	 notify-send --expire-time=5000 --urgency=critical "critical [-10%] battery status. Now $($STATUS),$($BATT)%"
    elif ([ $BATT -le 5] && [ $STATUS == 'Discharging']); then
	 notify-send --expire-time=5000 --urgency=critical "critical [-5%] battery status. Now $($STATUS),$($BATT)%"
    fi

    xsetroot -name "Brightness:$(brightnessctl --device=intel_backlight g)/$(brightnessctl --device=intel_backlight m) Volume:$(pamixer --get-volume-human) Battery: $STATUS,$BATT%  $(date +"%H:%M")"
    sleep 2
done

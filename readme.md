# dwm

# Used patches
*autostart

This patch will make dwm run "~/.dwm/autostart_blocking.sh" and "~/.dwm/autostart.sh &" before entering the handler loop. One or both of these files can be ommited.

Be aware that dwm will not startup as long as autostart_blocking.sh is running and will stay completely unresponsive. For obvious reasons it is generally a bad idea to start X-applications here :)

*titlecolor

Adds a new color scheme used by the window title in the bar, so that its colors (foreground and background) can be changed independently.

*actualfullscreen

Actually toggle fullscreen for a window, instead of toggling the status bar and the monocle layout.

*noborder

Remove the border when there is only one window visible, checking if the layout is floating before hiding the border.

*status2d

Status2d allows colors and rectangle drawing in your DWM status bar. See below an example of my status bar with multi-cpu and battery.

*pertag

More general approach to taglayouts patch. This patch keeps layout, mwfact, barpos and nmaster per tag.

*swallow

This patch adds "window swallowing" to dwm as known from Plan 9's windowing system rio.

Clients marked with isterminal in config.h swallow a window opened by any child process, e.g. running xclock in a terminal. Closing the xclock window restores the terminal window in the current position.

This patch helps users spawning a lot of graphical programs from their command line by avoiding cluttering the screen with many unusable terminals. Being deep down in a directory hierarchy just does not make the use of dmenu feasible.

*movestack

This plugin allows you to move clients around in the stack and swap them with the master. It emulates the behavior off mod+shift+j and mod+shift+k in Xmonad. movestack(+1) will swap the client with the current focus with the next client. movestack(-1) will swap the client with the current focus with the previous client.
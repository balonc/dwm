# dwm

dwm is a dynamic window manager for X. It manages windows in tiled, monocle and floating layouts. All of the layouts can be applied dynamically, optimising the environment for the application in use and the task performed.

In tiled layout windows are managed in a master and stacking area. The master area contains the window which currently needs most attention, whereas the stacking area contains all other windows. In monocle layout all windows are maximised to the screen size. In floating layout windows can be resized and moved freely. Dialog windows are always managed floating, regardless of the layout applied.

Windows are grouped by tags. Each window can be tagged with one or multiple tags. Selecting certain tags displays all windows with these tags.

Each screen contains a small status bar which displays all available tags, the layout, the number of visible windows, the title of the focused window, and the text read from the root window name property, if the screen is focused. A floating window is indicated with an empty square and a maximised floating window is indicated with a filled square before the windows title. The selected tags are indicated with a different color. The tags of the focused window are indicated with a filled square in the top left corner. The tags which are applied to one or more windows are indicated with an empty square in the top left corner.

dwm draws a small customizable border around windows to indicate the focus state.

## differences

In contrast to ion, larswm, and wmii, dwm is much smaller, faster and simpler.

*dwm has no Lua integration, no 9P support, no shell-based configuration, no remote control, and comes without any additional tools, such as for printing the selection or warping the mouse.
*dwm is only a single binary, and its source code is intended to never exceed 2000 SLOC.
*dwm doesn't distinguish between layers: there is no floating or tiled layer. Whether or not the clients of currently selected tag(s) are in tiled layout, you can rearrange them on the fly. Popup and fixed-size windows are always floating, however.
*dwm is customized through editing its source code, which makes it extremely fast and secure - it does not process any input data which isn't known at compile time, except window titles and status text read from the root window's name. You don't have to learn Lua/sh/ruby or some weird configuration file format (like X resource files), beside C, to customize it for your needs: you only have to learn C (at least in order to edit the header file).
*Because dwm is customized through editing its source code, it's pointless to make binary packages of it. This keeps its userbase small and elitist. No novices asking stupid questions. There are some distributions that provide binary packages though.
*dwm reads from the root window's name to print arbitrary status text (like the date, load, battery charge). That's much simpler than larsremote, wmiir and what not...
*dwm creates a view for each Xinerama screen.

# customisation
dwm is customised by editing config.h, a C language header file, and config.mk, a Make include file.

config.h is a source code file which is included by dwm.c, the main dwm source code module. It serves as the configuration file for all of dwm's features, e.g., application placement, tags, and colours. A vanilla download of dwm will contain a file called config.def.h, a template you can use to create your own config.h file. To start customising dwm, simply copy config.def.h into config.h before you run make.

config.mk is a file included by Makefile. It allows you to configure how make is going to compile and install dwm.

# dynamic window management

We think that static window management as seen in Ion or wmi-10 is a far too rigid and inflexible working environment. In acme, larswm, and oberon, dynamic window management frees the user from these limitations. The user can start as many applications and windows as he likes, and easily arrange them in a useful way, helped by the window manager - the working environment changes with the tasks the user is performing. The experience is very fluid and natural. Similar concepts have been introduced in wmii and dwm.

Dynamic window management states that it is the window manager's job to manage windows - and not the user's job to have to set up some specialized layout that will only work for one specific work scenario. This has been the larswm motto for a long time. In contrast to static window management, the user rarely has to think about how to organize windows, no matter what he is doing or how many applications are running at the same time. The window manager adapts to the current environment and helps the user manage and mold it to his needs, rather than forcing it to use a preset, fixed layout and trying to shoehorn all windows and applications into it.

Dynamic window management has many advantages - you can create and tear down whole working environments in a matter of seconds rather than spending time fine-tuning a fixed layout that cannot work well in all cases. The number and nature of windows you work with changes all the time, and a dynamic window manager lets you adapt to that and always efficiently use your precious screen real estate.

Some will argue that you should setup a different static workspace for each of the tasks you perform (one for web browsing, one for email reading, one for coding, etc.), but that is just a workaround for the limitations of static window management, and it doesn't account for the many sub-usage patterns each main task has.

For example: the layout you use during debugging would probably be quite different to the one used during refactoring, you might want to have a patch someone emailed you in view while you look at some code, or edit a configuration file while you look at a man page or website. Dynamic window management lets you mix and match on the fly to always have the windows you need in view, and only the windows you need, without the need to reserve extra space which you may or may not end up using.

# used patches
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
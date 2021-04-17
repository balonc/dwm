![dwm](misc/dwm.svg)
============================
dwm is an extremely fast, small, and dynamic window manager for X.


Requirements
------------
In order to build dwm you need the Xlib header files.


Installation
------------
Edit config.mk to match your local setup (dwm is installed into
the /usr/local namespace by default).

Afterwards enter the following command to build and install dwm (if
necessary as root):

    make clean install


Running dwm
-----------
Add the following line to your .xinitrc to start dwm using startx:

    exec dwm

In order to connect dwm to a specific display, make sure that
the DISPLAY environment variable is set correctly, e.g.:

    DISPLAY=foo.bar:1 exec dwm

(This will start dwm on display :1 of the host foo.bar.)

In order to display status info in the bar, you can do something
like this in your .xinitrc:

    while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
    do
    	sleep 1
    done &
    exec dwm


Configuration
-------------
The configuration of dwm is done by creating a custom config.h
and (re)compiling the source code.

Parches usados
-------------

Parches estéticos:
* [actualfullscreen](https://dwm.suckless.org/patches/actualfullscreen/) Alterna la pantalla completa para una ventana, en lugar de alternar la barra de estado y el diseño *monocle*.
* [titlecolor](https://dwm.suckless.org/patches/titlecolor/) Añade un nuevo esquema de color utilizado por el título de la ventana en la barra, de modo que sus colores (primer plano y fondo) se pueden cambiar de forma independiente.
* [noborderfloating](https://dwm.suckless.org/patches/noborder/) Elimina el borde cuando sólo haya una ventana visible.

Parches funcionales:
* [movestack](https://dwm.suckless.org/patches/movestack/) Permite mover clientes en la pila e intercambiarlos con el maestro.
* [pertag](https://dwm.suckless.org/patches/pertag/) Mantiene *layout*, *mwfact*, *barpos* y *nmaster* por etiqueta (*tag*).

.xinitrc
-------------

Para el correcto funcionamiento del sistema, en conjunto con otras piezas de software, se iniciarán junto a *dwm* otras instrucciones en el archivo *.xinitrc*, siendo el contenido de éste:

```
slstatus &
xbindkeys &
unclutter -idle 3 &
xrdb ~/.Xresources &
feh --bg-scale .background.png &
dunst &
xautolock -time 20 -locker slock &
urxvtd -q &
exec dwm > ~/.dwm.log
```
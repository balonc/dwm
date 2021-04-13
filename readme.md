![dwm](misc/dwm.svg)

dwm es mi gestor de ventanas favorito por las siguientes razones:

- Velocidad y productividad. dwm es realmente rápido y eficiente.
- Refleja a la perfección mi propia forma de trabajar y funcionar.
    - No pierdo tiempo en la redimensión de ventanas, así como su colocación en el campo de la pantalla, ofreciendo prácticamente el 100% de ella.
    - Normalmente mantengo dos ventanas, una al lado de la otra; a modo de segundo monitor.
    - A veces quiero que una ventana ocupe toda la pantalla.
    - Suelo emplear múltiples escritorios para distintos fines y administración de aplicaciones.
    - Trabajo casi totalmente en terminal de comandos.
    - Uso atajos de teclado para todo, evitando usar el ratón más que para tareas secundarias como navegar por la red.

# Administración de layouts
dwm se organiza en 3 layouts, configurables y adaptables a distintas situaciones:

## tiled [t]=
Es el layout por defecto. En éste, la primera ventana se inicia ocupando toda la pantalla disponible. Cuando se añade una segunda ventana, se abre en el área `master`, mientras que el resto de ventanas van ocupando el área `stack`. Este diseño es la razón de ser de dwm, y es el layout que utilizo el 99% de las veces.

![dwm_master_stack_layout](misc/dwm_master_stack_layout.png)

![tiled_layout](misc/tiled_layout.png)

Se accede a este layout mediante la combinación `M-t`

## monocle [n]
Diseño de layout práctico, que empuja la ventana enfocada al frente, mostrándose ocupando el máximo de pantalla (pantalla completa). Se puede hacer switch al resto de pantallas para ir enfocándolas.

![monocle_layout](misc/monocle_layout.png)

Se accede a este layout mediante la combinación `M-m`

## floating >f<>
Permite la superposición de ventanas y su movimiento y redimensión libres por la pantalla. Es el método más usado hoy día en entornos gráficos.

![tiled_layout](misc/floating_layout.png)

Se accede a este layout mediante la combinación `M-f`

# Administración de ventanas
La apertura de ventanas se realiza mediante el software `dmenu`, que se ejecuta mediante la orden `M-r`.

# used patches
* autostart

This patch will make dwm run "~/.dwm/autostart_blocking.sh" and "~/.dwm/autostart.sh &" before entering the handler loop. One or both of these files can be ommited.

Be aware that dwm will not startup as long as autostart_blocking.sh is running and will stay completely unresponsive. For obvious reasons it is generally a bad idea to start X-applications here :)

* titlecolor

Adds a new color scheme used by the window title in the bar, so that its colors (foreground and background) can be changed independently.

* actualfullscreen

Actually toggle fullscreen for a window, instead of toggling the status bar and the monocle layout.

* noborder

Remove the border when there is only one window visible, checking if the layout is floating before hiding the border.

* status2d

Status2d allows colors and rectangle drawing in your DWM status bar. See below an example of my status bar with multi-cpu and battery.

* pertag

More general approach to taglayouts patch. This patch keeps layout, mwfact, barpos and nmaster per tag.

* movestack

This plugin allows you to move clients around in the stack and swap them with the master. It emulates the behavior off mod+shift+j and mod+shift+k in Xmonad. movestack(+1) will swap the client with the current focus with the next client. movestack(-1) will swap the client with the current focus with the previous client.
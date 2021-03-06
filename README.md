# Configuration the BSPWM

This setting is based on [Bspwm: A Bare-Bones Window Manager](https://dev.to/l04db4l4nc3r/bspwm-a-bare-bones-window-manager-44di).
The article offers a detailed explanation about the configuration for BSPWM.

## Getting started 

To start you should install the windows manager and the simple X host key
daemon:
```bash
yay -S bspwm
yay -S sxhkd
```

An example of configuration is in `/usr/share/doc/bspwm/examples/bspwmrc` so
you could copy from it:
```bash
cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm
```

There is also an example for the sxhkd in `/usr/share/doc/bspwm/examples/sxhkdrc` 
```bash
cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd 
```

Here we are going to edit the configuration in files located in the
corresponding folders in this repository, so only need to link the to the
corresponding location:
```bash
ln -s $PWD/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
ln -s $PWD/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
```
Do not forget to add the appropriate permissions for each one:
```bash
chmod 755 $PWD/bspwm/bspwmrc
chmod 644 $PWD/sxhkd/sxhkdrc
```

## Adding a bar 

Here the polybar status bar is used which is installed via:
```bash
yay -S siji-git ttf-unifont xorg-fonts-misc-otb
yay -S polybar
fc-cache -f -v
```
```bash
cp /usr/share/doc/polybar/config ~/.config/polybar/config
```

In this case we are going to link our configuration located at polybar folder:
```bash
ln -s $PWD/polybar/config ~/.config/polybar/config
```
Don't forget to add the corresponding permissions:
```bash
chmod 644 $PWD/polybar/config
```
In addition to this, it is required that you add a startup script.
He it is provided a startup in `polybar` folder.

You should also add the appropriate permissions:
```bash
chmod +x $PWD/polybar/launch.sh
```

And posteriorly add the corresponding link in the appropriate address.

Take into account that in the config file should be a bar definition in
`[bar/barname]` so you should use this name when calling in the launch script.

The current configuration uses also the program networkmanager_dmenu, which
should be installed to work appropriately.
```
yay -S networkmanager-dmenu
```

## Fixing cursor X

In BSPWM when you are in no active window, appears a cursor with a X shape.
According to these references:
[Reddit answer](https://www.reddit.com/r/bspwm/comments/8gwwlc/cursor_displays_x_when_not_over_window/dyfj6cw?utm_source=share&utm_medium=web2x&context=3) 
and 
[Archlinux wiki](https://wiki.archlinux.org/index.php/Cursor_themes#Change_X_shaped_default_cursor)
the solution is add to `~/.xinitrc` o `bspwm` files:
```bash
xsetroot -cursor_name left_ptr
```

## Trouble with slack and other eletron based apps
When there is a notification, the window of Slack, for example freezes for a
while which causes to take some actions such as killing the process and
starting it again.

According to this thread [Slack-desktop freezes on notification](https://www.reddit.com/r/archlinux/comments/8z5bex/slackdesktop_freezes_on_notification/e2g6z3n?utm_source=share&utm_medium=web2x&context=3)
it is due to the inexisting daemon notification service. So to avoid this
trouble, you should install such daemon, for example via `dunst`.

```bash
yay -S dunst
```


## References
For polybar there are some interesting styles which could be found at:
[polybar-themes](https://github.com/adi1090x/polybar-themes)

For network manager instead of using nm-applet it could be used the 
project [networkmanager-dmenu](https://github.com/firecat53/networkmanager-dmenu)

To install it:
```bash
yay -S networkmanager-dmenu
```

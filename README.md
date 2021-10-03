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
corresponding folders in this repository, so only need to link to the
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

And then add the corresponding link in the appropriate address.

Take into account that in the config file should be a bar definition in
`[bar/barname]` so you should use this name when calling in the launch script.

The current configuration uses also the program networkmanager_dmenu, which
should be installed to work appropriately.
```
yay -S networkmanager-dmenu
```
### All windows in polybar

There is an interesting script by [Tam-Carre](https://github.com/tam-carre)
which es named [polywins](https://github.com/tam-carre/polywins) based on
[polybar-windows](https://github.com/aroma1994/polybar-windows) that enables
showing all window names and select them in the polybar.

This project is included as submodule in this repository and added to the
second polybar configuration.

## Multimonitor support
The support for multimonitor is based mainly on https://protesilaos.com/codelog/multihead-bspwm-polybar/.
It requires uses by default the HDMI-1 output for external monitor. You can
edit the `EXTERNAL_MONITOR_NAME` in case you use another. You can check also
the connected monitors by:
```
xrandr -q | grep -w connected 
```

There is also a script named `launch_two.sh` in the configuration folder for
polybar which creates a bar for the attached monitor. It uses the HDMI-1
monitor. If you use another, could change to another in the `config` file.

## Using rofi as launcher

[Rofi](https://github.com/davatorium/rofi) is an interesting tool which could
be use as a launcher and as a window switcher. It could be installed by:
```
yay -S rofi
```

Although a powerful tool their appearance is old-fashioned, so, here we use a
repository which implements several themes and applets. This repository is
located at https://github.com/adi1090x/rofi

The process to install is:
```
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi
chmod +x setup.sh
./setup.sh
```

This script installs a set of scripts to launch specific features of rofi. 
All the scripts are located under `$HOME/.config/rofi/bin`.

Now to these scripts where recognized you should add the following line to
`xprofile` or to the shell config file.

```
echo "PATH=$PATH:~/.config/rofi/bin" >> ~/.xprofile
```

To use local themes you could import them via:
```
rofi-theme-selector
```
And according to the information the theme could be applied via Alt+a inside
the dialog.

### Using rofi to select emoji

Employing this repository https://github.com/Mange/rofi-emoji, it adds
 modi to select an emoji and copy to the clipboard. To use it you can call by:
```
rofi --show emoji -modi emoj
```

## Trouble: Rambox not shown in rofi windows switcher

When Rambox is configured to start minimized, the window is not recognized by
rofi event after being shown. To prevent this issue, disable this option. And
the window of Rambox will be recognized.


## Trouble: Fixing cursor X

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

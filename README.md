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
yay -S siji-git ttf-unifont xorg-fonts-misc
yay -S polybar
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

## References
For polybar there are some interesting styles which could be found at:
[polybar-themes](https://github.com/adi1090x/polybar-themes)

For network manager instead of using nm-applet it could be used the 
project [networkmanager-dmenu](https://github.com/firecat53/networkmanager-dmenu)

To install it:
```bash
yay -S networkmanager-dmenu
```

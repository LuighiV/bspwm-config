#/bin/bash -x

mkdir -p ~/.config/bspwm
mkdir -p ~/.config/sxhkd

chmod 755 $PWD/bspwm/bspwmrc
chmod 644 $PWD/sxhkd/sxhkdrc

ln -s $PWD/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
ln -s $PWD/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc

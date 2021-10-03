#/bin/bash -x

chmod 644 $PWD/polybar/config
chmod +x $PWD/polybar/launch.sh

mkdir -p ~/.config/polybar

ln -s $PWD/polybar/config ~/.config/polybar/config
ln -s $PWD/polybar/launch.sh ~/.config/polybar/launch.sh
ln -s $PWD/polybar/launch_two.sh ~/.config/polybar/launch_two.sh

POLYWINS_FILE="${PWD}/polybar/polywins/polywins.sh"
if [[ -f $POLYWINS_FILE ]]; then
  ln -s $POLYWINS_FILE ~/.config/polybar/polywins.sh
fi

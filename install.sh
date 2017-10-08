#!/bin/bash
#THIS SCRIPT HAS NOT BEEN TESTED. USE AT YOUR OWN RISK

#Download and install the basics
if [[ $1 == *"i"* ]]; then
  sudo apt install i3
  sudo apt install i3blocks
  sudo apt install thunar
  sudo apt install git
  sudo apt install python-pip
  sudo apt install rofi
fi

#Run config wizard to generate a config file
i3-config-wizard

#Copy files to necessary locations
if [[ $1 == *"c"* ]]; then
  cp ./i3/config ~/.config/i3/
  cp ./i3/i3blocks.conf ~/.config/i3/
  cp ./settings.ini ~/.config/gtk-3.0/
  cp ./.gtkrc-2.0 ~/
fi

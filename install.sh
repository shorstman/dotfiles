#!/bin/bash
#THIS SCRIPT HAS NOT BEEN TESTED. USE AT YOUR OWN RISK.

if [[$1 == ""]]; then
  $1 = "icr"
fi

#Download and install the basics
if [[ $1 == *"i"* ]]; then

  sudo apt update
  sudo apt upgrade
  sudo apt install compton
  sudo apt install i3
  sudo apt install i3blocks
  sudo apt install thunar
  sudo apt install git
  sudo apt install python-pip
  sudo apt install rofi
  sudo apt install xautolock
  sudo apt install autoconf

  #i3 gaps
  sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake
  cd ..
  git clone https://www.github.com/Airblader/i3 i3-gaps
  cd i3-gaps
  autoreconf --force --install
  rm -rf build/
  mkdir -p build && cd build/
  ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
  make
  sudo make install
  cd ..
  cd dotfiles
fi

#Run config wizard to generate a config file
i3-config-wizard

#Copy files to necessary locations
if [[ $1 == *"c"* ]]; then
  cp ./i3/config ~/.config/i3/
  cp ./i3/i3blocks.conf ~/.config/i3/
  cp ./settings.ini ~/.config/gtk-3.0/
  cp ./.gtkrc-2.0 ~/
  mkdir ~/Pictures/Wallpapers
  cp ./wallpaper.* ~/Pictures/Wallpapers/
  cp ./i3batwarn.sh ~/
fi

#Reminders for things that need to be done manually
if [[ $1 == *"r"* ]]; then
  echo Set horizontal scrolling with xinput
  echo Find the touchpad id
  xinput --list
  read $touchpad
  echo Find two finger scrolling
  xinput --watch-prop $touchpad
  read $scrolling
  xinput --set-prop $touchpad "$scrolling" 1 1

  echo
  echo "Set cronjob for battery reminder as:"
  echo "*/1 * * * * /home/<user>/.i3batwarn.sh"
  crontab -e
fi

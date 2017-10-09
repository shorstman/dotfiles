#!/bin/bash
#Gather all necessary files and put them into this directory
#Then do a git push

cp ~/.config/i3/config ./i3/
cp ~/.config/i3/i3blocks.conf ./i3/
cp ~/.config/gtk-3.0/settings.ini ./
cp ~/.gtkrc-2.0 ./
cp ~/Pictures/Wallpapers/wallpaper.png ./

git add .
git commit -m "$1"
git push origin master

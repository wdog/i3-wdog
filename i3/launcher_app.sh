#!/bin/bash

# Telegram

RUN=$(echo "gnome-calculator
Telegram
firefox
google-chrome
thunderbird
gmusicbrowser
spotify
thunar
nautilus
remmina
blueman-manager
pavucontrol
" | rofi -dmenu -show-icons -p "RUN::")

[[ -z $RUN ]] && exit
exec $RUN

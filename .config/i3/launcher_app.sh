#!/bin/bash

# Telegram

RUN=$(echo "Telegram
firefox
google-chrome
thunderbird
gmusicbrowser
spotify
thunar
blueman-manager
pavucontrol
" | rofi -dmenu -show-icons -p "RUN::")

[[ -z $RUN ]] && exit
exec $RUN

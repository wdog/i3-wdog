#!/usr/bin/python3

import dbus
import os
import sys
import argparse

STATUS_TO_ICON = {
    1: '',
    0: '',
}


parser = argparse.ArgumentParser()
parser.add_argument(
    '-t',
    '--toggle',
    type=int,
    metavar='toggle'
)


BUS_NAME = 'org.gmusicbrowser'
OBJECT_PATH = '/org/gmusicbrowser'
PLAYER_INTERFACE = 'org.gmusicbrowser.Player'

try:

    bus = dbus.SessionBus()
    obj = bus.get_object("org.gmusicbrowser","/org/gmusicbrowser")
    gmusicbrowser = bus.get_object(BUS_NAME, OBJECT_PATH)
    gmusicbrowser_iface = dbus.Interface(obj, "org.gmusicbrowser")
#


    args = parser.parse_args()
    if args.toggle is not None:
        gmusicbrowser_iface.RunCommand("PlayPause")

    info = gmusicbrowser_iface.CurrentSong()
    status = gmusicbrowser_iface.Playing()
    status_icon = STATUS_TO_ICON.get(status, '?')
    print("[ " + status_icon + " ] "  + str(info['artist']) + " - " + str(info['title']) )

    
#except dbus.exceptions.DBusException:
except dbus.DBusException as ex:
    exit

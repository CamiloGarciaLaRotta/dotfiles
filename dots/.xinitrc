#!/bin/sh

# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
. /etc/X11/Xsession

# WM config
exec i3 >> /var/log/i3log 2>&1

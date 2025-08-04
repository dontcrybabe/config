#!/bin/bash

export QT_QPA_PLATFORM="wayland;xcb"
export GDK_BACKEND=wayland
export SDL_VIDEODRIVER=wayland
export CLUTTER_BACKEND=wayland
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=niri

dbus-update-activation-environment --all

systemctl --user restart xdg-desktop-portal-gtk.service

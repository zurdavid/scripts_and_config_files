#!/bin/sh

# Show the auto-hidden workspace panel for a moment, then set it to autohide again
xfconf-query -c xfce4-panel -p /panels/panel-1/autohide-behavior -s 1
xfconf-query -c xfce4-panel -p /panels/panel-1/autohide-behavior -s 2

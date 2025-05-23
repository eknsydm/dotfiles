#!/bin/bash

# Check if gedit is running
# -x flag only match processes whose name (or command line if -f is
# specified) exactly match the pattern. 

if pgrep -x "blueman-manager" > /dev/null
then
    killall blueman-manager
else
    blueman-manager &
fi


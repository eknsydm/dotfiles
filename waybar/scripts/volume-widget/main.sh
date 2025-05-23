#!/bin/bash

# Check if gedit is running
# -x flag only match processes whose name (or command line if -f is
# specified) exactly match the pattern. 

if pgrep -x "pavucontrol" > /dev/null
then
    killall pavucontrol
else
    pavucontrol
fi

#!/bin/sh

docker run -it --net=bridge --env DISPLAY=$DISPLAY --mac-address 94:C6:91:A9:1E:B6 --mount type=bind,src=/tmp/.X11-unix,dst=/tmp/.X11-unix --volume .:/home/gowin/proj gowin_ide

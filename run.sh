#!/bin/sh

docker run -it \
       --net=bridge \
       --env DISPLAY=$DISPLAY \
       --mount type=bind,src=/tmp/.X11-unix,dst=/tmp/.X11-unix \
       --volume ./proj:/home/gowin/proj \
       gowin_ide

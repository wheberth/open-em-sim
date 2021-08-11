docker run \
    -it --device=/dev/dri \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $(pwd):/home/work --ipc=host --net=host \
    -e DISPLAY="$DISPLAY" wheberth/open-em-sim /home/work/$1 
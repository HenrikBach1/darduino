#!/bin/bash
# Starts the Arduino IDE using the docker image.
#   See also: https://github.com/tombenke/darduino
#             https://stackoverflow.com/questions/41485217/mount-current-directory-as-a-volume-in-docker-on-windows-10
#             https://alexcabal.com/disabling-gnomes-recently-used-file-list-the-better-way

DISPLAY=192.168.0.104:0.0
# USER=henrikbach1
IMAGE=darduino
ARDUINO_IDE_VERSION=latest

# If Cygwin
#   then change path designation to windows
    path=$(cygpath -w "${PWD}")

    # -v /dev/ttyACM0:/dev/ttyACM0 \
    # -v /dev/ttyUSB0:/dev/ttyUSB0 \
    # -v /tmp/.X11-unix:/tmp/.X11-unix \
    # $USER/$IMAGE:$ARDUINO_IDE_VERSION \
docker run \
    -it \
    --detach \
    --network=host \
    --privileged \
    -e DISPLAY=$DISPLAY \
    -v /dev:/dev \
    -v "$path":/project \
    --name arduino \
    $IMAGE:$ARDUINO_IDE_VERSION \
    arduino

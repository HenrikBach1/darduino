#!/bin/bash
# Starts the Arduino IDE using the docker image.
#   See: https://github.com/tombenke/darduino

DISPLAY=192.168.0.104:0.0
# USER=henrikbach1
IMAGE=darduino
ARDUINO_IDE_VERSION=latest

    # --rm \
    # -v /dev/ttyACM0:/dev/ttyACM0 \
    # -v /dev/ttyUSB0:/dev/ttyUSB0 \
    # -v /tmp/.X11-unix:/tmp/.X11-unix \
    # $USER/$IMAGE:$ARDUINO_IDE_VERSION \
docker run \
    -it \
    --network=host \
    --privileged \
    -e DISPLAY=$DISPLAY \
    -v .:/home/developer/Arduino \
    --name arduino \
    $IMAGE:$ARDUINO_IDE_VERSION \
    arduino

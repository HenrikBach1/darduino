@echo off
@REM Translated from arduino.sh

set DISPLAY=192.168.0.104:0.0
@REM set USER=henrikbach1
set IMAGE=darduino
set ARDUINO_IDE_VERSION=latest

    @REM # -v /dev/ttyACM0:/dev/ttyACM0 \
    @REM # -v /dev/ttyUSB0:/dev/ttyUSB0 \
    @REM -v /dev:/dev \
    @REM # -v /tmp/.X11-unix:/tmp/.X11-unix \
    @REM # $USER/$IMAGE:$ARDUINO_IDE_VERSION \
docker run ^
    -it ^
    --detach ^
    --network=host ^
    --privileged ^
    -e DISPLAY=%DISPLAY% ^
    -v "%cd%":/project ^
    --name arduino ^
    %IMAGE%:%ARDUINO_IDE_VERSION% ^
    arduino

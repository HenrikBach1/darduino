FROM ubuntu:16.04

ENV ARDUINO_IDE_VERSION 1.8.13

# ENV HOME /home/developer
# WORKDIR /home/developer

# # Replace 1000 with your user / group id
    # export uid=1000 gid=1000 && \
    # mkdir -p /home/developer && \
    # mkdir -p /etc/sudoers.d && \
    # echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    # echo "developer:x:${uid}:" >> /etc/group && \
    # echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    # chmod 0440 /etc/sudoers.d/developer && \
    # chown ${uid}:${gid} -R /home/developer && \
RUN \
    apt-get update \
	&& apt-get install -y \
        software-properties-common \
		wget \
		openjdk-9-jre \
		xvfb \
        xz-utils \
	sudo \
    && add-apt-repository ppa:ubuntuhandbook1/apps \
    && apt-get update \
    && apt-get install -y avrdude avrdude-doc \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

# # Add developer user to the dialout group to be ale to write the serial USB device
# RUN sed "s/^dialout.*/&developer/" /etc/group -i \
#     && sed "s/^root.*/&developer/" /etc/group -i

RUN \
    mkdir -p /programs \
    && (wget -q -O- https://downloads.arduino.cc/arduino-${ARDUINO_IDE_VERSION}-linux64.tar.xz \
	    | tar xJC /programs \
	&& ln -s /programs/arduino-${ARDUINO_IDE_VERSION} /arduino \
	&& ln -s /programs/arduino-${ARDUINO_IDE_VERSION}/arduino /usr/local/bin/arduino)

# DISABLING GNOME’S RECENTLY-USED FILE LIST, THE BETTER WAY - OLD METHOD #3
RUN \
    echo gtk-recent-files-max-age=0 >> ~/.gtkrc-2.0

    # mkdir -p ~/.config/gtk-3.0 \
    # && echo -e "[Settings]\ngtk-recent-files-max-age=0\ngtk-recent-files-limit=0" > ~/.config/gtk-3.0/settings.ini \
    # && rm -d ~/.local/share/recently-used.xbel
    
# USER developer

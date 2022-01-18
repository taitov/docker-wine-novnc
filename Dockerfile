FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y locales gnupg --no-install-recommends && \
        dpkg-reconfigure locales && \
        echo 'ru_RU.UTF-8 UTF-8' >> /etc/locale.gen && locale-gen && \
        /usr/sbin/update-locale LANG=ru_RU.UTF-8

ENV LANG=ru_RU.UTF-8 \
        LANGUAGE=ru_RU.UTF-8 \
        LC_ALL=ru_RU.UTF-8

RUN apt-get install -y --no-install-recommends \
        bash \
        curl \
        novnc \
        supervisor \
        x11vnc \
        xvfb \
        xdotool

RUN dpkg --add-architecture i386 && apt-get update
RUN apt-get install -y --no-install-recommends \
        wine32 \
        winetricks

RUN rm -rf /var/lib/apt/lists/*

ENV WINEARCH=win32

RUN curl https://dl.winehq.org/wine/wine-mono/7.0.0/wine-mono-7.0.0-x86.msi -o /root/wine-mono
RUN curl https://dl.winehq.org/wine/wine-gecko/2.47.2/wine-gecko-2.47.2-x86.msi -o /root/wine-gecko
RUN wine msiexec /i /root/wine-mono
RUN wine msiexec /i /root/wine-gecko

RUN mkdir /application
COPY utils /root/utils

ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    DISPLAY=:0.0

ENV DISPLAY_WIDTH=1920 \
    DISPLAY_HEIGHT=1080 \
    DIRECTORY=/application \
    APPLICATION=notepad.exe \
    ARGUMENTS=""

CMD ["/root/utils/entrypoint.sh"]

EXPOSE 8080

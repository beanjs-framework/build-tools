FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y \
    build-essential git python python-pip \
    lib32z1 lib32ncurses5 \
    gcc-multilib g++-multilib libzip-dev zlib1g
RUN pip install nrfutil

# --- ARM ENV (STM32,NRF,W600)---
COPY ./gcc-arm-none-eabi-49 /opt/gcc-arm-none-eabi-49
ENV PATH $PATH:/opt/gcc-arm-none-eabi-49/bin

# --- ESP8266 ENV ---
COPY ./xtensa-lx106-elf /opt/xtensa-lx106-elf
ENV PATH $PATH:/opt/xtensa-lx106-elf/bin

# --- ESP32 ENV ---
COPY ./xtensa-esp32-elf /opt/xtensa-esp32-elf
ENV PATH $PATH:/opt/xtensa-esp32-elf/bin

# -- A9x ENV --
COPY ./GPRS_CSDTK /opt/GPRS_CSDTK
ENV GPRS_PROJ_ROOT /home
ENV PATH $PATH:/opt/GPRS_CSDTK/CSDTK/bin:/opt/GPRS_CSDTK/CSDTK/mingw32/usr/bin:/opt/GPRS_CSDTK/CSDTK/mips-rda-elf/bin:/opt/GPRS_CSDTK/CSDTK/rv32-elf/bin:/opt/GPRS_CSDTK/CSDTK/cooltools
ENV LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:/opt/GPRS_CSDTK/CSDTK/lib:/opt/GPRS_CSDTK/CSDTK/mingw32/usr/lib
# alias work='source /opt/GPRS_CSDTK/CSDTK/cygenv.sh'
# export GPRS_PROJ_ROOT=/home
# export PATH=$PATH:/opt/GPRS_CSDTK/CSDTK/bin:/opt/GPRS_CSDTK/CSDTK/mingw32/usr/bin:/opt/GPRS_CSDTK/CSDTK/mips-rda-elf/bin:/opt/GPRS_CSDTK/CSDTK/rv32-elf/bin
# export PATH=$PATH:/opt/GPRS_CSDTK/CSDTK/cooltools
# export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/GPRS_CSDTK/CSDTK/lib:/opt/GPRS_CSDTK/CSDTK/mingw32/usr/lib

ENTRYPOINT ["/bin/bash"]

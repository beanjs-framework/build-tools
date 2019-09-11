FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y \
    build-essential git python python-pip \
    lib32z1 lib32ncurses5
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


ENTRYPOINT ["/bin/bash"]

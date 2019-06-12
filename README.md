# dev-env

## ENV
* gcc-arm-none-eabi-4.9.3(for w600 chip)
* xtensa-esp32-elf
* xtensa-lx106-elf

## SUPPORTED

* STM32
* nRF
* ESP8266
* ESP32
* Linux
* W600

## USAGE


```bash

docker pull beanjs/dev-env:tagname

docker run -it -v <path to espruino>:/home/beanjs --name beanjs-envd -p 2323:2323 -d  beanjs/dev-env:tagname

```
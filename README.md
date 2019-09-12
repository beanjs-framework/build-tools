# dev-env

## ENV
* gcc-arm-none-eabi-4.9.3(for w600 chip)
* xtensa-esp32-elf
* xtensa-lx106-elf
* GPRS_CSDTK

## SUPPORTED

* STM32
* nRF
* ESP8266
* ESP32
* Linux
* W600
* A9x

## USAGE


```bash

docker pull beanjs/hw-build-env

docker run -it -v <path to espruino>:/home --name build-envd -p 2323:2323 -d  beanjs/hw-build-env

```
Kicer's STM32 Project
=====================

-----
Usage
-----

Use `$ make PROJECT=<app>` to make `<app>` project.
All project directory locate in `/workspace/src/<app>/`.
There is some macros can pass to make:

- DEVICE: device type

- OSC: osc value

- CFLAGS: CC flags

- LDFLAGS: ld flags

- CROSS: cross-toolchain prefix

`$ make PROJECT=<app> clean` to clean project object files.

`$ make distclean` to clean stm32 library object files.

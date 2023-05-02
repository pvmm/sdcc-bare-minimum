# sdcc-bare-minimum
Bare minimum MSX-DOS project

Bare minimum needed to create a .COM application on MSX-DOS. It will scan all the C and ASM source files in the directory, compile and link them.

## Included files

- [Konami Man](https://konamiman.com/msx/msx-e.html#sdcc)'s `printf`;
- `uitoa` and `itoa` functions;
- [Fusion-C](https://github.com/ericb59/Fusion-C-v1.2)'s __putchar_msxdos.s__;

## TODO

- Include `ultoa_10`, `ltoa_10`, `ultoa_16` (hexadecimal);
- ~~Include `uitoa_16` (hexadecimal);~~

## Required

- [SDCC](https://sdcc.sourceforge.net/);
- [hex2bin](https://hex2bin.sourceforge.net/);

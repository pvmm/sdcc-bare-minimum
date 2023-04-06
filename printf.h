/*
   Simplified printf and sprintf for SDCC+Z80
   (c) 2018 Konamiman - www.konamiman.com

   This version is about 1.5K smaller than the one contained
   in the z80 library supplied with SDCC

   To compile:
   sdcc -mz80 -c --disable-warning 85 --disable-warning 196 --max-allocs-per-node 100000 --allow-unsafe-read --opt-code-size printf.c

   Supported format specifiers:

   %d or %i: signed int
   %u: unsigned int
   %x: hexadecimal int
   %c: character
   %s: string
   %%: a % character

   Also if SUPPORT_LONG is defined:

   %l: signed long
   %ul: unsigned long
   %lx: hexadecimal long
*/


#ifndef _PRINTF_H_
#define _PRINTF_H_

//#define SUPPORT_LONG

#include <stdint.h>
#include <stdarg.h>


int printf(const char *fmt, ...);
int sprintf(char* buf, const char* fmt, ...);


#endif // _PRINTF_H_

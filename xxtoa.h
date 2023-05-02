#ifndef _XXTOA_H_
#define _XXTOA_H_


#include <stdint.h>


//
// https://www.cemetech.net/forum/viewtopic.php?p=281436#281436
//

char* my_uitoa(uint16_t value, char* buffer, uint8_t base);
char* uitoa_b10(uint16_t value, char* buffer) __sdcccall(0);
char* uitoa_b16(uint16_t value, char* buffer) __sdcccall(0);

char* my_itoa(int16_t value, char* buffer, uint8_t base);
char* itoa_b10(int16_t value, char* buffer) __sdcccall(0);


#endif // _XXTOA_H_

#include <stdint.h>
#include "xxtoa.h"


char* my_uitoa(uint16_t value, char* buffer, uint8_t base)
{
    switch(base) {
    case 16:
        return uitoa_b16(value, buffer);
    default: case 10:
        return uitoa_b10(value, buffer);
    }
}


char* my_itoa(int16_t value, char* buffer, uint8_t base)
{
    switch(base) {
    case 16:
        return uitoa_b16(value, buffer);
    default: case 10:
        return itoa_b10(value, buffer);
    }
}

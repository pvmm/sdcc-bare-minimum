#include <stdint.h>
#include "printf.h"


uint8_t v[] = {
	0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8, 0x9,
};


void main(void)
{
	printf("first element: %i\r\n", v[0]);
	printf("second element: %i\r\n", v[1]);
}

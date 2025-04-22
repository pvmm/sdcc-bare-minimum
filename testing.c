#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "printf.h"


int function1(int a, int b)
{
	return a + b;
}
int function1_end_marker()
{
	return 0;
}

int function2(int a, int b)
{
	return a * b;
}
int function2_end_marker()
{
	return 0;
}

// function signature
typedef int (*callback_t)(int, int);

// first available bank 3 position
static uint8_t* last_mem = 0xc000;

callback_t move_to_bank3(const callback_t function, uint16_t len, void* dest)
{
	memcpy((uint8_t*) dest, (const uint8_t*) function, len);

	// save size and add it to last_mem
	callback_t old_last_mem = (callback_t)last_mem;
	last_mem += len;

	return old_last_mem;
}

int main()
{
	printf("Moving functions to bank 3...\r\n");

	int size1 = (void*)function1_end_marker - (void*)function1;
	callback_t new_function1 = move_to_bank3(function1, size1, last_mem);

	int size2 = (void*)function2_end_marker - (void*)function2;
	callback_t new_function2 = move_to_bank3(function2, size2, last_mem);

	// calling function copies from bank 3
	printf("function1(2, 3) result: %i\r\n", new_function1(2, 3));
	printf("function2(3, 4) result: %i\r\n", new_function2(3, 4));
}

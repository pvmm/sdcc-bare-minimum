#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "printf.h"


int function_to_move(int a, int b)
{
	return a + b;
}
int function_end_marker()
{
	return 0;
}

// function signature
typedef int (*callback_t)(int, int);
// first available bank 3 position
static uint8_t* last_mem = 0xc000;
callback_t move_to_high_mem(const callback_t function, uint16_t len, void* dest)
{
	memcpy((uint8_t*) dest, (const uint8_t*) function, len);

	// save size and add it to last_mem
	callback_t old_last_mem = (callback_t)last_mem;
	last_mem += len;

	return old_last_mem;
}

int main()
{
	int size = (void*)function_end_marker - (void*)function_to_move;
	callback_t new_function = move_to_high_mem(function_to_move, size, last_mem);
	// call function copy from bank 3
	return new_function(2, 3);
}

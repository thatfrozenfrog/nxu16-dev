#include "base.h"
//#include <stdio.h>
#include <string.h>
#include "FastRender.h"



int main() {
    for (word i = 0; i < 0x800; i++) // Clear the screen
    {
        *((word *)(0xF800 + i)) = 0x00;
    }
    for (word i = 0; i < 0x1f00; i++) // Clear the memory
    {
        *((word *)(0xD000 + i)) = 0x00;
    }
    while(1)
    {
        FastRender(0xD800);
    }
}
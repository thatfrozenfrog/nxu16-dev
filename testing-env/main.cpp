#include "classwiz_bsp.h"
#include "libc.h"

extern "C" {
#include "LCD/LCDPaint.h"
#include "LCD/stdint.h"
}




int main()
{
	memzero_n((void __near *)0x9000, ((ushort)0xef00 - (ushort)0x9000));
	reset_sfrs();
	delay(1600);
	FCON = 0x81;
	reset_screen_sfrs();
	memzero_n((void __near *)0xDDD4, 0x600 * 2);
	render_copy();

	LCD_BufferClear();
	LCD_BufferDrawLine(0, 0, 63, 31, 1);
	render_copy();
	__asm("brk");
}
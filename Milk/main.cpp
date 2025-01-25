//#include "classwiz_bsp.h"

#include "classwiz_bsp.h"
#include "menu.h"
#include "key/matrixkeygpto1.h"
#include "cwx_asm.h"
#include "textbox.h"
#include "libc.h"
#include "LCD/LCDPaint.h"
#include "LCD/LCDConfig.h"
#include "LCD/LCDAdvanced.h"
#define PI 3
typedef short int16_t;
#define double float
/*
void set_pixel(byte x, byte y)
{
	*(byte __near *)(0xf800 + (ushort)y * 0x20 + (x / 8)) |= 0x80 >> (x & 7);
}




void plot_line (int x0, int y0, int x1, int y1)
{
  int dx =  abs (x1 - x0), sx = x0 < x1 ? 1 : -1;
  int dy = -abs (y1 - y0), sy = y0 < y1 ? 1 : -1;
  int err = dx + dy, e2;

  for (;;){
    set_pixel (x0,y0);
    if (x0 == x1 && y0 == y1) break;
    e2 = 2 * err;
    if (e2 >= dy) { err += dy; x0 += sx; }
    if (e2 <= dx) { err += dx; y0 += sy; }
  }
}*/




	/*
	for (int i = 0; i < 192; i++)
	{
		//set_pixel(i, cosf((i - 96) / 10.0f) * 12.0f + 24.0f);
		//plot_line(0x00,0x00,cosf((i - 96) / 10.0f) * 12.0f + 24.0f,sinf((i - 96) / 10.0f) * 12.0f + 24.0f);
		memzero_n((void __near *)GetScreenBuffer(), 0x600 * 2);
		line_print("Hello world", i, cosf((i - 96) / 10.0f) * 12.0f + 24.0f);
		delay(100);
	}*/



int main(void)
{
    memzero_n((void __near *)0x9000, ((ushort)0xef00 - (ushort)0x9000));
	
	reset_sfrs();
	delay(1600);
	FCON = 0x81;
	reset_screen_sfrs();
	memzero_n((void __near *)GetScreenBuffer(), 0x600 * 2);
	//line_print("Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. ", 0, 0x10);
	//wait_keycode();
	//Textbox_get(0x10, 0x10);
	//LCD_Rect(0x10, 0x10, 15, 20, 0x01, LCD_DRAW_SET);
	LCD_Frame(0x10, 0x10, 0x20, 0x20, 0x05, 0x01, LCD_DRAW_XOR);
	return 0;

}


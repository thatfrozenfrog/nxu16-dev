//#include "classwiz_bsp.h"

#include "classwiz_bsp.h"
#include "menu.h"
#define PI 3
typedef short int16_t;
#define double float

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
}




	/*
	for (int i = 0; i < 192; i++)
	{
		//set_pixel(i, cosf((i - 96) / 10.0f) * 12.0f + 24.0f);
		//plot_line(0x00,0x00,cosf((i - 96) / 10.0f) * 12.0f + 24.0f,sinf((i - 96) / 10.0f) * 12.0f + 24.0f);
		memzero_n((void __near *)GetScreenBuffer(), 0x600 * 2);
		line_print_f("Hello world", i, cosf((i - 96) / 10.0f) * 12.0f + 24.0f);
		delay(100);
	}*/



enum BUTTON
{
	B_0 = 0xb,
	B_1 = 0x3f,
	B_2 = 0x37,
	B_3 = 0x2f,
	B_4 = 0x3e,
	B_5 = 0x36,
	B_6 = 0x2e,
	B_7 = 0x3d,
	B_8 = 0x35,
	B_9 = 0x2d,

	SP_UP = 0x28,
	SP_DOWN = 0x21,
	SP_LEFT = 0x29,
	SP_RIGHT = 0x20,
	SP_PLUS = 0x27,
	SP_MINUS = 0x1F,
    SP_MUL = 0x26,
    SP_DIV = 0x1E,
    SP_OPTN = 0x39,
    SP_CALC = 0x31,
	SP_EQU = 0x0F
};

byte lastbutton = 0xff;
byte CheckButtons()
{
	byte x;
	byte y;
	byte i = 0;
	for(x = 0x80; x != 0; x = x >> 1)
	{
		val(0xf046) = x;
		for(y = 0x80; y != 0; y = y >> 1)
		{
			if((val(0xf040) & y) == 0)
			{
				if(i != lastbutton)
				{
					lastbutton = i;
					return i;
				}
				return 0xff;
			}
			++i;
		}
	}
	lastbutton = 0x50;
	return 0xff;
}


int main() {
    memzero_n((void __near *)0x9000, ((ushort)0xef00 - (ushort)0x9000));
	reset_sfrs();
	delay(1600);
	FCON = 0x81;
	reset_screen_sfrs();
	memzero_n((void __near *)GetScreenBuffer(), 0x600 * 2);
	render_copy();
	while (1){
		val(0xD180) = CheckButtons();
	}
}

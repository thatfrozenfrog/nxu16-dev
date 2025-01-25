#include "libc.h"
#include "classwiz_bsp.h"
#include "key/matrixkeygpto1.h"
#include "menu.h"
#include "cwx_asm.h"
#include "LCD/LCDAdvanced.h"
/*
class MenuItem
{
public:
    ushort op;
    const char *string;
};*/

ushort show_menu(const MenuItem *pmenuitems, byte count)
{
    byte ind = 0;
    byte start = 0;
    while (1)
    {
        memzero_n((void __near *)GetScreenBuffer(), 0x7FF);
        for (byte i = 0; i < 8; i++)
        {
            byte j = i + start;
            if (j > count)
                break;
            auto y = i * 8 + 1;
            if (pmenuitems[j].op != 0)
            {
                draw_glyph(1, y, i + '0' + 1);
                draw_glyph(7, y, ':');
                line_print(pmenuitems[j].string, 20, y);
                //typewrite(pmenuitems[j].string, 20, y, 4000);
            }
            else
            {
                line_print(pmenuitems[j].string, 0, y);
                //typewrite(pmenuitems[j].string, 0, y, 500);
            }

            if (ind == j)
            {
                //if (pmenuitems[j].op == 0)
                    //Color = 1;
                rect_line(y, 8);
                auto sel = pmenuitems[j].op;
                auto selidx = 0;
                while(pmenuitems[j + selidx+1].op == sel)
                {
                    
                    selidx++;
                    rect_line(y + selidx * 8, 8);
                }
            }
        }
        if (count > 8)
        {
            LCD_Rect(189, (63 * ind / count), 2, 63 / (count - 8) + 1);

        }
        //render_copy();
        //render_ddd4(0xDDD4);
        auto kv = wait_keycode();
        ushort sel;
        //auto kv = wait_key();
        switch (kv)
        {
        
        case 0x0480:

            sel = pmenuitems[ind].op;
            while (pmenuitems[ind].op == sel && ind > 0)
            {
                ind--;
            }
            break; // Up
        case 0x0840:
            sel = pmenuitems[ind].op;
            while (pmenuitems[ind].op == sel && ind < count - 1)
            {
                ind++;
            }
            break; // Down
        
        case 0x4001:
            if (pmenuitems[ind].op != 0)
                return pmenuitems[ind].op;
            break; // Equ
        case 0x0440:
            if (ind > 3)
                ind -= 4;
            else
                ind = 0;
            break; // Left
        case 0x0880:
            if (ind < (count - 4))
            {
                ind += 4;
                start = ind;
            }
            else
                ind = count;
            break; // Right
        case 0x0101:  // 1
            if (start <= count && pmenuitems[start].op != 0)
                return pmenuitems[start].op;
            break;
        case 0x0201: // 2
            if (start + 1 <= count && pmenuitems[start + 1].op != 0)
                return pmenuitems[start + 1].op;
            break;
        case 0x0401: // 3
            if (start + 2 <= count && pmenuitems[start + 2].op != 0)
                return pmenuitems[start + 2].op;
            break;
        case 0x0801: // 4
            if (start + 3 <= count && pmenuitems[start + 3].op != 0)
                return pmenuitems[start + 3].op;
            break;

        case 0x8000:
            break; // no button
        }
        if (ind < start)
        {
            start = ind;
        }
        if (ind >= start + 8)
        {
            start = ind - 2;
        }
    }
}
/*
int main() {
    memzero_n((void __near *)0x9000, ((ushort)0xef00 - (ushort)0x9000));
	reset_sfrs();
	delay(1600);
	FCON = 0x81;
	reset_screen_sfrs();
	memzero_n((void __near *)GetScreenBuffer(), 0x600 * 2);
	render_copy();
    
    show_menu(test_menu, sizeof(test_menu));
}
*/
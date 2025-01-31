#include "libc.h"
#include "classwiz_bsp.h"
#include "menu.h"
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
        memzero_n((void __near *)GetScreenBuffer(), 0x600 * 2);
        if (count > 4)
        {
            rect(189, (63 * start / count), 2, 63 / (count - 4));
        }
        for (byte i = 0; i < 4; i++)
        {
            byte j = i + start;
            if (j > count)
                break;
            auto y = i * 16 + 1;
            Color = 3;
            if (pmenuitems[j].op != 0)
            {
                draw_glyph(1, y, i + 0x21);
                draw_glyph(7, y, ':' - 0x10);
                line_print_f(pmenuitems[j].string, 20, y);
            }
            else
            {
                line_print_f(pmenuitems[j].string, 0, y);
            }

            if (ind == j)
            {
                if (pmenuitems[j].op == 0)
                    Color = 1;
                rect_line(y, 15);
            }
        }
        render_copy();
        auto kv = wait_kiko();

        switch (*(ushort *)(&kv))
        {
        case 0x0880:
            if (ind > 0)
                ind--;
            break; // 上
        case 0x0820:
            if (ind < count)
                ind++;
            break; // 下
        case 0x0440:
            break; // 左
        case 0x1040:
            break; // 右
        case 0x0840:
        case 0x4001:
            if (pmenuitems[ind].op != 0)
                return pmenuitems[ind].op;
            break; // Exe
        case 0x2080:
            if (ind > 3)
                ind -= 4;
            else
                ind = 0;
            break; // PgUp
        case 0x2040:
            if (ind < (count - 4))
            {
                ind += 4;
                start = ind;
            }
            else
                ind = count;
            break; // PgDn
        case 257:  // 1
            if (start <= count && pmenuitems[start].op != 0)
                return pmenuitems[start].op;
            break;
        case 513: // 2
            if (start + 1 <= count && pmenuitems[start + 1].op != 0)
                return pmenuitems[start + 1].op;
            break;
        case 1025: // 3
            if (start + 2 <= count && pmenuitems[start + 2].op != 0)
                return pmenuitems[start + 2].op;
            break;
        case 258: // 4
            if (start + 3 <= count && pmenuitems[start + 3].op != 0)
                return pmenuitems[start + 3].op;
            break;
        }
        if (ind < start)
        {
            start = ind;
        }
        if (ind >= start + 4)
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
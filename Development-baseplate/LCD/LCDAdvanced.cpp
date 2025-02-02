#include "LCDConfig.h"
#include "LCDPaint.h"
#include "libc.h"

void LCD_Rect(LCD_pos_t x, LCD_pos_t y, LCD_pos_t w, LCD_pos_t h, LCD_color_t c, const LCD_draw_method_t drawMethod) {
    if( w == 0 || h == 0 ) {
        return;
    }
    for (byte i = 0; i < h; ++i) {
        LCD_BufferHLine(x, y + i, x + w - 1, c, drawMethod);
    }
}

void LCD_Frame(byte x1, byte y1, byte x2, byte y2, byte thick, LCD_color_t c, const LCD_draw_method_t drawMethod) {
    // Left frame
    LCD_Rect(x1, y1 + thick, thick, y2 - y1 - 2 * thick, c, drawMethod);
    // Right frame
    LCD_Rect(x2 - thick, y1 + thick, thick, y2 - y1 - 2 * thick, c, drawMethod);
    // Top frame
    LCD_Rect(x1, y1, x2 - x1, thick, c, drawMethod);
    // Bottom frame
    LCD_Rect(x1, y2 - thick, x2 - x1, thick, c, drawMethod);
}
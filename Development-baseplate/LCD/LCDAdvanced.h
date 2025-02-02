#include "LCDConfig.h"
#include "LCDPaint.h"
#include "libc.h"

/* @brief Sets a pixel in buffer
 * @param x: column number
 * @param y: row number
 * @param w: width
 * @param h: height
 * @param c: color
 * @param drawMethod drawing method
 */
void LCD_Rect(LCD_pos_t x, LCD_pos_t y, LCD_pos_t w, LCD_pos_t h, LCD_color_t c = 1, const LCD_draw_method_t drawMethod = LCD_DRAW_SET);

/* @brief Draws a frame
 * @param x1: column number of the left frame
 * @param y1: row number of the left frame
 * @param x2: column number of the right frame
 * @param y2: row number of the right frame
 * @param thick: thickness of the frame
 * @param c: color
 * @param drawMethod drawing method
 */
void LCD_Frame(byte x1, byte y1, byte x2, byte y2, byte thick, LCD_color_t c = 1, const LCD_draw_method_t drawMethod = LCD_DRAW_SET);
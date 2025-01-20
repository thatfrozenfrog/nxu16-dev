#ifndef LCDPAINT_H_INCLUDED
#define LCDPAINT_H_INCLUDED


#include "stdint.h"
#include "LCDConfig.h"


//extern uint8_t LCDBuffer[LCD_BUFFER_SIZE];


/* @brief Sets a pixel in buffer
 * @param x: column number
 * @param y: row number
 * @param c: color
 */
void LCD_BufferSetPix(LCD_pos_t x, LCD_pos_t y, LCD_color_t c);

/* @brief Gets a pixel in buffer
 * @param x: column number
 * @param y: row number
 * @retval color of the selected pixel
 */
LCD_color_t LCD_BufferGetPix(LCD_pos_t x, LCD_pos_t y);

/* @brief Clears LCD buffer
 * @note calls `memset`
 */
void LCD_BufferClear(void);

/// @brief Draws a horizontal line from (x0, y) to (x1, y)
/// @param x0 starting X coordinate
/// @param y Y coordinate
/// @param x1 ending X coordinate
/// @param c color
/// @param drawMethod drawing method
void LCD_BufferHLine(LCD_pos_t x0, LCD_pos_t y, LCD_pos_t x1, LCD_color_t c, const LCD_draw_method_t drawMethod);

/// @brief Draws a vertical line from (x, y0) to (x, y1)
/// @param x starting X coordinate
/// @param y0 Y coordinate
/// @param y1 ending X coordinate
/// @param c color
/// @param drawMethod drawing method
void LCD_BufferVLine(LCD_pos_t x, LCD_pos_t y0, LCD_pos_t y1, LCD_color_t c, const LCD_draw_method_t drawMethod);

/// @brief Draws a line in the buffer, using Bresenham's line algorithm
/// @param x0 X coordinate of point 1
/// @param y0 Y coordinate of point 1
/// @param x1 X coordinate of point 2
/// @param y1 Y coordinate of point 2
/// @param c color of the line
void LCD_BufferDrawLine(LCD_pos_t x0, LCD_pos_t y0, LCD_pos_t x1, LCD_pos_t y1, LCD_color_t c/*, const LCD_draw_method_t drawMethod*/);

/*
typedef struct {
	LCD_pos_t width;
	LCD_pos_t height;
	uint8_t *data;
} LCD_sprite_t;
*/

/// @brief Draws a sprite of size (`width`, `height`) at position `(x, y)`
/// @param x X coordinate of upper left corner
/// @param y Y coordinate of upper left corner
/// @param width width of sprite, in pixel
/// @param height height of sprite, in pixel
/// @param sprite pointer to sprite data (lower bitplane comes first)
/// @param drawMethod logic to draw the sprite
void LCD_BufferPutSprite(LCD_pos_t x, LCD_pos_t y, LCD_pos_t width, LCD_pos_t height, const uint8_t *sprite, const LCD_draw_method_t drawMethod);

#endif

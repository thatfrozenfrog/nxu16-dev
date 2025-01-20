#ifndef LCDCONFIG_H_INCLUDED
#define LCDCONFIG_H_INCLUDED


#include "stdint.h"
// Include a panel header here
#define LCDBuffer ((volatile uint8_t*)0xDDD4)

// Or, set the parameters below
#ifndef LCD_PARAMETER_DEFINED

// --- LCD dimension setting
#define LCD_WIDTH 192
#define LCD_HEIGHT 63
#define LCD_BPP 1

// ---- data types
typedef uint8_t LCD_pos_t;
typedef uint8_t LCD_color_t;

#endif


// --- useful macros

#define LCD_BUFFER_WIDTH ((LCD_WIDTH + 7) / 8)
#define LCD_BUFFER_BITPLANE_SIZE (LCD_HEIGHT * LCD_BUFFER_WIDTH)
#define LCD_BUFFER_SIZE (LCD_BUFFER_BITPLANE_SIZE * LCD_BPP)


typedef enum {
	LCD_DRAW_SET,
	LCD_DRAW_INVERSE,
	LCD_DRAW_AND,
	LCD_DRAW_OR,
	LCD_DRAW_XOR
} LCD_draw_method_t;


#endif

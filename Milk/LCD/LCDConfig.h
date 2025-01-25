#ifndef LCDCONFIG_H_INCLUDED
#define LCDCONFIG_H_INCLUDED


#include "libc.h"
// Include a panel header here


// Or, set the parameters below
#ifndef LCD_PARAMETER_DEFINED

// --- LCD dimension setting
#define LCD_WIDTH 192
#define LCD_HEIGHT 63
#define LCD_BPP 1

// ---- data types
typedef byte LCD_pos_t;
typedef byte LCD_color_t;

#endif


// --- useful macros

#define LCD_BUFFER_WIDTH 32
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

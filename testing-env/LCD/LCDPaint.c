#include "stdint.h"
#include "string.h"

#include "LCDConfig.h"
#include "LCDPaint.h"


//uint8_t LCDBuffer[LCD_BUFFER_SIZE];


void LCD_BufferSetPix(LCD_pos_t x, LCD_pos_t y, LCD_color_t c) {
	uint8_t plane = 0, *byte = LCDBuffer + y * LCD_BUFFER_WIDTH + (x / 8);
	uint8_t mask = ~(0x80 >> (x % 8));

	do {
		*byte = ((*byte & mask) | ((c & 1) << (7 - (x % 8))));	// set bit in bitplane
		byte += LCD_BUFFER_BITPLANE_SIZE;	// move to next bitplane
		c >>= 1;	// next bit
	} while( ++plane < LCD_BPP );
}

LCD_color_t LCD_BufferGetPix(LCD_pos_t x, LCD_pos_t y) {
	uint8_t plane = 0, mask = ~(0x80 >> (x % 8));
	const uint8_t *byte = LCDBuffer + y * LCD_BUFFER_WIDTH + (x / 8);
	LCD_color_t c = 0;

	do {
		c |= (((*byte & mask) ? 1 : 0) << plane);	// read bit
		byte += LCD_BUFFER_BITPLANE_SIZE;	// move to next bitplane
	} while( ++plane < LCD_BPP );

	return c;
}

void LCD_BufferHLine(LCD_pos_t x0, LCD_pos_t y, LCD_pos_t x1, LCD_color_t c, const LCD_draw_method_t drawMethod) {
	uint8_t plane = 0;
	uint8_t *buffer, data;
	LCD_pos_t PIXEL_COUNT, pixelCount;
	uint8_t LEFT_PIXEL, RIGHT_PIXEL;
	uint8_t LEFT_MASK, RIGHT_MASK;	// OR-ed to buffer

	if( x0 > x1 ) {
		LCD_pos_t temp = x0;
		x0 = x1; x1 = temp;
	}

// calculate (constant) parameters
	// pixel count
	PIXEL_COUNT = x1 - x0 + 1;
	// left mask & pixel
	if( (x0 & 7) != 0 ) {
		// left side needs special care
		if( (x1 & ~7) == (x0 & ~7) ) {	// mask out lower 3 bits, to see if they're in the same byte
			// both ends are in the same byte
			LEFT_PIXEL = PIXEL_COUNT;
			LEFT_MASK = 0xFF << (8 - PIXEL_COUNT);
			LEFT_MASK >>= (x0 & 7);
		}
		else {
			// the line starts in one byte and ends in another
			LEFT_PIXEL = 8 - (x0 & 7);
			LEFT_MASK = 0xFF >> (x0 & 7);
		}
	}
	else {
		LEFT_PIXEL = 0;
		LEFT_MASK = 0;
	}
	// right mask & pixel
	RIGHT_PIXEL = (x1 + 1) & 7;
	RIGHT_MASK = 0xFF << (8 - RIGHT_PIXEL);

// actual drawing
	for( ; plane < LCD_BPP; ++plane ) {
		buffer = LCDBuffer + y * LCD_BUFFER_WIDTH + plane * LCD_BUFFER_BITPLANE_SIZE + (x0 >> 3);
		pixelCount = PIXEL_COUNT;

		if( LEFT_PIXEL != 0 ) {
			// left pixels

			data = *buffer;

			switch( drawMethod ) {
				case LCD_DRAW_SET:
					data &= ~LEFT_MASK;
				case LCD_DRAW_OR:
					if( c & 1 )
						data |= LEFT_MASK;
					break;
				case LCD_DRAW_INVERSE:
					if( !(c & 1) )
						data |= LEFT_MASK;
					else
						data &= ~LEFT_MASK;
					break;
				case LCD_DRAW_AND:
					if( !(c & 1) )
						data &= ~LEFT_MASK;
					break;
				case LCD_DRAW_XOR:
					if( c & 1 )
						data ^= LEFT_MASK;
					break;
			}

			*buffer++ = data;
			pixelCount -= LEFT_PIXEL;
			if( pixelCount == 0 )
				continue;
		}

		// middle pixels
		data = (c & 1)? 0xFF : 0;
		if( drawMethod == LCD_DRAW_INVERSE ) {
			data ^= 0xFF;
		}
		while( pixelCount >= 8 ) {
			switch( drawMethod ) {
				case LCD_DRAW_SET:
				case LCD_DRAW_OR:
				case LCD_DRAW_INVERSE:
					*buffer = data;
					break;
				case LCD_DRAW_AND:
					*buffer &= data;
					break;
				case LCD_DRAW_XOR:
					*buffer ^= data;
					break;
			}

			++buffer;
			pixelCount -= 8;
		}

		if( pixelCount != 0 ) {
			// right pixels

			data = *buffer;

			switch( drawMethod ) {
				case LCD_DRAW_SET:
					data &= ~RIGHT_MASK;
				case LCD_DRAW_OR:
					if( c & 1 )
						data |= RIGHT_MASK;
					break;
				case LCD_DRAW_INVERSE:
					if( !(c & 1) )
						data |= RIGHT_MASK;
					else
						data &= ~RIGHT_MASK;
					break;
				case LCD_DRAW_AND:
					if( !(c & 1) )
						data &= ~RIGHT_MASK;
					break;
				case LCD_DRAW_XOR:
					if( c & 1 )
						data ^= RIGHT_MASK;
					break;
			}

			*buffer = data;
		}
		c >>= 1;
	}
}

void LCD_BufferVLine(LCD_pos_t x, LCD_pos_t y0, LCD_pos_t y1, LCD_color_t c, const LCD_draw_method_t drawMethod) {
	uint8_t plane = 0;
	uint8_t *buffer, data;
	LCD_pos_t PIXEL_COUNT, pixelCount;
	uint8_t MASK;	// OR-ed to buffer

	if( y0 > y1 ) {
		LCD_pos_t temp = y0;
		y0 = y1; y1 = temp;
	}

// calculate (constant) parameters
	PIXEL_COUNT = y1 - y0 + 1;
	MASK = 0x80 >> (x & 7);

// actual drawing
	for( ; plane < LCD_BPP; ++plane ) {
		buffer = LCDBuffer + y0 * LCD_BUFFER_WIDTH + plane * LCD_BUFFER_BITPLANE_SIZE + (x >> 3);
		pixelCount = PIXEL_COUNT;

		while( pixelCount > 0 ) {

			data = *buffer;

			switch( drawMethod ) {
				case LCD_DRAW_SET:
					data &= ~MASK;
				case LCD_DRAW_OR:
					if( c & 1 )
						data |= MASK;
					break;
				case LCD_DRAW_INVERSE:
					if( !(c & 1) )
						data |= MASK;
					else
						data &= ~MASK;
					break;
				case LCD_DRAW_AND:
					if( !(c & 1) )
						data &= ~MASK;
					break;
				case LCD_DRAW_XOR:
					if( c & 1 )
						data ^= MASK;
					break;
			}

			*buffer = data;
			buffer += LCD_BUFFER_WIDTH;
			--pixelCount;
		}
	}
	c >>= 1;
}

void LCD_BufferDrawLine(LCD_pos_t x0, LCD_pos_t y0, LCD_pos_t x1, LCD_pos_t y1, LCD_color_t c/*, const LCD_draw_method_t drawMethod*/) {
	LCD_pos_t curX, curY;
	int16_t dx = x1 - x0, dy = y1 - y0;
	int16_t error, deltaCoord = 1, swapXY = 0;

// a utility macro
	LCD_pos_t temp;
#define _swap(a, b) {temp = a; a = b; b = temp;};

	// eliminate negative dx
	if( dx < 0 ) {
		dx = -dx; dy = -dy;
		_swap(x0, x1); _swap(y0, y1);
	}

// here x1 > x0, so we exit early
	if( !dy ) {
		// horizontal line
		for( curX = x0; curX <= x1; ++curX ) {
			LCD_BufferSetPix(curX, y0, c);
		}
		return;
	}

	if( !dx ) {
		// vertical line
		if( dy < 0 ) {
			_swap(y0, y1);
		}
		for( curY = y0; curY <= y1; ++curY ) {
			LCD_BufferSetPix(x0, curY, c);
		}
		return;
	}

	// eliminate negative dy
	if( dy < 0 ) {
		deltaCoord = -1;
		dy = -dy;
	}

	// swap X and Y if slope > 1
	if( dy > dx ) {
		swapXY = 1;
		_swap(dx, dy);
		_swap(x0, y0); _swap(x1, y1);
	}

	// eliminate negative dx *again*
	// to make sure the drawing loop runs fine
	if( x0 > x1 ) {
		_swap(x0, x1); _swap(y0, y1);
	}

	curX = x0, curY = y0;
	error = -dx;

	// actual drawing loop
	while( curX <= x1 ) {
		if( !swapXY ) {
			LCD_BufferSetPix(curX, curY, c);
		}
		else {
			LCD_BufferSetPix(curY, curX, c);
		}
		++curX;
		error += (dy << 1);
		if( error > 0 ) {
			curY += deltaCoord;
			error -= (dx << 1);
		}
	}
}

void LCD_BufferPutSprite(LCD_pos_t x, LCD_pos_t y, LCD_pos_t width, LCD_pos_t height, const uint8_t *sprite, const LCD_draw_method_t drawMethod) {
	uint8_t plane = 0;
	LCD_pos_t pixelCount, curRow;
	uint8_t *buffer, *planeBase, bufferData, spriteShifter;
	uint16_t spriteData = 0;
	uint8_t LEFT_PIXEL, RIGHT_PIXEL;
	uint8_t LEFT_MASK, RIGHT_MASK;	// modified bits are 1
	uint8_t BIT_OFFSET = x & 7;

// calculate (constant) parameters
	// left mask & pixel
	if( (BIT_OFFSET + width) <= 8 ) {
		// both ends are in the same byte
		LEFT_PIXEL = width;
		LEFT_MASK = 0xFF << (8 - width);
		LEFT_MASK >>= BIT_OFFSET;
	}
	else if( BIT_OFFSET != 0 ) {
		// the line starts in one byte and ends in another
		LEFT_PIXEL = 8 - BIT_OFFSET;
		LEFT_MASK = 0xFF >> BIT_OFFSET;
	}
	else {
		LEFT_PIXEL = 0;
		LEFT_MASK = 0;
	}
	// right mask & pixel
	RIGHT_PIXEL = (x + width) & 7;
	RIGHT_MASK = 0xFF << (8 - RIGHT_PIXEL);

// actual drawing
	for( ; plane < LCD_BPP; ++plane ) {	// bitplane
		planeBase = LCDBuffer + y * LCD_BUFFER_WIDTH + plane * LCD_BUFFER_BITPLANE_SIZE + (x >> 3);

		for( curRow = 0; curRow < height; ++curRow ) {	// rows
			buffer = planeBase + curRow * LCD_BUFFER_WIDTH;
			pixelCount = width;

			if( (LEFT_PIXEL != 0) || ((LEFT_PIXEL == 0) && (width < 8)) ) {
				// left pixels

				spriteData = *sprite++;
				bufferData = *buffer;

				spriteShifter = (uint8_t)(spriteData >> BIT_OFFSET);

				switch( drawMethod ) {
					case LCD_DRAW_INVERSE:
						spriteShifter ^= 0xFF;
					case LCD_DRAW_SET:
						bufferData &= ~LEFT_MASK;	// keep unaffected area only
					case LCD_DRAW_OR:
						bufferData |= spriteShifter & LEFT_MASK;
						break;
					case LCD_DRAW_AND:
						bufferData &= spriteShifter | ~LEFT_MASK;
						break;
					case LCD_DRAW_XOR:
						bufferData ^= spriteShifter & LEFT_MASK;
						break;
				}

				*buffer++ = bufferData;
				pixelCount -= LEFT_PIXEL;
				if( pixelCount == 0 )
					continue;
				spriteData <<= 8;	// leave space for next byte
			}

			// middle pixels
			while( pixelCount >= 8 ) {
				spriteData |= *sprite++;
				bufferData = *buffer;

				spriteShifter = (uint8_t)(spriteData >> BIT_OFFSET);

				switch( drawMethod ) {
					case LCD_DRAW_SET:
						bufferData = spriteShifter;
						break;
					case LCD_DRAW_OR:
						bufferData |= spriteShifter;
						break;
					case LCD_DRAW_INVERSE:
						bufferData = ~spriteShifter;
						break;
					case LCD_DRAW_AND:
						bufferData &= spriteShifter;
						break;
					case LCD_DRAW_XOR:
						bufferData ^= spriteShifter;
						break;
				}

				*buffer++ = bufferData;
				pixelCount -= 8;
				spriteData <<= 8;
			}

			if( pixelCount != 0 ) {
				// right pixels

				// only fetch new byte when there're more pixels to fill in
				if( pixelCount < RIGHT_PIXEL ) {
					spriteData |= *sprite++;
				}
				bufferData = *buffer;

				spriteShifter = (uint8_t)(spriteData >> BIT_OFFSET);

				switch( drawMethod ) {
					case LCD_DRAW_INVERSE:
						spriteShifter ^= 0xFF;
					case LCD_DRAW_SET:
						bufferData &= ~RIGHT_MASK;	// keep unaffected area only
					case LCD_DRAW_OR:
						bufferData |= spriteShifter & RIGHT_MASK;
						break;
					case LCD_DRAW_AND:
						bufferData &= spriteShifter | ~RIGHT_MASK;
						break;
					case LCD_DRAW_XOR:
						bufferData ^= spriteShifter & RIGHT_MASK;
						break;
				}

				*buffer = bufferData;
			}
		}
	}
}

inline void LCD_BufferClear(void) {
	memset(LCDBuffer, 0, LCD_BUFFER_SIZE);
}

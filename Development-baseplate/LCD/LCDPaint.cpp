#include "LCDConfig.h"
#include "LCDPaint.h"
#include "libc.h"





void LCD_BufferSetPix(LCD_pos_t x, LCD_pos_t y, LCD_color_t c) {
	byte *getbyte = LCDBuffer + y * LCD_BUFFER_WIDTH + (x / 8);
	byte mask = 0x80 >> (x & 7);

	if (c) {
		*getbyte |= mask;  // set bit
	} else {
		*getbyte &= ~mask;  // clear bit
	}
}

LCD_color_t LCD_BufferGetPix(LCD_pos_t x, LCD_pos_t y) {
	byte plane = 0, mask = ~(0x80 >> (x % 8));
	const byte *getbyte = LCDBuffer + y * LCD_BUFFER_WIDTH + (x / 8);
	LCD_color_t c = 0;

	do {
		c |= (((*getbyte & mask) ? 1 : 0) << plane);	// read bit
		getbyte += LCD_BUFFER_BITPLANE_SIZE;	// move to next bitplane
	} while( ++plane < LCD_BPP );

	return c;
}

void LCD_BufferHLine(LCD_pos_t x0, LCD_pos_t y, LCD_pos_t x1, LCD_color_t c, const LCD_draw_method_t drawMethod) {
	byte plane = 0;
	byte *buffer, data;
	LCD_pos_t PIXEL_COUNT, pixelCount;
	byte LEFT_PIXEL, RIGHT_PIXEL;
	byte LEFT_MASK, RIGHT_MASK;	// OR-ed to buffer

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
	byte plane = 0;
	byte *buffer, data;
	LCD_pos_t PIXEL_COUNT, pixelCount;
	byte MASK;	// OR-ed to buffer

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
	
	short dx =  abs(x1 - x0), sx = x0 < x1 ? 1 : -1;
	short dy = -abs(y1 - y0), sy = y0 < y1 ? 1 : -1;
	short err = dx + dy, e2;

	for (;;){
		LCD_BufferSetPix(x0, y0, c);
		if (x0 == x1 && y0 == y1) break;
		e2 = 2 * err;
		if (e2 >= dy) { err += dy; x0 += sx; }
		if (e2 <= dx) { err += dx; y0 += sy; }
	}
}


void LCD_BufferPutSprite(LCD_pos_t x, LCD_pos_t y, LCD_pos_t width, LCD_pos_t height, const byte *sprite, const LCD_draw_method_t drawMethod) {
	byte plane = 0;
	LCD_pos_t pixelCount, curRow;
	byte *buffer, *planeBase, bufferData, spriteShifter;
	ushort spriteData = 0;
	byte LEFT_PIXEL, RIGHT_PIXEL;
	byte LEFT_MASK, RIGHT_MASK;	// modified bits are 1
	byte BIT_OFFSET = x & 7;

// calculate (constant) parameters
	// left mask & pixel
	if( (BIT_OFFSET + width) <= 8 ) {
		// both ends are in the same byte
		LEFT_PIXEL = width;
		LEFT_MASK = 0xFF << (8 - width);
		LEFT_MASK >>= BIT_OFFSET;
	}
	else if( BIT_OFFSET != 0 ) {
		// the sprite starts in one byte and ends in another
		LEFT_PIXEL = 8 - BIT_OFFSET;
		LEFT_MASK = 0xFF >> BIT_OFFSET;
	}
	else {
		// the sprite is aligned
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
			spriteData = 0;

			if( (LEFT_PIXEL != 0) || ((LEFT_PIXEL == 0) && (width < 8)) ) {
				// left pixels

				spriteData = *sprite++;
				bufferData = *buffer;

				spriteShifter = (byte)(spriteData >> BIT_OFFSET);

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

				spriteShifter = (byte)(spriteData >> BIT_OFFSET);

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
				if( (LEFT_PIXEL == 0) || ((8 - LEFT_PIXEL) < RIGHT_PIXEL) ) {
					spriteData |= *sprite++;
				}
				bufferData = *buffer;

				spriteShifter = (byte)(spriteData >> BIT_OFFSET);

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
#include "libc.h"
#include "printlib.h"
#include "classwiz_bsp.h"



void upscale_byte(byte input, const byte newWidth, byte* output) {
		
	byte base_scale = newWidth >> 3;
	byte remainder = newWidth & 7;
	byte destidx = 0;
	memzero_n((void __near *)output, 32);
	for (byte i = 0; i < 8; i++){
		byte count = base_scale + ((i < remainder) ? 1 : 0);
		for (byte j = 0; j < count; j++){
			output[destidx >> 3] |= ((input >> (7-i)) & 1) << (7-(destidx & 7));
			destidx++;
		}
	}
}


void draw_scaled_glyph(byte x, byte y, byte* chr, byte scale, byte scaleH) {
	byte output[32];
	byte base_scale = scaleH >> 3;
	byte remainder = scale & 7;
	auto buf = (byte __near *)0xF800;
	ushort base = y * 32 + (x >> 3);
	for (byte i = 0; i < 8; i++) {
		upscale_byte(chr[i], scale, output);
		byte scaleHeight = base_scale + ((i < remainder) ? 1 : 0);
		for (byte k = 0; k < scaleHeight; k++) {
			for (byte j = 0; j <= scale >> 3; j++){
				byte dat1 = output[j] >> (x & 7);
				byte dat2 = output[j] << (8 - (x & 7));
				buf[base + j] |= dat1;
				buf[base + j + 1] |= dat2;
			}
			base += 32;
		} 
	}
}



void scale_byte_width(byte input, byte scale, byte* output) 
{
    byte scale_factor = 1 << scale; 
    byte expanded = 0, expanded_next = 0;
    byte bit_pos = 8; // Keeps track of bit position in current byte
    byte out_index = 0;

    for (byte bit = 0; bit < 8; bit++) // Process each bit
    {
        byte block = (input & (0x80 >> bit)) ? (0xFF >> (8 - scale_factor)) : 0x00; // Expand bit
        
        // Store into expanded bytes
        expanded |= block << (bit_pos - scale_factor);
        if (bit_pos < scale_factor) // Overflow into next byte
            expanded_next |= block >> (scale_factor - bit_pos);

        bit_pos -= scale_factor;

        if (bit_pos <= 0 || bit == 7) // Store bytes when full
        {
            output[out_index++] = expanded;
            expanded = expanded_next;
            expanded_next = 0;
            bit_pos = 8;
        }
    }
}


void draw_glyph(byte x, byte y, byte chr, byte scale)
{
    const auto width = 8;
    const auto height = 8;

    auto buf = (byte __near *)GetScreenBuffer();
    auto bs = (byte *)font8x8 + (chr - 0x20) * height;
    byte scale_factor = 1 << scale; // 2^scale

    for (int j = 0; j < height; j++)
    {
        byte dat = bs[j];
        if (scale > 0)
        {
            byte output[32];  // Enough space for scaled width
            scale_byte_width(dat, scale, output);

            for (byte sy = 0; sy < scale_factor; sy++)  // Scale height
            {
                short base = (y + j * scale_factor + sy) * 32 + (x >> 3);
                for (byte i = 0; i < scale_factor; i++)  // Scale width
                {
                    byte dat1 = output[i] >> (x & 7);
                    byte dat2 = output[i] << (8 - (x & 7));
                    buf[base + i] |= dat1;
                    buf[base + i + 1] |= dat2;
                }
            }
            continue;
        }
        if ((x & 7) == 0)
        {
            buf[(j + y) * 32 + (x >> 3)] ^= dat;
        }
        else
        {
            byte dat1 = dat >> (x & 7);
            byte dat2 = dat << (8 - (x & 7));
            buf[(j + y) * 32 + (x >> 3)] ^= dat1;
            buf[(j + y) * 32 + (x >> 3) + 1] ^= dat2;
        }
    }
}

void line_print(const char *str, byte x, byte y, byte wrapleft, byte wrapright, byte spacing, byte line_spacing, ushort delay_ms, byte scaleFactor)
{
	while (1)
	{
		byte c = (byte) * (str++);
		if (!c)
			break;
		draw_glyph(x, y, c, scaleFactor);
		x += (8 + spacing) * (1 << scaleFactor);
		if (x > wrapright)
		{
			x = wrapleft;
			y += (8 + line_spacing) * (1 << scaleFactor);
		}
		if (delay_ms)
			delay(delay_ms);
	}
}

void custom_line_print(const char *str, byte x, byte y, byte scaleW, byte scaleH){
	while (1)
	{
		byte c = (byte) * (str++);
		if (!c)
			break;
		draw_scaled_glyph(x, y, (byte *)font8x8 + (c - 0x20) * 8, scaleW, scaleH);
		x += scaleW;
	}
}

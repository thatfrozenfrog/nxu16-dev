#include "classwiz_bsp.h"
#include "cwx_asm.h"
extern "C"
{
	static void a();
}
#pragma INTERRUPT a 8
#pragma INTERRUPT a 10
#pragma INTERRUPT a 12
#pragma INTERRUPT a 14
#pragma INTERRUPT a 16
#pragma INTERRUPT a 18
#pragma INTERRUPT a 20
#pragma INTERRUPT a 22
#pragma INTERRUPT a 24
#pragma INTERRUPT a 26
#pragma INTERRUPT a 28
#pragma INTERRUPT a 30
#pragma INTERRUPT a 32
#pragma INTERRUPT a 34
#pragma INTERRUPT a 36
#pragma INTERRUPT a 38
#pragma INTERRUPT a 40
#pragma INTERRUPT a 42
#pragma INTERRUPT a 44
#pragma INTERRUPT a 46
#pragma INTERRUPT a 48
#pragma INTERRUPT a 50
#pragma INTERRUPT a 52
#pragma INTERRUPT a 54
#pragma INTERRUPT a 56
#pragma INTERRUPT a 58
#pragma INTERRUPT a 60
extern "C"
{
	static void a() {}
}
void reset_timer()
{
	Timer0Counter = 0;
	Timer0Interval = 0x79e;
	Timer0Control = 0x1;
	InterruptPending_W0 = 0;
	__EI();
}

void delay(ushort after_ticks)
{
	if ((FCON & 2) != 0)
		FCON &= 0xfd;
	__DI();
	Timer0Interval = after_ticks;
	Timer0Counter = 0;
	Timer0Control = 0x0101;
	InterruptPending_W0 = 0;
	StopAcceptor = 0x50;
	StopAcceptor = 0xa0;
	StopControl = 2;
	__asm("nop");
	__asm("nop");
	__EI();
}
void reset_sfrs()
{
	FCON = 0x31;
	BlockControl = 0xf7;
	volatile int i = 0x32;
	while (i--)
	{
	}
	InterruptMask0 = 0x22;
	InterruptMask1 = 0;
	InterruptMask2 = 0;
	val(0xf058) = 0;
	KeyboardInMask = 0;
	ExternalInterruptControl = 0;
	ScreenPower = 7;
	delay(200);
	ScreenRange = 4;
	ScreenBrightness = 7; // 7
	ScreenInterval = 6;
	ScreenUnk1 = 0x17;
	ScreenUnk2 = 8;
	ScreenOffset = 0;
	ScreenMode = 0x17;
	ScreenContrast = 0x12;
	val(0xf220) = 0;
	val(0xf221) = 0x7f;
	val(0xf222) = 0;
	val(0xf223) = 0x7f;
	val(0xf224) = 0;
	val(0xf225) = 0;
	val(0xf048) = 0;
	val(0xf049) = 0;
	val(0xf04a) = 7;
	val(0xf04b) = 0;
	val(0xf04c) = 7;
	val(0xf04e) = 0;
	KeyboardInPullUp = 0;
	KeyboardOut = 0;
	KeyboardOutMask = 0;
}
void reset_screen_sfrs()
{
	ScreenRange = 4;
	ScreenBrightness = 3;
	ScreenInterval = 6;
	ScreenUnk1 = 0x17;
	ScreenUnk2 = 0x8;
	ScreenOffset = 0;
	ScreenMode = 0x15;
}


ushort get_keycode_cpp() {
	ushort keycode = 0;
	byte r1 = 0x01;
	byte r3 = 0x01;

	while (true) {
		val(0xF046) = r1;
		byte r0 = val(0xF040);
		val(0xF046) = 0x00;

		if (r0 != 0xFF) {
			keycode = (r1 << 8) | (r0 ^ 0xFF);
			break;
		}

		r1 <<= 1;
		r3++;
		if (r3 > 0x07) {
			keycode = 0x00;
			break;
		}
	}
	val(0xF046) = 0x00;
	return keycode;
}

ushort wait_keycode()
{
	ushort kv;
	do {
		kv = get_keycode_cpp();
	} while (kv == 0x0000);

	ushort initial_keycode = kv;

	do {
		kv = get_keycode_cpp();
	} while (kv == initial_keycode);

	return initial_keycode;
}

/*
void draw_glyph(byte x, byte y, byte chr)
{
    const auto width = 8;
    const auto height = 8;
    
    auto buf = (byte __near *)GetScreenBuffer();
    auto bs = (byte *)font8x8 + (chr-0x20) * height;

    for (int j = 0; j < height; j++)
    {
        byte dat = bs[j];
        if ((x & 7) == 0) {
            buf[(j + y) * 32 + (x >> 3)] ^= dat;
        }
        else {
            byte dat1 = dat >> (x & 7);
			byte dat2 = dat << (8 - (x & 7));
            buf[(j + y) * 32 + (x >> 3)] ^= dat1;
            buf[(j + y) * 32 + (x >> 3) + 1] ^= dat2;
       }
    }
} */

/*
void line_print_n(const char __near *str, byte x, byte y)
{
	while (1)
	{
		byte c = (byte) * (str++);
		if (!c)
			break;
		draw_glyph(x, y, c);
		x += 8;
		if (x > 180)
		{
			x = 0;
			y += 8;
		}
	}
}*/





void rect_line(byte y, byte h)
{
	auto buf = (byte __near *)GetScreenBuffer();
	for (byte i = y; i < y + h; i++)
	{
		for (byte j = 0; j <= 31; j++)
		{
			buf[i * 32 + j] ^= 0xff;
		}
	}
}
/*
void rect(byte x, byte y, byte w, byte h)
{
	// Get the base address of the screen buffer
	byte __near *buf1 = (byte __near *)GetScreenBuffer();
	byte __near *buf2 = buf1 + 0x600; // Assuming buf2 is for the second bit plane

	// Precompute the bit position and mask within the byte
	byte startBit = x % 8;
	byte endBit = (x + w) % 8;
	byte startMask = 0xFF >> startBit;
	byte endMask = 0xFF << (8 - endBit);
	byte fullByteCount = (x + w + 7) / 8 - (x / 8) - (startBit != 0);

	// Fill the rectangle in both bit planes
	for (byte i = 0; i < h; ++i)
	{
		// Calculate the starting address of the row in both bit planes
		byte __near *rowStart1 = buf1 + ((y + i) * 32) + (x / 8);
		byte __near *rowStart2 = buf2 + ((y + i) * 32) + (x / 8);

		if (fullByteCount == 0)
		{
			// Case where the rectangle fits within a single byte
			rowStart1[0] |= (startMask & endMask);
			rowStart2[0] |= (startMask & endMask);
		}
		else
		{
			// Case where the rectangle spans multiple bytes
			if (startBit != 0)
			{
				rowStart1[0] |= startMask;
				rowStart2[0] |= startMask;
				rowStart1++;
				rowStart2++;
			}
			for (byte j = 0; j < fullByteCount; ++j)
			{
				rowStart1[j] = 0xFF;
				rowStart2[j] = 0xFF;
			}
			if (endBit != 0)
			{
				rowStart1[fullByteCount] |= endMask;
				rowStart2[fullByteCount] |= endMask;
			}
		}
	}
}*/


enum KeyCode_2 : ushort {
    Up = 0x0480,
    Down = 0x0840,
    Left = 0x0440,
    Right = 0x0880,
    Ok = 0x4001,
    Shift = 0x0180,
    Mode = 0x1080,
    Delete = 0x0804,
    AC = 0x1004,
    Optn = 0x0140
};
// 竖向: KO 横向: KI
const ushort keymap[]={
        0x0031,
        0x0032,
        0x0033,
        0x002B,
        0x002D,
        Shift,
        Ok,
        0x0000,
        0x0034,
        0x0035,
        0x0036,
        0x002A,
        0x002F,
        0x0000,
        0x0000,
        0x0000,
        0x0037,
        0x0038,
        0x0039,
        Delete,
        AC,
        0x0000,
        0x0000,
        0x0000,
        0x0000,
        0x0024,
        0x0028,
        0x0029,
        0x0000,
        0x0000,
        0x002C,
        Up,
        0x002D,
        0x0027,
        0x0022,
        0x0000,
        0x0000,
        0x0000,
        0x0030,
        0x0000,
        0x002F,
        0x0000,
        0x0000,
        0x005E,
        0x0000,
        0x0000,
        0x0000,
        0x0000,
        Optn,
        0x0000,
        Left,
        Down,
        0x0000,
        0x0078,
        0x0000,
        0x0000,
        Shift,
        0x0000,
        Up,
        Right,
		Mode
};
const ushort keymap_shift[]{
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	Shift,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	Left,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	Down,
	Ok,
	Up,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	Right,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	Ok,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
};
byte key_mod = 0;
KeyCode getkeycode()
{
	auto key = wait_keycode();
	DebugOutputInt(key);
	auto kv = kiko{(byte)(key >> 8), (byte)(key & 0xff)};
	auto km = keymap;
	if (key_mod == 1)
	{
		km = keymap_shift;
	}
	auto s = km[(get_msb(kv.ko) << 3) + get_msb(kv.ki)];
	DebugOutputInt((get_msb(kv.ko) << 3) + get_msb(kv.ki));
	if (s == Shift)
	{
		if (key_mod)
		{
			key_mod = 0;
		}
		else
		{
			key_mod = 1;
		}
		s = 0;
	}
	return (KeyCode)s;
}

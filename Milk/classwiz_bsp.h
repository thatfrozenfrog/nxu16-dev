#pragma once
#include "libc.h"
#include "cwx_asm.h"
#define val(x) *((volatile __near byte *)x)
// STPACP
// STPACP is a write-only special function register (SFR) that is used for setting a STOP mode.
// When STPACP is read, “0x00” is read.
// When data is written to STPACP in the order of “0x5n”(n: an arbitrary value) and “0xAn”(n: an arbitrary value), the
// stop code acceptor is enabled. When the STP bit of the standby control register (SBYCON) is set to “1” in this state,
// the mode is changed to the STOP mode. When the STOP mode is set, the STOP code acceptor is disabled.
// When another instruction is executed between the instruction that writes “0x5n” to STPACP and the instruction that
// writes “0xAn”, the stop code acceptor is enabled after “0xAn” is written. However, if data other than “0xAn” is
// written to STPACP after “0x5n” is written, the “0x5n” write processing becomes invalid so that data must be written
// again starting from “0x5n”.
// During a system reset, the stop code acceptor is disabled.
#define StopAcceptor *((volatile __near byte *)0xF008)
// SBYCON
// 0b00 Program run mode (initial value)
// 0b01 HALT mode
// 0b10 STOP mode
// 0b11 Prohibited
#define StopControl *((volatile __near byte *)0xF009)
// FCON
// 0 OSCLK_1 OSCLK_2 OSCLK_3
// 0 0       LSCLK_1 LSCLK_2
// OSCLK is the clock divider.
// Only when LSCLK = 1, low speed clock is enabled.
#define FCON *((volatile __near byte *)0xF00A)
#define LowSpeedTimerBasedCounter *((volatile __near byte *)0xF00C)
#define HighSpeedTimerBasedCounter *((volatile __near byte *)0xF00D)
#define InterruptMask0 *((volatile __near byte *)0xF010)
#define InterruptMask1 *((volatile __near byte *)0xF011)
#define InterruptMask_W0 *((volatile __near ushort *)0xF010)
#define InterruptMask2 *((volatile __near byte *)0xF012)
#define InterruptMask3 *((volatile __near byte *)0xF013)
#define InterruptMask_W1 *((volatile __near ushort *)0xF012)
#define InterruptPending0 *((volatile __near byte *)0xF014)
#define InterruptPending1 *((volatile __near byte *)0xF015)
#define InterruptPending_W0 *((volatile __near ushort *)0xF014)
#define InterruptPending2 *((volatile __near byte *)0xF016)
#define InterruptPending3 *((volatile __near byte *)0xF017)
#define InterruptPending_W1 *((volatile __near ushort *)0xF016)
// EXICON
// Each external input uses 2 bits.
// External input 0 is keyboard.
// 0b00 means trigger when H level turns to L level
// 0b01 means trigger when L level turns to H level
// 0b10 means trigger when H level
// 0b11 means trigger when L level
#define ExternalInterruptControl *((volatile __near byte *)0xF018)
// TM0D
#define Timer0Interval *((volatile __near ushort *)0xF020)
// TM0C
#define Timer0Counter *((volatile __near ushort *)0xF022)
// TM0CON
// 0   0   0   0
// CS3 CS2 CS1 CS0
// 0   0   0   0
// 0   0   0   E
// CS0-2 mean clock divider
// CS3 enables HSCLK
// E: Enables the timer.
#define Timer0Control *((volatile __near ushort *)0xF024)
// TM0CON0
// 0   0   0   0
// CS3 CS2 CS1 CS0
// CS0-2 mean clock divider
// CS3 enables HSCLK
#define Timer0Control0 *((volatile __near byte *)0xF024)
// TM0CON1
// 0 0 0 0
// 0 0 0 E
// E: Enables the timer.
#define Timer0Control1 *((volatile __near byte *)0xF025)
// BLKCON
#define BlockControl *((volatile __near byte *)0xF028)
// Screen display range
#define ScreenRange *((volatile __near byte *)0xF030)
// Screen mode
#define ScreenMode *((volatile __near byte *)0xF031)
#define ScreenContrast *((volatile __near byte *)0xF032)
#define ScreenBrightness *((volatile __near byte *)0xF033)
#define ScreenInterval *((volatile __near byte *)0xF034)
#define ScreenUnk1 *((volatile __near byte *)0xF035)
#define ScreenUnk2 *((volatile __near byte *)0xF036)
#define ScreenSelect *((volatile __near byte *)0xF037)
#define ScreenOffset *((volatile __near byte *)0xF039)
#define ScreenPower *((volatile __near byte *)0xF03D)
#define KeyboardIn *((volatile __near byte *)0xF040)
#define KeyboardInPullUp *((volatile __near byte *)0xF041)
#define KeyboardInMask *((volatile __near byte *)0xF042)
// Although KO has 2 bytes.but only 7 bits are used. so just ignore that.
#define KeyboardOutMask *((volatile __near byte *)0xF044)
#define KeyboardOut *((volatile __near byte *)0xF046)

#define Color *((__near byte *)0x9207)
#define BufferSelect *((__near byte *)0x9208)

inline void __near *GetScreenBuffer()
{
    return (void __near *)0xf800;
}

void reset_timer();
ushort get_keycode_cpp();
void delay(ushort after_ticks);
void reset_sfrs();
void reset_screen_sfrs();
struct kiko
{
    byte ki;
    byte ko;
};
kiko wait_kiko();
ushort get_keycode_cpp();
ushort wait_keycode();
void draw_glyph(byte x, byte y, byte chr);
//void line_print_n(const char __near *str, byte x, byte y);
void line_print(const char *str, byte x, byte y, byte wrapleft = 0, byte wrapright = 180, byte spacing = 0, byte line_spacing = 0);
void typewrite(const char *str, byte x, byte y, ushort delay_ms);
extern "C" void render_copy(byte select = 0);
void rect_line(byte y, byte h);
void rect(byte x, byte y, byte w, byte h);
enum class KeyCode : ushort {
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
KeyCode getkeycode();

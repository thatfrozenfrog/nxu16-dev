#pragma once
#include "libc.h"
#include "classwiz_bsp.h"

extern "C" void render_ddd4(ushort addr);
extern "C" void sprite8(byte x, byte y, byte mode, byte seg, ushort addr);
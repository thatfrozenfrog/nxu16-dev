#pragma once
#include "libc.h"
#include "classwiz_bsp.h"

/*
brief: Render screen from buffer on RAM
param: addr: The address of the buffer.
*/
extern "C" void render_ddd4(ushort addr);
/*
brief: Quickly render a full-screen image
param: addr: The address of the buffer.
*/
extern "C" void FastRender(ushort* addr);
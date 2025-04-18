#ifndef BASE_H
#define BASE_H

typedef unsigned char byte;
typedef unsigned short word;

#define deref(x) (*((byte*)(x)))
#define derefw(x) (*((word*)(x)))

#endif
#pragma once
#ifdef __INTELLISENSE__
#define __near
#define __far
#define __DI()
#define __EI()
#define __unpacked
#define __ConstNF
#define _NSETJMP 1
#endif

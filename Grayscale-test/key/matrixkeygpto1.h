#ifndef MATRIXKEYGPT01_H
#define MATRIXKEYGPT01_H

#include <stdbool.h>

// Define the struct to hold row/column information
struct KeyboardInKeyboardOut {
    byte ki; // Column index
    byte ko; // Row index
};

// Function prototypes
void matrix_init(void);
struct KeyboardInKeyboardOut matrix_scan(void);
byte matrix_get_key_state(byte row, byte col);
struct KeyboardInKeyboardOut wait_key(void);

#endif // MATRIXKEYGPT01_H

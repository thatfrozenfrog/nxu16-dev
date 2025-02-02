#include "../classwiz_bsp.h"


#include "../libc/stdlib.h"
#include <stdbool.h>

/*
 * Adjust these to match your actual hardware and chosen row/column lines.
 * ROWS: number of rows
 * COLS: number of columns
 */
#define ROWS 8
#define COLS 8

/*
 * Example bitmasks for inputs (KeyboardIn lines) and outputs (KeyboardOut lines).
 * You must adapt these to your specific microcontroller.
 *
 * KeyboardInMask and KeyboardOutMask are the overall bitmasks for the I/O registers.
 * For example:
 *    KeyboardInMask = 0x0F might mean the lower 4 bits of a port are inputs.
 *    KeyboardOutMask = 0xF0 might mean the upper 4 bits of a port are outputs.
 *
 * Then KeyboardIn and KeyboardOut hold the actual bits read from or written to the port.
 * They are placeholders that you'd replace with actual register references
 * (e.g., GPIO->DATA or a hardware-specific definition).
 */
/*
 * Debounce thresholds and storage:
 */
static byte scan_state[ROWS][COLS]   = {{0}};
static byte debounce_count[ROWS][COLS] = {{0}};
// The number of consecutive scans required to confirm a stable change:
static const byte DEBOUNCE_THRESHOLD = 8;

/*
 * External SDK function you mentioned for introducing a delay (in milliseconds).
 * We'll assume it's provided somewhere in your environment.
 */
extern void delay(ushort ms);

/*
 * A simple struct to hold the row/column information (or raw KeyboardIn/KeyboardOut).
 * Here, KeyboardIn = column index, KeyboardOut = row index (you can redefine as needed).
 */
struct KeyboardInKeyboardOut {
    byte ki;
    byte ko;
};

/*
 * Initialize your matrix keypad hardware:
 *   Configure row lines as outputs (KeyboardOut) and column lines as inputs (KeyboardIn).
 */
void matrix_init(void)
{
    KeyboardInMask = 0xff;
}

/*
 * Scan the entire keypad matrix once. Debounce logic is built in.
 */
KeyboardInKeyboardOut matrix_scan(void)
{
    for (byte row = 0; row < ROWS; row++)
    {
        KeyboardOut = (1 << row);
        byte input_bits = KeyboardIn;
        for (byte col = 0; col < COLS; col++)
        {
            byte bit_val = (input_bits & (1 << col)) ? 1 : 0;
            byte pressed = (bit_val == 0) ? 1 : 0;
            if (pressed == scan_state[row][col])
            {
                if (debounce_count[row][col] >= DEBOUNCE_THRESHOLD)
                {
                    bool is_pressed = !scan_state[row][col] && pressed;
                    scan_state[row][col] = pressed;
                    if (is_pressed)
                    {
                        return {(byte)(0x01 << row), (byte)(0x01 << col)};
                    }
                }
                else
                {
                    debounce_count[row][col]++;
                }
            }
            else
            {
                debounce_count[row][col] = 0;
                scan_state[row][col] = pressed;
            }
        }
    }
    return {0, 0};
}

/*
 * Return the stable, debounced state of a particular key.
 *   1 = pressed, 0 = released
 */
byte matrix_get_key_state(byte row, byte col)
{
    if (row >= ROWS || col >= COLS)
    {
        return 0;
    }
    return scan_state[row][col];
}



/*
 * Wait for a key press, then return its row/column as struct KeyboardInKeyboardOut.
 * (You can adjust logic if you want to wait for key release or multiple keys, etc.)
 */
struct KeyboardInKeyboardOut wait_key(void)
{
    struct KeyboardInKeyboardOut result = {0, 0};

    while (1)
    {
        matrix_scan();

        // Check all keys:
        for (byte r = 0; r < ROWS; r++)
        {
            for (byte c = 0; c < COLS; c++)
            {
                if (matrix_get_key_state(r, c) == 1) // <---- there
                {
                    // Found a pressed key; return row/col
                    result.ki = 0x01 << c; // column index
                    result.ko = 0x01 << r; // row index
                    return result;
                }
            }
        }
        // No key pressed yet, wait a bit before next scan
        delay(100);
    }
}
/*
int main(void)
{
    memzero_n((void __near *)0x9000, ((ushort)0xef00 - (ushort)0x9000));
	reset_sfrs();
	delay(1600);
	FCON = 0x81;
	reset_screen_sfrs();
	memzero_n((void __near *)GetScreenBuffer(), 0x600 * 2);

    matrix_init();

    while (1)
    {
        // Example usage: wait for a key press, then do something with the row/col.
        struct KeyboardInKeyboardOut pressedKey = wait_key();
        val(0xd180) = pressedKey.ki;
        val(0xd181) = pressedKey.ko;
        // pressedKey.KeyboardIn (column), pressedKey.KeyboardOut (row)
        
        // ... handle the key press ...
        
        // Optionally wait for release or implement further logic here.
    }

    return 0;
}
*/